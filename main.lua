--[[
  SAB Scripts — Premium TikTok PRO Access Gate
  Fullscreen · glass · phone-fit · smooth motion
]]

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local LP = Players.LocalPlayer
local pg = LP:WaitForChild("PlayerGui")

pcall(function()
	local o = pg:FindFirstChild("TikTokPRO_AccessGUI")
	if o then o:Destroy() end
end)

local INVITE_URL = "https://pro.tiktok.com/t/ZT9PeJjPWj8oU-6ZAga/"
local REWARD_CODE = "859286658"

local function rgb(r, g, b) return Color3.fromRGB(r, g, b) end
local C = {
	void = rgb(3, 5, 12),
	panel = rgb(10, 14, 28),
	card = rgb(16, 22, 42),
	cardHi = rgb(22, 30, 54),
	line = rgb(50, 120, 200),
	cyan = rgb(0, 220, 255),
	cyanSoft = rgb(120, 235, 255),
	blue = rgb(35, 110, 255),
	blueDeep = rgb(20, 70, 200),
	text = rgb(240, 248, 255),
	muted = rgb(130, 155, 185),
	green = rgb(55, 235, 160),
	amber = rgb(255, 190, 70),
	dim = rgb(12, 18, 34),
}

local function corner(p, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r or 12)
	c.Parent = p
	return c
end
local function stroke(p, col, th, tr)
	local s = Instance.new("UIStroke")
	s.Color = col or C.line
	s.Thickness = th or 1
	s.Transparency = tr or 0.4
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s.Parent = p
	return s
end
local function pad(p, t, b, l, r)
	local u = Instance.new("UIPadding")
	u.PaddingTop = UDim.new(0, t or 0)
	u.PaddingBottom = UDim.new(0, b or t or 0)
	u.PaddingLeft = UDim.new(0, l or 0)
	u.PaddingRight = UDim.new(0, r or l or 0)
	u.Parent = p
	return u
end
local function tween(o, t, props, style, dir)
	local tw = TweenService:Create(o, TweenInfo.new(t, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out), props)
	tw:Play()
	return tw
end
local function copyText(str)
	for _, fn in ipairs({ setclipboard, toclipboard, writeclipboard }) do
		if type(fn) == "function" then
			local ok = pcall(fn, str)
			if ok then return true end
		end
	end
	return false
end
local function glowPulse(strokeObj)
	task.spawn(function()
		while strokeObj and strokeObj.Parent do
			tween(strokeObj, 1.15, { Transparency = 0.12 })
			task.wait(1.15)
			tween(strokeObj, 1.15, { Transparency = 0.5 })
			task.wait(1.15)
		end
	end)
end
local function hoverScale(btn)
	local base = btn.Size
	btn.MouseEnter:Connect(function()
		tween(btn, 0.14, { Size = base + UDim2.fromOffset(2, 2) })
	end)
	btn.MouseLeave:Connect(function()
		tween(btn, 0.14, { Size = base })
	end)
end

-- ===== GUI =====
local gui = Instance.new("ScreenGui")
gui.Name = "TikTokPRO_AccessGUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 2000
gui.Parent = pg

-- Backdrop
local backdrop = Instance.new("Frame")
backdrop.Size = UDim2.fromScale(1, 1)
backdrop.BackgroundColor3 = C.void
backdrop.BackgroundTransparency = 1
backdrop.BorderSizePixel = 0
backdrop.Parent = gui

local bgGrad = Instance.new("UIGradient")
bgGrad.Rotation = 128
bgGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, rgb(4, 8, 20)),
	ColorSequenceKeypoint.new(0.5, rgb(6, 12, 28)),
	ColorSequenceKeypoint.new(1, rgb(2, 5, 14)),
})
bgGrad.Parent = backdrop

