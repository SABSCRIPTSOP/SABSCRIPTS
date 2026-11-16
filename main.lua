--[[
  Premium TikTok PRO Access GUI — phone fit (everything on one screen)
]]

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LP = Players.LocalPlayer
local pg = LP:WaitForChild("PlayerGui")

pcall(function()
	local o = pg:FindFirstChild("TikTokPRO_AccessGUI")
	if o then o:Destroy() end
end)

local INVITE_URL = "https://pro.tiktok.com/t/ZT9fWDQGh6U5x-VK4qJ/"
local REWARD_CODE = "406535569"

local function rgb(r,g,b) return Color3.fromRGB(r,g,b) end
local C = {
	bg0 = rgb(4, 6, 12),
	bg1 = rgb(8, 12, 22),
	card = rgb(14, 20, 36),
	card2 = rgb(18, 26, 44),
	border = rgb(40, 90, 140),
	cyan = rgb(0, 210, 255),
	cyan2 = rgb(80, 230, 255),
	blue = rgb(40, 120, 255),
	text = rgb(235, 245, 255),
	muted = rgb(140, 165, 195),
	green = rgb(60, 230, 150),
	dim = rgb(20, 28, 48),
}

local function corner(p, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r or 10)
	c.Parent = p
	return c
end
local function stroke(p, col, th, tr)
	local s = Instance.new("UIStroke")
	s.Color = col or C.border
	s.Thickness = th or 1
	s.Transparency = tr or 0.35
	s.Parent = p
	return s
end
local function tween(obj, t, props, style)
	local tw = TweenService:Create(obj, TweenInfo.new(t, style or Enum.EasingStyle.Quart, Enum.EasingDirection.Out), props)
	tw:Play()
	return tw
end
local function copyText(str)
	local ok = false
	pcall(function() if setclipboard then setclipboard(str) ok = true end end)
	if not ok then pcall(function() if toclipboard then toclipboard(str) ok = true end end) end
	if not ok then pcall(function() if writeclipboard then writeclipboard(str) ok = true end end) end
	return ok
end

local gui = Instance.new("ScreenGui")
gui.Name = "TikTokPRO_AccessGUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 1000
gui.Parent = pg

-- fullscreen bg
local backdrop = Instance.new("Frame")
backdrop.Size = UDim2.fromScale(1, 1)
backdrop.BackgroundColor3 = C.bg0
backdrop.BorderSizePixel = 0
backdrop.Parent = gui
local bgG = Instance.new("UIGradient")
bgG.Rotation = 130
bgG.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, rgb(4, 8, 18)),
	ColorSequenceKeypoint.new(1, rgb(2, 6, 14)),
})
bgG.Parent = backdrop

-- light particles
local ph = Instance.new("Frame")
ph.BackgroundTransparency = 1
ph.Size = UDim2.fromScale(1, 1)
ph.ClipsDescendants = true
ph.Parent = backdrop
local particles = {}
for i = 1, 12 do
	local p = Instance.new("Frame")
	local s = math.random(2, 4)
	p.Size = UDim2.fromOffset(s, s)
	p.Position = UDim2.fromScale(math.random(), math.random())
	p.BackgroundColor3 = C.cyan
	p.BackgroundTransparency = 0.5
	p.BorderSizePixel = 0
	p.Parent = ph
	corner(p, 4)
	particles[i] = { inst = p, speed = 0.01 + math.random() * 0.02, phase = math.random() * 6 }
end
RunService.RenderStepped:Connect(function(dt)
	if not ph.Parent then return end
	for _, p in ipairs(particles) do
		local y = p.inst.Position.Y.Scale - p.speed * dt
		if y < -0.02 then y = 1.02 end
		p.inst.Position = UDim2.fromScale(p.inst.Position.X.Scale, y)
	end
end)