-- Ambient orbs
local function orb(size, pos, col, tr)
	local f = Instance.new("Frame")
	f.Size = UDim2.fromOffset(size, size)
	f.Position = pos
	f.AnchorPoint = Vector2.new(0.5, 0.5)
	f.BackgroundColor3 = col
	f.BackgroundTransparency = tr
	f.BorderSizePixel = 0
	f.ZIndex = 1
	f.Parent = backdrop
	corner(f, size)
	local g = Instance.new("UIGradient")
	g.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.15),
		NumberSequenceKeypoint.new(1, 1),
	})
	g.Parent = f
	return f
end
local o1 = orb(380, UDim2.fromScale(0.15, 0.2), C.blue, 0.9)
local o2 = orb(320, UDim2.fromScale(0.88, 0.75), C.cyan, 0.92)
local o3 = orb(240, UDim2.fromScale(0.55, 0.08), C.cyanSoft, 0.94)

-- Particles
local particleHost = Instance.new("Frame")
particleHost.BackgroundTransparency = 1
particleHost.Size = UDim2.fromScale(1, 1)
particleHost.ZIndex = 2
particleHost.ClipsDescendants = true
particleHost.Parent = backdrop
local particles = {}
for i = 1, 20 do
	local p = Instance.new("Frame")
	local s = math.random(2, 5)
	p.Size = UDim2.fromOffset(s, s)
	p.Position = UDim2.fromScale(math.random(), math.random())
	p.BackgroundColor3 = (i % 2 == 0) and C.cyan or C.cyanSoft
	p.BackgroundTransparency = 0.35 + math.random() * 0.4
	p.BorderSizePixel = 0
	p.ZIndex = 2
	p.Parent = particleHost
	corner(p, 6)
	particles[i] = { inst = p, speed = 0.008 + math.random() * 0.025, phase = math.random() * 6.28, amp = 0.003 + math.random() * 0.008 }
end
RunService.RenderStepped:Connect(function(dt)
	if not particleHost.Parent then return end
	for _, p in ipairs(particles) do
		local y = p.inst.Position.Y.Scale - p.speed * dt
		local x = p.inst.Position.X.Scale + math.sin(tick() * 0.6 + p.phase) * p.amp
		if y < -0.02 then y = 1.02 end
		x = math.clamp(x, 0, 1)
		p.inst.Position = UDim2.fromScale(x, y)
	end
end)

-- Shell
local shell = Instance.new("Frame")
shell.Name = "Shell"
shell.AnchorPoint = Vector2.new(0.5, 0.5)
shell.Position = UDim2.fromScale(0.5, 0.52)
shell.Size = UDim2.fromScale(0.94, 0.9)
shell.BackgroundColor3 = C.panel
shell.BackgroundTransparency = 0.08
shell.BorderSizePixel = 0
shell.ClipsDescendants = true
shell.ZIndex = 10
shell.Parent = backdrop
corner(shell, 18)
local shellStroke = stroke(shell, C.cyan, 1.5, 0.45)
glowPulse(shellStroke)

local sizeConst = Instance.new("UISizeConstraint")
sizeConst.MaxSize = Vector2.new(440, 700)
sizeConst.MinSize = Vector2.new(280, 420)
sizeConst.Parent = shell

local shellGrad = Instance.new("UIGradient")
shellGrad.Rotation = 115
shellGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, rgb(12, 18, 34)),
	ColorSequenceKeypoint.new(0.55, rgb(8, 14, 28)),
	ColorSequenceKeypoint.new(1, rgb(6, 10, 22)),
})
shellGrad.Parent = shell

-- Top accent line
local topLine = Instance.new("Frame")
topLine.Size = UDim2.new(1, 0, 0, 2)
topLine.BackgroundColor3 = C.cyan
topLine.BorderSizePixel = 0
topLine.ZIndex = 15
topLine.Parent = shell
local topG = Instance.new("UIGradient")
topG.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.3, 0.1),
	NumberSequenceKeypoint.new(0.7, 0.1),
	NumberSequenceKeypoint.new(1, 1),
})
topG.Parent = topLine

-- ===== HEADER =====
local header = Instance.new("Frame")
header.BackgroundTransparency = 1
header.Size = UDim2.new(1, 0, 0.15, 0)
header.ZIndex = 12
header.Parent = shell
pad(header, 12, 4, 16, 16)

local badge = Instance.new("Frame")
badge.AnchorPoint = Vector2.new(0.5, 0)
badge.Position = UDim2.new(0.5, 0, 0, 4)
badge.Size = UDim2.fromOffset(150, 22)
badge.BackgroundColor3 = C.cardHi
badge.BorderSizePixel = 0
badge.ZIndex = 13
badge.Parent = header
corner(badge, 11)
stroke(badge, C.cyan, 1, 0.4)

local badgeDot = Instance.new("Frame")
badgeDot.Size = UDim2.fromOffset(6, 6)
badgeDot.Position = UDim2.fromOffset(10, 8)
badgeDot.BackgroundColor3 = C.cyan
badgeDot.BorderSizePixel = 0
badgeDot.ZIndex = 14
badgeDot.Parent = badge
corner(badgeDot, 3)

local badgeTxt = Instance.new("TextLabel")
badgeTxt.BackgroundTransparency = 1
badgeTxt.Position = UDim2.fromOffset(20, 0)
badgeTxt.Size = UDim2.new(1, -24, 1, 0)
badgeTxt.Font = Enum.Font.GothamBold
badgeTxt.TextSize = 9
badgeTxt.Text = "SAB  ·  ACCESS GATE"
badgeTxt.TextColor3 = C.cyanSoft
badgeTxt.TextXAlignment = Enum.TextXAlignment.Left
badgeTxt.ZIndex = 14
badgeTxt.Parent = badge

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 0, 0, 30)
title.Size = UDim2.new(1, 0, 0, 36)
title.Font = Enum.Font.GothamBlack
title.TextSize = 15
title.TextWrapped = true
title.Text = "DO THE TIKTOK PRO LINK\nBELOW FOR SCRIPT"
title.TextColor3 = C.text
title.ZIndex = 13
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.BackgroundTransparency = 1
subtitle.Position = UDim2.new(0, 0, 1, -18)
subtitle.Size = UDim2.new(1, 0, 0, 16)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 10
subtitle.Text = "Complete the steps below to unlock access."
subtitle.TextColor3 = C.muted
subtitle.ZIndex = 13
subtitle.Parent = header

-- ===== LINK CARD =====
local linkCard = Instance.new("Frame")
linkCard.Position = UDim2.new(0.04, 0, 0.16, 0)
linkCard.Size = UDim2.new(0.92, 0, 0.22, 0)
linkCard.BackgroundColor3 = C.card
linkCard.BorderSizePixel = 0
linkCard.ZIndex = 12
linkCard.Parent = shell
corner(linkCard, 14)
local linkStroke = stroke(linkCard, C.cyan, 1.6, 0.28)
glowPulse(linkStroke)
pad(linkCard, 10, 10, 12, 12)

local linkLabel = Instance.new("TextLabel")
linkLabel.BackgroundTransparency = 1
linkLabel.Size = UDim2.new(1, 0, 0, 14)
linkLabel.Font = Enum.Font.GothamBold
linkLabel.TextSize = 9
linkLabel.TextXAlignment = Enum.TextXAlignment.Left
linkLabel.Text = "TIKTOK PRO INVITE LINK"
linkLabel.TextColor3 = C.cyanSoft
linkLabel.ZIndex = 13
linkLabel.Parent = linkCard

local linkBox = Instance.new("TextButton")
linkBox.Position = UDim2.new(0, 0, 0, 20)
linkBox.Size = UDim2.new(1, 0, 0, 28)
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
stroke(linkBox, C.line, 1, 0.55)