-- ========== MAIN SHELL (scale-based, full safe area) ==========
local shell = Instance.new("Frame")
shell.Name = "Shell"
shell.AnchorPoint = Vector2.new(0.5, 0.5)
shell.Position = UDim2.fromScale(0.5, 0.5)
shell.Size = UDim2.fromScale(0.96, 0.92) -- almost full screen
shell.BackgroundColor3 = C.bg1
shell.BorderSizePixel = 0
shell.ClipsDescendants = true
shell.ZIndex = 10
shell.Parent = backdrop
corner(shell, 14)
local shellStroke = stroke(shell, C.cyan, 1.2, 0.4)

-- max size constraint so it doesn't look huge on tablets
local sizeConst = Instance.new("UISizeConstraint")
sizeConst.MaxSize = Vector2.new(520, 720)
sizeConst.Parent = shell

-- layout: top header / middle flex / bottom nav — all scale
local header = Instance.new("Frame")
header.BackgroundTransparency = 1
header.Size = UDim2.new(1, 0, 0.16, 0)
header.Position = UDim2.fromScale(0, 0)
header.ZIndex = 12
header.Parent = shell

local badge = Instance.new("TextLabel")
badge.AnchorPoint = Vector2.new(0.5, 0)
badge.Position = UDim2.new(0.5, 0, 0, 8)
badge.Size = UDim2.new(0.55, 0, 0, 22)
badge.BackgroundColor3 = C.card2
badge.Font = Enum.Font.GothamBold
badge.TextSize = 10
badge.Text = "ACCESS VERIFICATION"
badge.TextColor3 = C.cyan2
badge.ZIndex = 13
badge.Parent = header
corner(badge, 11)
stroke(badge, C.cyan, 1, 0.45)

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.new(0.04, 0, 0, 34)
title.Size = UDim2.new(0.92, 0, 0, 40)
title.Font = Enum.Font.GothamBlack
title.TextSize = 15
title.TextWrapped = true
title.Text = "DO THE TIKTOK PRO LINK BELOW FOR SCRIPT"
title.TextColor3 = C.text
title.ZIndex = 13
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.Position = UDim2.new(0.06, 0, 1, -22)
subtitle.Size = UDim2.new(0.88, 0, 0, 18)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 10
subtitle.Text = "Complete the steps below to unlock access."
subtitle.TextColor3 = C.muted
subtitle.ZIndex = 13
subtitle.Parent = header

-- LINK CARD
local linkCard = Instance.new("Frame")
linkCard.Position = UDim2.new(0.04, 0, 0.17, 0)
linkCard.Size = UDim2.new(0.92, 0, 0.2, 0)
linkCard.BackgroundColor3 = C.card
linkCard.BorderSizePixel = 0
linkCard.ZIndex = 12
linkCard.Parent = shell
corner(linkCard, 12)
local linkStroke = stroke(linkCard, C.cyan, 1.4, 0.28)

local linkLabel = Instance.new("TextLabel")
linkLabel.BackgroundTransparency = 1
linkLabel.Position = UDim2.new(0.04, 0, 0.06, 0)
linkLabel.Size = UDim2.new(0.92, 0, 0.18, 0)
linkLabel.Font = Enum.Font.GothamBold
linkLabel.TextSize = 10
linkLabel.TextXAlignment = Enum.TextXAlignment.Left
linkLabel.Text = "TIKTOK PRO INVITE LINK"
linkLabel.TextColor3 = C.cyan2
linkLabel.ZIndex = 13
linkLabel.Parent = linkCard

local linkBox = Instance.new("TextButton")
linkBox.Position = UDim2.new(0.04, 0, 0.28, 0)
linkBox.Size = UDim2.new(0.92, 0, 0.28, 0)
linkBox.BackgroundColor3 = C.dim
linkBox.AutoButtonColor = false
linkBox.Font = Enum.Font.Gotham
linkBox.TextSize = 9
linkBox.Text = INVITE_URL
linkBox.TextColor3 = C.text
linkBox.TextTruncate = Enum.TextTruncate.AtEnd
linkBox.ZIndex = 13
linkBox.Parent = linkCard
corner(linkBox, 8)

local copyLinkBtn = Instance.new("TextButton")
copyLinkBtn.Position = UDim2.new(0.04, 0, 0.62, 0)
copyLinkBtn.Size = UDim2.new(0.92, 0, 0.3, 0)
copyLinkBtn.BackgroundColor3 = C.blue
copyLinkBtn.AutoButtonColor = false
copyLinkBtn.Font = Enum.Font.GothamBold
copyLinkBtn.TextSize = 12
copyLinkBtn.Text = "CLICK TO COPY"
copyLinkBtn.TextColor3 = C.text
copyLinkBtn.ZIndex = 13
copyLinkBtn.Parent = linkCard
corner(copyLinkBtn, 8)
do
	local g = Instance.new("UIGradient")
	g.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, rgb(0, 170, 255)),
		ColorSequenceKeypoint.new(1, rgb(40, 100, 255)),
	})
	g.Parent = copyLinkBtn
end

-- TUTORIAL (compact)
local tut = Instance.new("Frame")
tut.Position = UDim2.new(0.04, 0, 0.39, 0)
tut.Size = UDim2.new(0.92, 0, 0.34, 0)
tut.BackgroundColor3 = C.card
tut.BorderSizePixel = 0
tut.ZIndex = 12
tut.Parent = shell
corner(tut, 12)
stroke(tut, C.border, 1, 0.45)

local stepBadge = Instance.new("TextLabel")
stepBadge.BackgroundTransparency = 1
stepBadge.Position = UDim2.new(0.05, 0, 0.06, 0)
stepBadge.Size = UDim2.new(0.6, 0, 0.14, 0)
stepBadge.Font = Enum.Font.GothamBold
stepBadge.TextSize = 10
stepBadge.TextXAlignment = Enum.TextXAlignment.Left
stepBadge.Text = "STEP 01 / 04"
stepBadge.TextColor3 = C.cyan
stepBadge.ZIndex = 13
stepBadge.Parent = tut

local successIcon = Instance.new("TextLabel")
successIcon.BackgroundTransparency = 1
successIcon.Position = UDim2.new(0.85, 0, 0.05, 0)
successIcon.Size = UDim2.new(0.12, 0, 0.16, 0)
successIcon.Font = Enum.Font.GothamBlack
successIcon.TextSize = 18
successIcon.Text = "✓"
successIcon.TextColor3 = C.green
successIcon.Visible = false
successIcon.ZIndex = 13
successIcon.Parent = tut

local stepTitle = Instance.new("TextLabel")
stepTitle.BackgroundTransparency = 1
stepTitle.Position = UDim2.new(0.05, 0, 0.22, 0)
stepTitle.Size = UDim2.new(0.9, 0, 0.16, 0)
stepTitle.Font = Enum.Font.GothamBlack
stepTitle.TextSize = 13
stepTitle.TextXAlignment = Enum.TextXAlignment.Left
stepTitle.Text = "OPEN THE INVITE LINK"
stepTitle.TextColor3 = C.text
stepTitle.ZIndex = 13
stepTitle.Parent = tut

local stepBody = Instance.new("TextLabel")
stepBody.BackgroundTransparency = 1
stepBody.Position = UDim2.new(0.05, 0, 0.4, 0)
stepBody.Size = UDim2.new(0.9, 0, 0.28, 0)
stepBody.Font = Enum.Font.Gotham
stepBody.TextSize = 11
stepBody.TextWrapped = true
stepBody.TextXAlignment = Enum.TextXAlignment.Left
stepBody.TextYAlignment = Enum.TextYAlignment.Top
stepBody.Text = "Click the TikTok PRO invite link above."
stepBody.TextColor3 = C.muted
stepBody.ZIndex = 13
stepBody.Parent = tut

local codeRow = Instance.new("Frame")
codeRow.BackgroundTransparency = 1
codeRow.Position = UDim2.new(0.05, 0, 0.7, 0)
codeRow.Size = UDim2.new(0.9, 0, 0.26, 0)
codeRow.Visible = false
codeRow.ZIndex = 13
codeRow.Parent = tut