local copyLinkBtn = Instance.new("TextButton")
copyLinkBtn.Position = UDim2.new(0, 0, 0, 54)
copyLinkBtn.Size = UDim2.new(1, 0, 0, 34)
copyLinkBtn.BackgroundColor3 = C.blue
copyLinkBtn.AutoButtonColor = false
copyLinkBtn.Font = Enum.Font.GothamBold
copyLinkBtn.TextSize = 12
copyLinkBtn.Text = "CLICK TO COPY LINK"
copyLinkBtn.TextColor3 = C.text
copyLinkBtn.ZIndex = 13
copyLinkBtn.Parent = linkCard
corner(copyLinkBtn, 9)
local clg = Instance.new("UIGradient")
clg.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, rgb(0, 180, 255)),
	ColorSequenceKeypoint.new(1, rgb(40, 90, 255)),
})
clg.Parent = copyLinkBtn
hoverScale(copyLinkBtn)

-- ===== TUTORIAL =====
local tut = Instance.new("Frame")
tut.Position = UDim2.new(0.04, 0, 0.4, 0)
tut.Size = UDim2.new(0.92, 0, 0.32, 0)
tut.BackgroundColor3 = C.card
tut.BorderSizePixel = 0
tut.ZIndex = 12
tut.Parent = shell
corner(tut, 14)
stroke(tut, C.line, 1, 0.5)
pad(tut, 12, 10, 14, 14)

local stepBadge = Instance.new("TextLabel")
stepBadge.BackgroundTransparency = 1
stepBadge.Size = UDim2.new(0.7, 0, 0, 14)
stepBadge.Font = Enum.Font.GothamBold
stepBadge.TextSize = 10
stepBadge.TextXAlignment = Enum.TextXAlignment.Left
stepBadge.Text = "STEP 01  /  04"
stepBadge.TextColor3 = C.cyan
stepBadge.ZIndex = 13
stepBadge.Parent = tut

local successIcon = Instance.new("TextLabel")
successIcon.BackgroundTransparency = 1
successIcon.Position = UDim2.new(1, -28, 0, 0)
successIcon.Size = UDim2.fromOffset(24, 24)
successIcon.Font = Enum.Font.GothamBlack
successIcon.TextSize = 16
successIcon.Text = "✓"
successIcon.TextColor3 = C.green
successIcon.Visible = false
successIcon.ZIndex = 13
successIcon.Parent = tut

local stepTitle = Instance.new("TextLabel")
stepTitle.BackgroundTransparency = 1
stepTitle.Position = UDim2.fromOffset(0, 20)
stepTitle.Size = UDim2.new(1, 0, 0, 20)
stepTitle.Font = Enum.Font.GothamBlack
stepTitle.TextSize = 13
stepTitle.TextXAlignment = Enum.TextXAlignment.Left
stepTitle.Text = "OPEN THE INVITE LINK"
stepTitle.TextColor3 = C.text
stepTitle.ZIndex = 13
stepTitle.Parent = tut

local stepBody = Instance.new("TextLabel")
stepBody.BackgroundTransparency = 1
stepBody.Position = UDim2.fromOffset(0, 44)
stepBody.Size = UDim2.new(1, 0, 0, 48)
stepBody.Font = Enum.Font.Gotham
stepBody.TextSize = 11
stepBody.TextWrapped = true
stepBody.TextXAlignment = Enum.TextXAlignment.Left
stepBody.TextYAlignment = Enum.TextYAlignment.Top
stepBody.Text = "Tap copy, open the TikTok PRO invite page, then continue."
stepBody.TextColor3 = C.muted
stepBody.ZIndex = 13
stepBody.Parent = tut

local codeRow = Instance.new("Frame")
codeRow.BackgroundTransparency = 1
codeRow.Position = UDim2.fromOffset(0, 96)
codeRow.Size = UDim2.new(1, 0, 0, 36)
codeRow.Visible = false
codeRow.ZIndex = 13
codeRow.Parent = tut

local codeBox = Instance.new("TextLabel")
codeBox.Size = UDim2.new(0.48, -4, 1, 0)
codeBox.BackgroundColor3 = C.dim
codeBox.Font = Enum.Font.GothamBlack
codeBox.TextSize = 15
codeBox.Text = REWARD_CODE
codeBox.TextColor3 = C.cyanSoft
codeBox.ZIndex = 14
codeBox.Parent = codeRow
corner(codeBox, 8)
stroke(codeBox, C.cyan, 1.2, 0.35)

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
hoverScale(copyCodeBtn)

-- ===== PROGRESS + DOTS =====
local progressWrap = Instance.new("Frame")
progressWrap.Position = UDim2.new(0.08, 0, 0.74, 0)
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
local pg = Instance.new("UIGradient")
pg.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, C.cyan),
	ColorSequenceKeypoint.new(1, C.blue),
})
pg.Parent = progressFill

local dots = Instance.new("Frame")
dots.BackgroundTransparency = 1
dots.Position = UDim2.new(0.25, 0, 0.77, 0)
dots.Size = UDim2.new(0.5, 0, 0, 10)
dots.ZIndex = 12
dots.Parent = shell
local dl = Instance.new("UIListLayout")
dl.FillDirection = Enum.FillDirection.Horizontal
dl.HorizontalAlignment = Enum.HorizontalAlignment.Center
dl.Padding = UDim.new(0, 7)
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

-- ===== NAV =====
local nav = Instance.new("Frame")
nav.BackgroundTransparency = 1
nav.Position = UDim2.new(0.04, 0, 0.82, 0)
nav.Size = UDim2.new(0.92, 0, 0.1, 0)
nav.ZIndex = 12
nav.Parent = shell

local backBtn = Instance.new("TextButton")
backBtn.Size = UDim2.new(0.38, 0, 0.8, 0)
backBtn.Position = UDim2.fromScale(0, 0.1)
backBtn.BackgroundColor3 = C.cardHi
backBtn.AutoButtonColor = false
backBtn.Font = Enum.Font.GothamBold
backBtn.TextSize = 12
backBtn.Text = "BACK"
backBtn.TextColor3 = C.muted
backBtn.ZIndex = 13
backBtn.Parent = nav
corner(backBtn, 10)
stroke(backBtn, C.line, 1, 0.5)
hoverScale(backBtn)

local nextBtn = Instance.new("TextButton")
nextBtn.Size = UDim2.new(0.58, 0, 0.8, 0)
nextBtn.Position = UDim2.fromScale(0.42, 0.1)
nextBtn.BackgroundColor3 = C.blue
nextBtn.AutoButtonColor = false
nextBtn.Font = Enum.Font.GothamBold
nextBtn.TextSize = 12
nextBtn.Text = "NEXT STEP"
nextBtn.TextColor3 = C.text
nextBtn.ZIndex = 13
nextBtn.Parent = nav
corner(nextBtn, 10)
local ng = Instance.new("UIGradient")
ng.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, rgb(0, 190, 255)),
	ColorSequenceKeypoint.new(1, rgb(50, 100, 255)),
})
ng.Parent = nextBtn
hoverScale(nextBtn)

local footer = Instance.new("TextLabel")
footer.BackgroundTransparency = 1
footer.Position = UDim2.new(0.06, 0, 0.93, 0)
footer.Size = UDim2.new(0.88, 0, 0.05, 0)
footer.Font = Enum.Font.Gotham
footer.TextSize = 8
footer.TextWrapped = true
footer.Text = "Tutorial only — access unlocks when eligibility is confirmed on re-execute."
footer.TextColor3 = C.muted
footer.ZIndex = 12
footer.Parent = shell