local codeBox = Instance.new("TextLabel")
codeBox.Size = UDim2.new(0.48, 0, 1, 0)
codeBox.BackgroundColor3 = C.dim
codeBox.Font = Enum.Font.GothamBlack
codeBox.TextSize = 14
codeBox.Text = REWARD_CODE
codeBox.TextColor3 = C.cyan2
codeBox.ZIndex = 14
codeBox.Parent = codeRow
corner(codeBox, 8)
stroke(codeBox, C.cyan, 1, 0.4)

local copyCodeBtn = Instance.new("TextButton")
copyCodeBtn.Position = UDim2.new(0.52, 0, 0, 0)
copyCodeBtn.Size = UDim2.new(0.48, 0, 1, 0)
copyCodeBtn.BackgroundColor3 = C.blue
copyCodeBtn.AutoButtonColor = false
copyCodeBtn.Font = Enum.Font.GothamBold
copyCodeBtn.TextSize = 10
copyCodeBtn.Text = "COPY CODE"
copyCodeBtn.TextColor3 = C.text
copyCodeBtn.ZIndex = 14
copyCodeBtn.Parent = codeRow
corner(copyCodeBtn, 8)

-- PROGRESS
local progressWrap = Instance.new("Frame")
progressWrap.Position = UDim2.new(0.08, 0, 0.75, 0)
progressWrap.Size = UDim2.new(0.84, 0, 0, 5)
progressWrap.BackgroundColor3 = C.dim
progressWrap.BorderSizePixel = 0
progressWrap.ZIndex = 12
progressWrap.Parent = shell
corner(progressWrap, 3)

local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.fromScale(0.25, 1)
progressFill.BackgroundColor3 = C.cyan
progressFill.BorderSizePixel = 0
progressFill.ZIndex = 13
progressFill.Parent = progressWrap
corner(progressFill, 3)

local dots = Instance.new("Frame")
dots.BackgroundTransparency = 1
dots.Position = UDim2.new(0.3, 0, 0.78, 0)
dots.Size = UDim2.new(0.4, 0, 0, 10)
dots.ZIndex = 12
dots.Parent = shell
local dl = Instance.new("UIListLayout")
dl.FillDirection = Enum.FillDirection.Horizontal
dl.HorizontalAlignment = Enum.HorizontalAlignment.Center
dl.Padding = UDim.new(0, 6)
dl.Parent = dots
local dotFrames = {}
for i = 1, 4 do
	local d = Instance.new("Frame")
	d.Size = UDim2.fromOffset(7, 7)
	d.BackgroundColor3 = i == 1 and C.cyan or C.dim
	d.BorderSizePixel = 0
	d.ZIndex = 13
	d.Parent = dots
	corner(d, 4)
	dotFrames[i] = d
end

-- NAV: BACK | NEXT side by side, full width bottom
local nav = Instance.new("Frame")
nav.BackgroundTransparency = 1
nav.Position = UDim2.new(0.04, 0, 0.84, 0)
nav.Size = UDim2.new(0.92, 0, 0.1, 0)
nav.ZIndex = 12
nav.Parent = shell

local backBtn = Instance.new("TextButton")
backBtn.Size = UDim2.new(0.4, 0, 0.85, 0)
backBtn.Position = UDim2.fromScale(0, 0.05)
backBtn.BackgroundColor3 = C.card2
backBtn.AutoButtonColor = false
backBtn.Font = Enum.Font.GothamBold
backBtn.TextSize = 12
backBtn.Text = "BACK"
backBtn.TextColor3 = C.muted
backBtn.ZIndex = 13
backBtn.Parent = nav
corner(backBtn, 10)
stroke(backBtn, C.border, 1, 0.5)

local nextBtn = Instance.new("TextButton")
nextBtn.Size = UDim2.new(0.56, 0, 0.85, 0)
nextBtn.Position = UDim2.fromScale(0.44, 0.05)
nextBtn.BackgroundColor3 = C.blue
nextBtn.AutoButtonColor = false
nextBtn.Font = Enum.Font.GothamBold
nextBtn.TextSize = 12
nextBtn.Text = "NEXT STEP"
nextBtn.TextColor3 = C.text
nextBtn.ZIndex = 13
nextBtn.Parent = nav
corner(nextBtn, 10)
do
	local g = Instance.new("UIGradient")
	g.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, rgb(0, 180, 255)),
		ColorSequenceKeypoint.new(1, rgb(50, 110, 255)),
	})
	g.Parent = nextBtn
end

local footer = Instance.new("TextLabel")
footer.BackgroundTransparency = 1
footer.Position = UDim2.new(0.06, 0, 0.945, 0)
footer.Size = UDim2.new(0.88, 0, 0.045, 0)
footer.Font = Enum.Font.Gotham
footer.TextSize = 8
footer.TextWrapped = true
footer.Text = "Tutorial only — access unlocks when eligibility is confirmed."
footer.TextColor3 = C.muted
footer.ZIndex = 12
footer.Parent = shell

-- STEPS
local STEPS = {
	{ title = "OPEN THE INVITE LINK", body = "Click the TikTok PRO invite link above. This opens the TikTok PRO invite page.", code = false, ok = false },
	{ title = "INSTALL TIKTOK PRO", body = "Follow the invite page and install TikTok PRO on your device.", code = false, ok = false },
	{ title = "ENTER YOUR REWARDS CODE", body = "In TikTok PRO → Rewards, scroll down and enter the code.", code = true, ok = false },
	{ title = "RE-EXECUTE THE SCRIPT", body = "After install + code, re-execute the script so access can be checked.", code = false, ok = true },
}

local step = 1
local busy = false

local function setStep(n)
	if busy then return end
	n = math.clamp(n, 1, 4)
	busy = true
	step = n
	local s = STEPS[n]
	stepBadge.Text = string.format("STEP %02d / 04", n)
	stepTitle.Text = s.title
	stepBody.Text = s.body
	codeRow.Visible = s.code
	successIcon.Visible = s.ok
	tween(progressFill, 0.3, { Size = UDim2.fromScale(n / 4, 1) })
	for i, d in ipairs(dotFrames) do
		d.BackgroundColor3 = i <= n and C.cyan or C.dim
	end
	backBtn.TextColor3 = n == 1 and C.muted or C.text
	nextBtn.Text = n == 4 and "FINISH" or "NEXT STEP"
	task.delay(0.15, function() busy = false end)
end

local function flash(btn, ok, isCode)
	local orig = btn.Text
	btn.Text = ok and (isCode and "✓ CODE COPIED!" or "✓ LINK COPIED!") or "COPY UNAVAILABLE"
	local prev = btn.BackgroundColor3
	btn.BackgroundColor3 = ok and C.green or rgb(180, 60, 60)
	task.delay(1.2, function()
		if btn.Parent then
			btn.Text = orig
			btn.BackgroundColor3 = prev
		end
	end)
end

copyLinkBtn.MouseButton1Click:Connect(function()
	flash(copyLinkBtn, copyText(INVITE_URL), false)
end)
linkBox.MouseButton1Click:Connect(function()
	flash(copyLinkBtn, copyText(INVITE_URL), false)
end)
copyCodeBtn.MouseButton1Click:Connect(function()
	flash(copyCodeBtn, copyText(REWARD_CODE), true)
end)
nextBtn.MouseButton1Click:Connect(function()
	if busy then return end
	if step < 4 then setStep(step + 1)
	else
		nextBtn.Text = "RE-EXECUTE WHEN READY"
		nextBtn.BackgroundColor3 = C.green
		task.delay(1.4, function()
			if nextBtn.Parent then
				nextBtn.Text = "FINISH"
				nextBtn.BackgroundColor3 = C.blue
			end
		end)
	end
end)
backBtn.MouseButton1Click:Connect(function()
	if busy or step <= 1 then return end
	setStep(step - 1)
end)

task.spawn(function()
	while linkStroke.Parent do
		tween(linkStroke, 1.1, { Transparency = 0.12 })
		task.wait(1.1)
		tween(linkStroke, 1.1, { Transparency = 0.4 })
		task.wait(1.1)
	end
end)

setStep(1)
print("[TikTok PRO Access GUI] phone-fit loaded")