-- ===== STEPS =====
local STEPS = {
	{
		title = "OPEN THE INVITE LINK",
		body = "Copy the TikTok PRO invite link above and open it. This takes you to the official invite page.",
		code = false, ok = false,
	},
	{
		title = "INSTALL TIKTOK PRO",
		body = "Follow the page instructions and finish installing TikTok PRO on your device.",
		code = false, ok = false,
	},
	{
		title = "ENTER YOUR REWARDS CODE",
		body = "Open TikTok PRO → Rewards, scroll down, and enter the code below.",
		code = true, ok = false,
	},
	{
		title = "RE-EXECUTE THE SCRIPT",
		body = "After install + code entry, return to your executor and re-run the script for access check.",
		code = false, ok = true,
	},
}

local step, busy = 1, false

local function setStep(n)
	if busy then return end
	n = math.clamp(n, 1, 4)
	busy = true
	step = n
	local s = STEPS[n]
	-- soft fade text
	stepTitle.TextTransparency = 0.5
	stepBody.TextTransparency = 0.5
	stepBadge.Text = string.format("STEP %02d  /  04", n)
	stepTitle.Text = s.title
	stepBody.Text = s.body
	codeRow.Visible = s.code
	successIcon.Visible = s.ok
	tween(stepTitle, 0.2, { TextTransparency = 0 })
	tween(stepBody, 0.25, { TextTransparency = 0 })
	tween(progressFill, 0.35, { Size = UDim2.fromScale(n / 4, 1) })
	for i, d in ipairs(dotFrames) do
		tween(d, 0.2, { BackgroundColor3 = i <= n and C.cyan or C.dim })
	end
	backBtn.TextColor3 = n == 1 and C.muted or C.text
	nextBtn.Text = n == 4 and "FINISH" or "NEXT STEP"
	task.delay(0.18, function() busy = false end)
end

local function flash(btn, ok, isCode)
	local orig = btn.Text
	local prev = btn.BackgroundColor3
	btn.Text = ok and (isCode and "✓  CODE COPIED!" or "✓  LINK COPIED!") or "COPY UNAVAILABLE"
	tween(btn, 0.15, { BackgroundColor3 = ok and C.green or rgb(200, 70, 70) })
	task.delay(1.25, function()
		if not btn.Parent then return end
		btn.Text = orig
		tween(btn, 0.2, { BackgroundColor3 = prev })
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
	if step < 4 then
		setStep(step + 1)
	else
		nextBtn.Text = "RE-EXECUTE WHEN READY"
		tween(nextBtn, 0.2, { BackgroundColor3 = C.green })
		task.delay(1.5, function()
			if nextBtn.Parent then
				nextBtn.Text = "FINISH"
				tween(nextBtn, 0.25, { BackgroundColor3 = C.blue })
			end
		end)
	end
end)
backBtn.MouseButton1Click:Connect(function()
	if busy or step <= 1 then return end
	setStep(step - 1)
end)

-- Soft orb drift
task.spawn(function()
	while o1.Parent do
		tween(o1, 7, { Position = UDim2.fromScale(0.2, 0.28) })
		tween(o2, 8, { Position = UDim2.fromScale(0.82, 0.68) })
		task.wait(7)
		tween(o1, 7, { Position = UDim2.fromScale(0.12, 0.16) })
		tween(o2, 8, { Position = UDim2.fromScale(0.9, 0.8) })
		task.wait(7)
	end
end)

-- Open animation
task.spawn(function()
	shell.Size = UDim2.fromScale(0.86, 0.82)
	shell.BackgroundTransparency = 0.4
	tween(backdrop, 0.4, { BackgroundTransparency = 0 })
	tween(shell, 0.5, {
		Size = UDim2.fromScale(0.94, 0.9),
		BackgroundTransparency = 0.08,
		Position = UDim2.fromScale(0.5, 0.5),
	}, Enum.EasingStyle.Back)
	setStep(1)
end)

print("[SAB] Premium Access GUI loaded")
