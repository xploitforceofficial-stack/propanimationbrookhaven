-- PROP ANIMATION BROOKHAVEN | BY VINZEE, HAPPY SKID HAPPY RENAME

-- https://chat.whatsapp.com/CjbAhfWTAKx1mU3O6KEJgp

local Players = game:GetService("Players")
local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")

local plr = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "DragonWings"
gui.ResetOnSpawn = false
pcall(function() gui.Parent = game.CoreGui end)
if not gui.Parent then gui.Parent = plr.PlayerGui end

local Main = Instance.new("Frame")
Main.Parent = gui
Main.Size = UDim2.new(0, 380, 0, 420)
Main.Position = UDim2.new(0.5, -190, 0.1, 0)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

local UIC = Instance.new("UICorner", Main)
UIC.CornerRadius = UDim.new(0, 16)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(200, 50, 50)

local Glass = Instance.new("Frame", Main)
Glass.Size = UDim2.new(1, 0, 1, 0)
Glass.BackgroundTransparency = 0.85
Glass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Glass.BorderSizePixel = 0
Instance.new("UICorner", Glass).CornerRadius = UDim.new(0, 16)

local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -100, 0, 45)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Text = "🦇 DRAGON WINGS"
Title.Font = Enum.Font.GothamBlack
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(200, 50, 50)

local TitleStroke = Instance.new("UIStroke", Title)
TitleStroke.Color = Color3.fromRGB(255, 100, 0)
TitleStroke.Thickness = 1.5

local function createButton(parent, text, pos, size, color)
	local btn = Instance.new("TextButton")
	btn.Parent = parent
	btn.Size = size or UDim2.new(0, 30, 0, 30)
	btn.Position = pos
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 18
	btn.BackgroundColor3 = color or Color3.fromRGB(60, 60, 80)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
	return btn
end

local Min = createButton(Main, "−", UDim2.new(1, -75, 0, 8), nil, Color3.fromRGB(80, 80, 100))
local Close = createButton(Main, "✕", UDim2.new(1, -35, 0, 8), nil, Color3.fromRGB(180, 40, 40))

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Parent = Main
ScrollFrame.Size = UDim2.new(1, -20, 1, -60)
ScrollFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 4
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(200, 50, 50)

local UIList = Instance.new("UIListLayout", ScrollFrame)
UIList.Padding = UDim.new(0, 8)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local UIPadding = Instance.new("UIPadding", ScrollFrame)
UIPadding.PaddingTop = UDim.new(0, 5)
UIPadding.PaddingBottom = UDim.new(0, 5)

local function createSection(text)
	local frame = Instance.new("Frame")
	frame.Parent = ScrollFrame
	frame.Size = UDim2.new(0.95, 0, 0, 20)
	frame.BackgroundTransparency = 1
	
	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Text = "▸ " .. text
	label.TextColor3 = Color3.fromRGB(200, 50, 50)
	label.TextSize = 12
	label.Font = Enum.Font.GothamBold
	label.BackgroundTransparency = 1
	label.TextXAlignment = Enum.TextXAlignment.Left
	return frame
end

local function createRow(height)
	local frame = Instance.new("Frame")
	frame.Parent = ScrollFrame
	frame.Size = UDim2.new(0.95, 0, 0, height)
	frame.BackgroundTransparency = 1
	return frame
end

local function createButton2(text, bg, parent)
	local btn = Instance.new("TextButton")
	btn.Parent = parent or ScrollFrame
	btn.Size = UDim2.new(0.48, 0, 1, 0)
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 11
	btn.Font = Enum.Font.GothamBold
	btn.BackgroundColor3 = bg or Color3.fromRGB(60, 60, 80)
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
	Instance.new("UIStroke", btn).Color = Color3.fromRGB(200, 50, 50)
	return btn
end

local function createDisplay(parent, x, w)
	local frame = Instance.new("Frame")
	frame.Parent = parent
	frame.Size = UDim2.new(w, 0, 1, 0)
	frame.Position = UDim2.new(x, 0, 0, 0)
	frame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
	frame.BorderSizePixel = 0
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
	Instance.new("UIStroke", frame).Color = Color3.fromRGB(200, 50, 50)
	return frame
end

local function createLabel(parent, text, size, color)
	local label = Instance.new("TextLabel", parent)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Text = text
	label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
	label.TextSize = size or 11
	label.Font = Enum.Font.GothamBold
	label.BackgroundTransparency = 1
	return label
end

-- STATE VARIABLES 
local propCache = {}
local summonActive = false
local flyActive = false
local frameCount = 0
local colorTick = 0
local propColor = Color3.fromRGB(200, 50, 50)
local flyHeightOffset = 0
local heightStep = 1
local bobTime = 0
local wingAngle = 0
local wingSpeed = 2.5
local antiSitActive = false
local antiSitConn = nil
local antiSitHeartbeatConn = nil

-- NOISE 
local noiseSeed = tick() * 1000
local function simpleNoise(x, y)
	local n = math.sin(x * 12.9898 + y * 78.233 + noiseSeed) * 43758.5453
	return n - math.floor(n)
end

local function smoothNoise(x, y)
	local ix = math.floor(x)
	local iy = math.floor(y)
	local fx = x - ix
	local fy = y - iy
	fx = fx * fx * (3 - 2 * fx)
	fy = fy * fy * (3 - 2 * fy)
	local a = simpleNoise(ix, iy)
	local b = simpleNoise(ix + 1, iy)
	local c = simpleNoise(ix, iy + 1)
	local d = simpleNoise(ix + 1, iy + 1)
	return a + (b - a) * fx + (c - a) * fy + (a - b - c + d) * fx * fy
end

-- Multi-octave noise for organic motion
local function fractalNoise(x, y, octaves)
	octaves = octaves or 3
	local val = 0
	local amp = 1
	local freq = 1
	local max = 0
	for i = 1, octaves do
		val = val + smoothNoise(x * freq, y * freq) * amp
		max = max + amp
		amp = amp * 0.5
		freq = freq * 2.1
	end
	return val / max
end

-- ANATOMICAL BAT WING OFFSETS 
local WING_OFFSETS = {
	-- LEFT WING (7 Props)
	{pos = Vector3.new(-1.5, 1.5, 0.5), rot = CFrame.Angles(math.rad(-10), math.rad(10), math.rad(-15)), t = 0.0, side = -1, bone = "shoulder"},
	{pos = Vector3.new(-2.8, 1.2, 1.0), rot = CFrame.Angles(math.rad(-15), math.rad(15), math.rad(-25)), t = 0.15, side = -1, bone = "upperarm"},
	{pos = Vector3.new(-4.2, 0.8, 1.8), rot = CFrame.Angles(math.rad(-20), math.rad(20), math.rad(-40)), t = 0.3, side = -1, bone = "elbow"},
	{pos = Vector3.new(-5.8, 0.2, 2.5), rot = CFrame.Angles(math.rad(-25), math.rad(25), math.rad(-55)), t = 0.5, side = -1, bone = "forearm"},
	{pos = Vector3.new(-7.5, -0.5, 3.0), rot = CFrame.Angles(math.rad(-30), math.rad(30), math.rad(-70)), t = 0.7, side = -1, bone = "wrist"},
	{pos = Vector3.new(-8.8, -1.2, 3.2), rot = CFrame.Angles(math.rad(-35), math.rad(35), math.rad(-80)), t = 0.85, side = -1, bone = "finger"},
	{pos = Vector3.new(-9.5, -2.0, 2.8), rot = CFrame.Angles(math.rad(-40), math.rad(40), math.rad(-85)), t = 1.0, side = -1, bone = "wingtip"},
	
	-- RIGHT WING (7 Props)
	{pos = Vector3.new(1.5, 1.5, 0.5), rot = CFrame.Angles(math.rad(-10), math.rad(-10), math.rad(15)), t = 0.0, side = 1, bone = "shoulder"},
	{pos = Vector3.new(2.8, 1.2, 1.0), rot = CFrame.Angles(math.rad(-15), math.rad(-15), math.rad(25)), t = 0.15, side = 1, bone = "upperarm"},
	{pos = Vector3.new(4.2, 0.8, 1.8), rot = CFrame.Angles(math.rad(-20), math.rad(-20), math.rad(40)), t = 0.3, side = 1, bone = "elbow"},
	{pos = Vector3.new(5.8, 0.2, 2.5), rot = CFrame.Angles(math.rad(-25), math.rad(-25), math.rad(55)), t = 0.5, side = 1, bone = "forearm"},
	{pos = Vector3.new(7.5, -0.5, 3.0), rot = CFrame.Angles(math.rad(-30), math.rad(-30), math.rad(70)), t = 0.7, side = 1, bone = "wrist"},
	{pos = Vector3.new(8.8, -1.2, 3.2), rot = CFrame.Angles(math.rad(-35), math.rad(-35), math.rad(80)), t = 0.85, side = 1, bone = "finger"},
	{pos = Vector3.new(9.5, -2.0, 2.8), rot = CFrame.Angles(math.rad(-40), math.rad(-40), math.rad(85)), t = 1.0, side = 1, bone = "wingtip"},
	
	-- CENTER SPINE (1 Props)
	{pos = Vector3.new(0, 2.2, -0.5), rot = CFrame.Angles(math.rad(20), 0, 0), t = 0.0, side = 0, bone = "spine"}
}

-- FLIGHT STATE ENUMERATION 
local FlightState = {
	IDLE = "Idle",
	PERCH = "Perch",
	HOVER = "Hover",
	TAKEOFF = "TakeOff",
	FLY_FORWARD = "FlyForward",
	FLY_FAST = "FlyFast",
	ASCEND = "Ascend",
	DESCEND = "Descend",
	GLIDE = "Glide",
	DIVE = "Dive",
	LANDING = "Landing",
	BRAKE = "Brake",
	TURN_LEFT = "TurnLeft",
	TURN_RIGHT = "TurnRight"
}
-- Cubic Bezier interpolation 
local function cubicBezier(t, p0, p1, p2, p3)
	local u = 1 - t
	return u*u*u*p0 + 3*u*u*t*p1 + 3*u*t*t*p2 + t*t*t*p3
end

-- EaseOutCubic 
local function easeOutCubic(t)
	local t1 = t - 1
	return t1 * t1 * t1 + 1
end

-- EaseInCubic 
local function easeInCubic(t)
	return t * t * t
end

-- EaseInOutCubic 
local function easeInOutCubic(t)
	if t < 0.5 then
		return 4 * t * t * t
	else
		local f = 2 * t - 2
		return 0.5 * f * f * f + 1
	end
end

-- EaseOutExpo 
local function easeOutExpo(t)
	if t >= 1 then return 1 end
	return 1 - math.pow(2, -10 * t)
end

-- EaseInExpo - buildup lambat
local function easeInExpo(t)
	if t <= 0 then return 0 end
	return math.pow(2, 10 * (t - 1))
end

-- EaseOutBack 
local function easeOutBack(t)
	local c1 = 1.70158
	local c3 = c1 + 1
	return 1 + c3 * math.pow(t - 1, 3) + c1 * math.pow(t - 1, 2)
end

-- EaseOutElastic 
local function easeOutElastic(t)
	if t <= 0 then return 0 end
	if t >= 1 then return 1 end
	local c4 = (2 * math.pi) / 3
	return math.pow(2, -10 * t) * math.sin((t * 10 - 0.75) * c4) + 1
end

local FLAP_PHASES = {
	FOLD_START = 0.00,
	FOLD_END = 0.20,
	TOP_START = 0.20,
	TOP_END = 0.35,
	POWER_START = 0.35,
	POWER_END = 0.65,
	RECOVERY_START = 0.65,
	RECOVERY_END = 1.00
}

-- Phase durations (normalized - total = 1.0)
local PHASE_DURATIONS = {
	FOLD = FLAP_PHASES.FOLD_END - FLAP_PHASES.FOLD_START,       
	TOP = FLAP_PHASES.TOP_END - FLAP_PHASES.TOP_START,           
	POWER = FLAP_PHASES.POWER_END - FLAP_PHASES.POWER_START,   
	RECOVERY = FLAP_PHASES.RECOVERY_END - FLAP_PHASES.RECOVERY_START
}

-- Get current phase from normalized cycle position 
local function getFlapPhase(cyclePos)
	if cyclePos < FLAP_PHASES.FOLD_END then
		return "FOLD", (cyclePos - FLAP_PHASES.FOLD_START) / PHASE_DURATIONS.FOLD
	elseif cyclePos < FLAP_PHASES.TOP_END then
		return "TOP", (cyclePos - FLAP_PHASES.TOP_START) / PHASE_DURATIONS.TOP
	elseif cyclePos < FLAP_PHASES.POWER_END then
		return "POWER", (cyclePos - FLAP_PHASES.POWER_START) / PHASE_DURATIONS.POWER
	else
		return "RECOVERY", (cyclePos - FLAP_PHASES.RECOVERY_START) / PHASE_DURATIONS.RECOVERY
	end
end

local WING_SPAN_TABLE = {
	[FlightState.IDLE] = 0.40,
	[FlightState.PERCH] = 0.15,
	[FlightState.HOVER] = 0.70,
	[FlightState.TAKEOFF] = 1.20,
	[FlightState.FLY_FORWARD] = 1.00,
	[FlightState.FLY_FAST] = 0.88,
	[FlightState.ASCEND] = 1.40,
	[FlightState.DESCEND] = 1.02,
	[FlightState.GLIDE] = 1.50,
	[FlightState.DIVE] = 0.60,
	[FlightState.LANDING] = 1.30,
	[FlightState.BRAKE] = 1.22,
	[FlightState.TURN_LEFT] = 0.92,
	[FlightState.TURN_RIGHT] = 0.92
}

-- Smooth span interpolation with velocity-based prediction
local currentSpanTarget = 1.0
local currentSpanSmoothed = 1.0
local spanVelocity = 0

local function updateWingSpan(state, dt)
	local target = WING_SPAN_TABLE[state] or 1.0
	
	-- Smooth spring-like interpolation 
	local spanBlendSpeed = 3.5 -- Higher = faster transition
	local diff = target - currentSpanSmoothed
	spanVelocity = spanVelocity + diff * spanBlendSpeed * spanBlendSpeed * dt
	spanVelocity = spanVelocity * math.pow(0.7, dt * 60) 
	currentSpanSmoothed = currentSpanSmoothed + spanVelocity * dt
	
	-- Clamp to prevent overshoot
	currentSpanSmoothed = math.clamp(currentSpanSmoothed, 0.15, 1.55)
	currentSpanTarget = target
	
	return currentSpanSmoothed
end

local function getDynamicBoneScale(bone, phase, phasePos, speed, dt)
	local baseScale = 1.0
	local variation = 0.0
	
	-- Shoulder → Elbow variation
	if bone == "shoulder" or bone == "upperarm" then
		if phase == "POWER" then
			-- Shoulder memanjang saat power stroke (mendorong)
			variation = 0.03 * easeOutCubic(phasePos)
		elseif phase == "FOLD" then
			-- Shoulder memendek saat fold
			variation = -0.02 * easeInCubic(phasePos)
		end
		
	-- Elbow - Wrist variation
	elseif bone == "elbow" or bone == "forearm" then
		if phase == "POWER" then
			variation = 0.04 * easeOutCubic(phasePos)
		elseif phase == "TOP" then
			variation = -0.025 * easeInOutCubic(phasePos)
		elseif phase == "RECOVERY" then
			variation = 0.02 * (1 - phasePos) -- Gradual return
		end
		
	-- Wrist → Wing Tip variation
	elseif bone == "wrist" or bone == "finger" or bone == "wingtip" then
		if phase == "POWER" then
			-- Wing tip 
			variation = -0.035 * easeOutCubic(phasePos) * (1 + speed * 0.02)
		elseif phase == "FOLD" then
			-- Wing tip 
			variation = 0.02 * easeInCubic(phasePos)
		elseif phase == "GLIDE" then
			variation = 0.015 * math.sin(bobTime * 8 + bone.t * 10)
		end
	end
	
	-- Speed-based compression
	if speed > 20 then
		variation = variation - 0.01 * math.clamp((speed - 20) / 40, 0, 1)
	end
	
	return baseScale + math.clamp(variation, -0.05, 0.05)
end

local AirPressureSystem = {
	currentPressure = 0,
	smoothedPressure = 0,
	pressureVelocity = 0,
	tipDragX = 0,
	tipDragY = 0,
	membraneTension = 0,
	shoulderDragOffset = Vector3.zero,
	bodyDragTilt = 0
}

function AirPressureSystem:update(speed, verticalSpeed, dt)
	-- Calculate raw air pressure 
	self.currentPressure = math.clamp(speed / 65, 0, 1)
	
	-- Spring smoothing untuk pressure
	local diff = self.currentPressure - self.smoothedPressure
	self.pressureVelocity = self.pressureVelocity + diff * 12 * dt
	self.pressureVelocity = self.pressureVelocity * math.pow(0.6, dt * 60)
	self.smoothedPressure = math.clamp(self.smoothedPressure + self.pressureVelocity * dt, 0, 1)
	
	local p = self.smoothedPressure
	
	-- Wing tip drag 
	self.tipDragX = -p * 1.8 
	self.tipDragY = -p * 0.4 
	
	self.membraneTension = p * 0.35
	
	-- Shoulder drag offset 
	self.shoulderDragOffset = Vector3.new(0, -p * 0.15, -p * 0.6)
	
	-- Body drag tilt 
	self.bodyDragTilt = math.rad(-12 * p)
	
	return self
end

function AirPressureSystem:getTipDrag(t)
	local tipFactor = math.pow(t, 2.5)
	return Vector3.new(
		self.tipDragX * tipFactor,
		self.tipDragY * tipFactor,
		-self.tipDragX * tipFactor * 0.5 
	)
end

function AirPressureSystem:getMembraneTension(t)
	local tensionFactor = math.sin(t * math.pi) * 0.8 + t * 0.2
	return self.membraneTension * tensionFactor
end

local ShoulderSystem = {
	currentY = 0,
	currentZRot = 0,
	currentZPos = 0,
	currentXRot = 0,
	velocityY = 0,
	velocityZRot = 0,
	velocityZPos = 0,
	velocityXRot = 0
}

function ShoulderSystem:calculate(phase, phasePos, params, speed, airPressure, dt)
	local targetY = 0
	local targetZRot = 0
	local targetZPos = 0
	local targetXRot = 0
	
	if phase == "FOLD" then
		-- Fase 1
		targetY = params.flapAmplitude * 0.4 * easeInCubic(phasePos)
		targetZRot = math.rad(-8) * easeInCubic(phasePos)
		targetZPos = 0.2 * easeInCubic(phasePos) 
		targetXRot = math.rad(-5) * easeInCubic(phasePos)
		
	elseif phase == "TOP" then
		-- Fase 2
		targetY = params.flapAmplitude * 0.6
		targetZRot = math.rad(-12) 
		targetZPos = 0.3 
		targetXRot = math.rad(-8)
		
	elseif phase == "POWER" then
		-- Fase 3
		targetY = -params.flapAmplitude * 0.8 * easeOutCubic(phasePos) -- Turun cepat
		targetZRot = math.rad(15) * easeOutCubic(phasePos) -- Membuka lebar
		targetZPos = -0.4 * easeOutCubic(phasePos) -- Mundur (thrust)
		targetXRot = math.rad(10) * easeOutCubic(phasePos)
		
	elseif phase == "RECOVERY" then
		-- Fase 4
		targetY = params.flapAmplitude * 0.3 * (1 - easeInCubic(phasePos))
		targetZRot = math.rad(-5) * (1 - phasePos)
		targetZPos = -0.1 * (1 - phasePos)
		targetXRot = math.rad(-3) * (1 - phasePos)
	end
	
	-- Hover: Shoulder 
	if params.flapStyle == "wide" then
		targetY = targetY * 1.2
		targetZRot = targetZRot * 1.15
	end
	
	-- Ascending: Shoulder lebih tinggi, lebih lebar
	if params.flapStyle == "power" and params.liftIntensity > 0.7 then
		targetY = targetY * 1.3
		targetZRot = targetZRot * 1.25
		targetZPos = targetZPos * 1.2
	end
	
	-- Air pressure
	targetZPos = targetZPos + airPressure.shoulderDragOffset.Z
	targetXRot = targetXRot + airPressure.bodyDragTilt * 0.5
	
	-- Spring physics 
	local springStrength = 18
	local damping = 0.75
	
	self.velocityY = self.velocityY + (targetY - self.currentY) * springStrength * dt
	self.velocityY = self.velocityY * math.pow(damping, dt * 60)
	self.currentY = self.currentY + self.velocityY * dt
	
	self.velocityZRot = self.velocityZRot + (targetZRot - self.currentZRot) * springStrength * dt
	self.velocityZRot = self.velocityZRot * math.pow(damping, dt * 60)
	self.currentZRot = self.currentZRot + self.velocityZRot * dt
	
	self.velocityZPos = self.velocityZPos + (targetZPos - self.currentZPos) * springStrength * dt
	self.velocityZPos = self.velocityZPos * math.pow(damping, dt * 60)
	self.currentZPos = self.currentZPos + self.velocityZPos * dt
	
	self.velocityXRot = self.velocityXRot + (targetXRot - self.currentXRot) * springStrength * dt
	self.velocityXRot = self.velocityXRot * math.pow(damping, dt * 60)
	self.currentXRot = self.currentXRot + self.velocityXRot * dt
	
	return {
		posY = self.currentY,
		zRot = self.currentZRot,
		zPos = self.currentZPos,
		xRot = self.currentXRot
	}
end



local GlideWindSystem = {
	windTime = 0,
	gustPhase = 0,
	turbulence = 0
}

function GlideWindSystem:update(dt, speed)
	self.windTime = self.windTime + dt
	self.gustPhase = self.gustPhase + dt * (0.5 + speed * 0.02)
	
	-- Turbulence naik dengan kecepatan
	local targetTurbulence = math.clamp(speed / 50, 0.05, 0.8)
	self.turbulence = self.turbulence + (targetTurbulence - self.turbulence) * dt * 2
	
	return self
end

function GlideWindSystem:getMotion(bone, t, side)
	local motion = {x = 0, y = 0, z = 0}
	
	-- Base wind frequency 
	local f1, f2, f3 = 6, 11, 17
	local a1, a2, a3 = 0.012, 0.006, 0.003
	
	-- Wing tip
	if bone == "wingtip" then
		a1, a2, a3 = 0.025, 0.012, 0.006
		-- Turbulent flutter
		motion.x = math.sin(self.windTime * f1 + t * 15) * a1 * self.turbulence
		motion.x = motion.x + math.sin(self.windTime * f2 + t * 25) * a2 * self.turbulence
		-- Vertical flutter
		motion.y = math.cos(self.windTime * f3 + t * 20) * a3 * self.turbulence
		-- Drag-induced twist
		motion.z = math.sin(self.windTime * 4 + t * 10) * 0.008 * self.turbulence
		
	-- Finger: vibration medium
	elseif bone == "finger" then
		a1, a2 = 0.018, 0.008
		motion.x = math.sin(self.windTime * f1 * 0.9 + t * 12) * a1 * self.turbulence
		motion.x = motion.x + math.sin(self.windTime * f2 * 1.1 + t * 18) * a2 * self.turbulence
		motion.z = math.cos(self.windTime * 7 + t * 14) * 0.005 * self.turbulence
		
	-- Wrist
	elseif bone == "wrist" then
		a1 = 0.008
		motion.x = math.sin(self.windTime * f1 * 0.7 + t * 8) * a1 * self.turbulence
		motion.z = math.sin(self.windTime * 5 + t * 10) * 0.003 * self.turbulence
		
	-- Membrane bones: gentle wave
	elseif bone == "forearm" or bone == "elbow" then
		a1 = 0.005
		-- Wave propagating dari body ke tip
		motion.x = math.sin(self.windTime * 3 + t * 6 - bone.t * 4) * a1 * self.turbulence
	end
	
	-- Random gust (bursts of wind)
	local gust = math.max(0, math.sin(self.gustPhase * 0.3) * math.sin(self.gustPhase * 0.7 + 2.1))
	gust = math.pow(gust, 4) -- Sharp peaks
	if gust > 0.3 then
		local gustStrength = (gust - 0.3) * 0.02 * self.turbulence
		motion.x = motion.x + gustStrength * (1 + t)
		motion.y = motion.y + gustStrength * 0.5 * math.sin(self.windTime * 13)
	end
	
	return motion
end

-- ANIMATION STATE CONTROLLER 
local AnimState = {
	currentState = FlightState.IDLE,
	previousState = FlightState.IDLE,
	stateTimer = 0,
	stateTimerTotal = 0,
	takeOffFlapCount = 0,
	takeOffActive = false,
	landingActive = false,
	landingProgress = 0,
	perchTimer = 0,
	isPerched = false,
	perchTransition = 0,
	glideTimer = 0,
	transitionBlend = 0,
	lastVelocity = Vector3.zero,
	smoothedVelocity = Vector3.zero,
	acceleration = Vector3.zero,
	horizontalSpeed = 0,
	verticalSpeed = 0,
	turnDirection = 0,
	stateHistory = {},
	
	-- Physics
	wingTipDeflection = {left = 0, right = 0},
	membraneTension = 0,
	airPressure = 0,
	prevFlapPhase = 0,
	
	-- Perch
	perchFoldAngle = 0,
	onGround = false,
	groundHeight = 0,
	wasOnGround = false,
	
	-- 4-Phase flap tracking
	flapCyclePos = 0,
	currentPhase = "RECOVERY",
	phaseProgress = 0,
	flapAccumulator = 0,
	
	-- Dynamic skeleton
	boneScales = {},
	
	-- Smoothing
	currentAmplitude = 0.3,
	currentFrequency = 2.5,
	currentSpan = 1.0,
	currentBodyTilt = 0,
	currentWingTilt = 0,
	
	params = {
		flapAmplitude = 0.3,
		flapFrequency = 2.5,
		wingSpan = 1.0,
		wingTilt = 0,
		bodyTilt = 0,
		membraneCurve = 0,
		tipDeflection = 0,
		liftIntensity = 0,
		randomness = 0.02,
		flapStyle = "normal",
		powerIntensity = 0.5,
		recoverySpeed = 0.5,
		foldSpeed = 0.5,
		shoulderDrive = 0.5,
		wingTipLag = 0.3
	}
}

-- Initialize bone scales
for i = 1, 15 do
	AnimState.boneScales[i] = 1.0
end

-- FLIGHT STATE DETECTOR 
local StateDetector = {}

function StateDetector:analyze(character, root, dt)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid or not root then return FlightState.IDLE end
	
	local velocity = root.Velocity
	local lookVector = root.CFrame.LookVector
	local moveDir = humanoid.MoveDirection
	
	-- Smooth velocity
	AnimState.smoothedVelocity = AnimState.smoothedVelocity:Lerp(velocity, math.min(dt * 8, 1))
	AnimState.acceleration = (AnimState.smoothedVelocity - AnimState.lastVelocity) / math.max(dt, 0.001)
	AnimState.lastVelocity = AnimState.smoothedVelocity
	
	local v = AnimState.smoothedVelocity
	AnimState.horizontalSpeed = Vector3.new(v.X, 0, v.Z).Magnitude
	AnimState.verticalSpeed = v.Y
	
	-- Ground detection
	local rayOrigin = root.Position
	local rayDirection = Vector3.new(0, -20, 0)
	local rayParams = RaycastParams.new()
	rayParams.FilterDescendantsInstances = {character}
	rayParams.FilterType = Enum.RaycastFilterType.Blacklist
	local rayResult = workspace:Raycast(rayOrigin, rayDirection, rayParams)
	
	AnimState.wasOnGround = AnimState.onGround
	AnimState.onGround = false
	AnimState.groundHeight = math.huge
	if rayResult then
		AnimState.groundHeight = (rayOrigin - rayResult.Position).Magnitude
		if AnimState.groundHeight < 3.5 then
			AnimState.onGround = true
		end
	end
	
	-- Turn detection
	local flatVel = Vector3.new(v.X, 0, v.Z)
	local flatLook = Vector3.new(lookVector.X, 0, lookVector.Z)
	if flatVel.Magnitude > 2 and flatLook.Magnitude > 0.01 then
		local velNorm = flatVel.Unit
		local lookNorm = flatLook.Unit
		local cross = lookNorm:Cross(velNorm)
		local dot = lookNorm:Dot(velNorm)
		if dot > 0.3 then
			AnimState.turnDirection = cross.Y
		else
			AnimState.turnDirection = 0
		end
	else
		AnimState.turnDirection = 0
	end
	
	-- STATE MACHINE
	local speed = AnimState.horizontalSpeed
	local vSpeed = AnimState.verticalSpeed
	local accelY = AnimState.acceleration.Y
	local accelMag = AnimState.acceleration.Magnitude
	
	if not flyActive then
		if AnimState.onGround and speed < 1.5 then
			AnimState.perchTimer = AnimState.perchTimer + dt
			if AnimState.perchTimer > 1.5 and not AnimState.isPerched then
				AnimState.isPerched = true
				AnimState.perchTransition = 0
			end
		elseif AnimState.onGround and speed >= 1.5 then
			AnimState.perchTimer = math.max(0, AnimState.perchTimer - dt * 2)
			if AnimState.perchTimer < 0.5 then
				AnimState.isPerched = false
			end
		else
			AnimState.perchTimer = math.max(0, AnimState.perchTimer - dt * 0.5)
			if AnimState.perchTimer < 0.5 then
				AnimState.isPerched = false
			end
		end
		if AnimState.isPerched then return FlightState.PERCH end
		return FlightState.IDLE
	end
	
	-- Flying states (priority: high to low)
	if AnimState.groundHeight < 8 and AnimState.groundHeight > 0.5 and vSpeed < -3 then
		AnimState.landingActive = true
		AnimState.landingProgress = 1 - math.clamp((AnimState.groundHeight - 1) / 7, 0, 1)
		return FlightState.LANDING
	end
	
	if AnimState.stateTimerTotal < 1.8 and vSpeed > 4 and accelY > 5 then
		AnimState.takeOffActive = true
		return FlightState.TAKEOFF
	end
	
	if vSpeed < -12 and speed > 18 then
		return FlightState.DIVE
	end
	
	if speed > 32 then
		return FlightState.FLY_FAST
	end
	
	if vSpeed > 6 and accelY > 3 then
		return FlightState.ASCEND
	end
	
	if vSpeed < -6 and speed > 8 then
		return FlightState.DESCEND
	end
	
	if math.abs(vSpeed) < 4 and speed > 12 and accelMag < 15 then
		AnimState.glideTimer = AnimState.glideTimer + dt
		if AnimState.glideTimer > 0.25 then
			return FlightState.GLIDE
		end
	else
		AnimState.glideTimer = math.max(0, AnimState.glideTimer - dt * 3)
	end
	
	if speed < 4 and math.abs(vSpeed) < 2.5 then
		return FlightState.HOVER
	end
	
	if accelMag > 20 and speed > 8 then
		local velDir = v.Unit
		local accelDir = AnimState.acceleration.Unit
		if velDir:Dot(accelDir) < -0.5 then
			return FlightState.BRAKE
		end
	end
	
	if math.abs(AnimState.turnDirection) > 0.35 and speed > 6 then
		if AnimState.turnDirection > 0 then
			return FlightState.TURN_LEFT
		else
			return FlightState.TURN_RIGHT
		end
	end
	
	if speed > 2 then
		return FlightState.FLY_FORWARD
	end
	
	return FlightState.HOVER
end

-- ANIMATION PARAMETER GENERATOR
local ParamGenerator = {}

function ParamGenerator:getParams(state, dt)
	local p = AnimState.params
	local v = AnimState.smoothedVelocity
	local speed = AnimState.horizontalSpeed
	local vSpeed = AnimState.verticalSpeed
	local accel = AnimState.acceleration
	
	-- Target defaults
	local targetAmp = 0.3
	local targetFreq = wingSpeed
	local targetSpan = 1.0
	local targetWTilt = 0
	local targetBTilt = 0
	local targetMemCurve = 0
	local targetTipDef = 0
	local targetLift = 0.5
	local targetRandom = 0.02
	local targetFlapStyle = "normal"
	
	-- AAA enhanced params
	local targetPower = 0.5
	local targetRecovery = 0.5
	local targetFold = 0.5
	local targetShoulder = 0.5
	local targetTipLag = 0.3
	
	if state == FlightState.IDLE then
		targetAmp = 0.06
		targetFreq = 0.6
		targetSpan = 0.40
		targetMemCurve = 0.08
		targetRandom = 0.008
		targetFlapStyle = "breathe"
		targetPower = 0.2
		targetRecovery = 0.8
		targetFold = 0.4
		targetShoulder = 0.2
		targetTipLag = 0.15
		
	elseif state == FlightState.PERCH then
		targetAmp = 0.0
		targetFreq = 0.0
		targetSpan = 0.15
		targetMemCurve = 0.25
		targetTipDef = -0.4
		targetRandom = 0.0
		targetFlapStyle = "none"
		targetPower = 0
		targetRecovery = 0
		targetFold = 0
		targetShoulder = 0
		targetTipLag = 0
		
	elseif state == FlightState.HOVER then
		targetAmp = 0.22
		targetFreq = 3.2
		targetSpan = 0.70
		targetMemCurve = 0.12
		targetLift = 0.75
		targetRandom = 0.025
		targetFlapStyle = "wide"
		targetPower = 0.6
		targetRecovery = 0.5
		targetFold = 0.5
		targetShoulder = 0.7
		targetTipLag = 0.25
		
	elseif state == FlightState.TAKEOFF then
		local takeOffProgress = math.min(AnimState.stateTimer / 1.5, 1)
		local strength = math.pow(1 - takeOffProgress, 1.5)
		targetAmp = 0.85 * strength + 0.3 * (1 - strength)
		targetFreq = 4.2 * strength + wingSpeed * (1 - strength)
		targetSpan = 1.20
		targetWTilt = math.rad(10) * strength
		targetBTilt = math.rad(8) * strength
		targetLift = 1.0 * strength + 0.5 * (1 - strength)
		targetMemCurve = -0.18 * strength
		targetRandom = 0.04 * strength
		targetFlapStyle = "power"
		targetPower = 0.95 * strength + 0.4 * (1 - strength)
		targetRecovery = 0.3 * strength + 0.5 * (1 - strength)
		targetFold = 0.7 * strength + 0.4 * (1 - strength)
		targetShoulder = 0.9 * strength + 0.5 * (1 - strength)
		targetTipLag = 0.45 * strength + 0.25 * (1 - strength)
		
	elseif state == FlightState.FLY_FORWARD then
		targetAmp = 0.32
		targetFreq = wingSpeed
		targetSpan = 1.00
		targetBTilt = math.rad(-8)
		targetTipDef = -0.08 * math.clamp(speed / 25, 0, 1)
		targetMemCurve = 0.04
		targetLift = 0.45
		targetFlapStyle = "normal"
		targetPower = 0.55
		targetRecovery = 0.5
		targetFold = 0.5
		targetShoulder = 0.5
		targetTipLag = 0.3
		
	elseif state == FlightState.FLY_FAST then
		targetAmp = 0.22
		targetFreq = wingSpeed * 1.5
		targetSpan = 0.88
		targetBTilt = math.rad(-16)
		targetTipDef = -0.3 * math.clamp(speed / 55, 0, 1)
		targetMemCurve = -0.08
		targetLift = 0.25
		targetRandom = 0.012
		targetFlapStyle = "shallow"
		targetPower = 0.4
		targetRecovery = 0.6
		targetFold = 0.35
		targetShoulder = 0.35
		targetTipLag = 0.2
		
	elseif state == FlightState.ASCEND then
		targetAmp = 0.65
		targetFreq = wingSpeed * 1.25
		targetSpan = 1.40
		targetWTilt = math.rad(12)
		targetBTilt = math.rad(10)
		targetTipDef = 0.15
		targetMemCurve = -0.12
		targetLift = 0.95
		targetRandom = 0.035
		targetFlapStyle = "power"
		targetPower = 0.9
		targetRecovery = 0.35
		targetFold = 0.6
		targetShoulder = 0.85
		targetTipLag = 0.4
		
	elseif state == FlightState.DESCEND then
		targetAmp = 0.1
		targetFreq = 1.0
		targetSpan = 1.02
		targetWTilt = math.rad(-8)
		targetBTilt = math.rad(-4)
		targetTipDef = -0.12
		targetMemCurve = 0.18
		targetLift = 0.15
		targetRandom = 0.02
		targetFlapStyle = "glide"
		targetPower = 0.2
		targetRecovery = 0.7
		targetFold = 0.3
		targetShoulder = 0.25
		targetTipLag = 0.1
		
	elseif state == FlightState.GLIDE then
		targetAmp = 0.0
		targetFreq = 0.0
		targetSpan = 1.50
		targetBTilt = math.rad(-4)
		targetTipDef = -0.06 * math.clamp(speed / 35, 0, 1)
		targetMemCurve = 0.04
		targetLift = 0.08
		targetRandom = 0.025
		targetFlapStyle = "none"
		targetPower = 0
		targetRecovery = 0.5
		targetFold = 0
		targetShoulder = 0.2
		targetTipLag = 0.05
		
	elseif state == FlightState.DIVE then
		targetAmp = 0.04
		targetFreq = 0.4
		targetSpan = 0.60
		targetBTilt = math.rad(-32)
		targetWTilt = math.rad(-4)
		targetTipDef = -0.45
		targetMemCurve = -0.22
		targetLift = 0.03
		targetRandom = 0.015
		targetFlapStyle = "shallow"
		targetPower = 0.15
		targetRecovery = 0.8
		targetFold = 0.2
		targetShoulder = 0.15
		targetTipLag = 0.1
		
	elseif state == FlightState.LANDING then
		local landProg = AnimState.landingProgress or 0
		targetAmp = 0.55 * (1 - landProg) + 0.08 * landProg
		targetFreq = 2.8 * (1 - landProg) + 0.4 * landProg
		targetSpan = 1.30 * (1 - landProg) + 0.45 * landProg
		targetBTilt = math.rad(4 * (1 - landProg))
		targetTipDef = 0.25 * (1 - landProg)
		targetMemCurve = 0.12 * (1 - landProg)
		targetLift = 0.7 * (1 - landProg)
		targetRandom = 0.018
		targetFlapStyle = "wide"
		targetPower = 0.5 * (1 - landProg)
		targetRecovery = 0.4 * (1 - landProg) + 0.7 * landProg
		targetFold = 0.5 * (1 - landProg)
		targetShoulder = 0.6 * (1 - landProg)
		targetTipLag = 0.25 * (1 - landProg)
		
	elseif state == FlightState.BRAKE then
		targetAmp = 0.45
		targetFreq = wingSpeed * 0.65
		targetSpan = 1.22
		targetBTilt = math.rad(8)
		targetTipDef = 0.35
		targetMemCurve = 0.22
		targetLift = 0.85
		targetFlapStyle = "wide"
		targetPower = 0.7
		targetRecovery = 0.45
		targetFold = 0.55
		targetShoulder = 0.65
		targetTipLag = 0.3
		
	elseif state == FlightState.TURN_LEFT then
		targetAmp = 0.3
		targetFreq = wingSpeed * 1.08
		targetSpan = 0.92
		targetBTilt = math.rad(-10)
		targetMemCurve = 0.08
		targetLift = 0.45
		targetFlapStyle = "normal"
		targetPower = 0.5
		targetRecovery = 0.5
		targetFold = 0.5
		targetShoulder = 0.5
		targetTipLag = 0.3
		
	elseif state == FlightState.TURN_RIGHT then
		targetAmp = 0.3
		targetFreq = wingSpeed * 1.08
		targetSpan = 0.92
		targetBTilt = math.rad(10)
		targetMemCurve = 0.08
		targetLift = 0.45
		targetFlapStyle = "normal"
		targetPower = 0.5
		targetRecovery = 0.5
		targetFold = 0.5
		targetShoulder = 0.5
		targetTipLag = 0.3
	end
	
	-- Air resistance
	local airResist = math.clamp(speed / 65, 0, 1)
	AnimState.airPressure = airResist
	targetTipDef = targetTipDef - (airResist * 0.35)
	targetMemCurve = targetMemCurve - (airResist * 0.12)
	
	-- Smooth parameter transitions
	local blendRate = math.min(dt * 7, 1)
	AnimState.currentAmplitude = AnimState.currentAmplitude + (targetAmp - AnimState.currentAmplitude) * blendRate
	AnimState.currentFrequency = AnimState.currentFrequency + (targetFreq - AnimState.currentFrequency) * blendRate
	AnimState.currentBodyTilt = AnimState.currentBodyTilt + (targetBTilt - AnimState.currentBodyTilt) * blendRate
	AnimState.currentWingTilt = AnimState.currentWingTilt + (targetWTilt - AnimState.currentWingTilt) * blendRate
	
	-- Wing span pake dynamic system
	local smoothedSpan = updateWingSpan(state, dt)
	AnimState.currentSpan = smoothedSpan
	
	-- Apply smoothed values
	p.flapAmplitude = AnimState.currentAmplitude
	p.flapFrequency = AnimState.currentFrequency
	p.wingSpan = AnimState.currentSpan
	p.wingTilt = AnimState.currentWingTilt
	p.bodyTilt = AnimState.currentBodyTilt
	p.membraneCurve = targetMemCurve
	p.tipDeflection = targetTipDef
	p.liftIntensity = targetLift
	p.randomness = targetRandom
	p.flapStyle = targetFlapStyle
	p.powerIntensity = targetPower
	p.recoverySpeed = targetRecovery
	p.foldSpeed = targetFold
	p.shoulderDrive = targetShoulder
	p.wingTipLag = targetTipLag
	
	return p
end

local WingPhysics = {}

function WingPhysics:calculateFlapAngle(propIndex, params, dt, airPressure, glideWind)
	local off = WING_OFFSETS[propIndex]
	if not off then return 0, 0, 0, Vector3.zero end
	
	local t = off.t
	local side = off.side
	local bone = off.bone
	
	--SPINE BONE 
	if bone == "spine" then
		local spineBreath = math.sin(bobTime * 0.7) * 0.06
		local organic = (smoothNoise(bobTime * 0.3, propIndex * 7.1) - 0.5) * 0.01
		return spineBreath * 0.5 + organic, 0, 0, Vector3.new(0, spineBreath, 0)
	end
	
	-- GLIDE MODE
	if params.flapStyle == "none" or params.flapFrequency < 0.1 then
		local windMotion = glideWind:getMotion(bone, t, side)
		
		-- Base position dari air pressure
		local tipDrag = airPressure:getTipDrag(t)
		local membraneTension = airPressure:getMembraneTension(t)
		
		-- Organic micro motion 
		local organicX = (smoothNoise(bobTime * 0.4 + propIndex * 3.7, bobTime * 0.25 + t * 2) - 0.5) * params.randomness * t * 2
		organicX = organicX + (smoothNoise(bobTime * 0.12 + propIndex, bobTime * 0.06) - 0.5) * params.randomness * 0.4 * t
		local organicZ = (smoothNoise(bobTime * 0.35 + propIndex * 2.3, bobTime * 0.2 + t * 3) - 0.5) * params.randomness * t
		
		local flapX = windMotion.x + tipDrag.X * 0.1 + organicX
		local sweepY = windMotion.z + tipDrag.Z * 0.05
		local twistZ = windMotion.y + membraneTension + organicZ
		
		-- Dynamic skeleton
		local boneScale = getDynamicBoneScale(bone, "GLIDE", 0, AnimState.horizontalSpeed, dt)
		local posOffset = tipDrag * 0.3
		posOffset = posOffset * boneScale
		
		return flapX, sweepY, twistZ, posOffset
	end
	
	-- PHASE FLAP SYSTEM 
	local cyclePos = AnimState.flapCyclePos
	local phase = AnimState.currentPhase
	local phasePos = AnimState.phaseProgress
	
	-- Wing tip delay (whip effect) - semakin ke ujung, semakin lambat
	local tipDelayFactor = math.pow(t, 1.8)
	local delayedCyclePos = cyclePos - tipDelayFactor * params.wingTipLag
	if delayedCyclePos < 0 then delayedCyclePos = delayedCyclePos + 1 end
	
	local delayedPhase, delayedPhasePos = getFlapPhase(delayedCyclePos)
	
	local flapAngle = 0
	local sweepAngle = 0
	local twistAngle = 0
	local tipDeflect = 0
	
	-- Amplitude scale berdasarkan bone position
	local ampScale = params.flapAmplitude
	
	if phase == "FOLD" then
		-- FASE 1
		local foldCurve = easeInCubic(phasePos)
		flapAngle = foldCurve * ampScale * 0.6 -- Naik ke atas (fold)
		sweepAngle = -foldCurve * ampScale * 0.35 * t -- Menutup (sweep inward)
		twistAngle = foldCurve * ampScale * 0.25 * t -- Twist untuk fold
		tipDeflect = foldCurve * 0.08 * t -- Tip mendekat sedikit
		
	elseif phase == "TOP" then
		-- FASE 2
		local topHold = easeInOutCubic(phasePos)
		flapAngle = ampScale * 0.65 + topHold * ampScale * 0.05 -- Hold di posisi atas
		sweepAngle = -ampScale * 0.38 * t -- Paling menutup
		twistAngle = ampScale * 0.28 * t -- Twist maksimum
		tipDeflect = 0.1 * t -- Tip ready untuk power stroke
		
	elseif phase == "POWER" then
		-- FASE 3
		local powerCurve = easeOutCubic(phasePos)
		local powerIntensity = params.powerIntensity
		
		-- Downstroke kuat dan cepat
		flapAngle = ampScale * 0.7 - powerCurve * ampScale * 1.4 * powerIntensity
		-- Sweep membuka lebar dengan cepat
		sweepAngle = -ampScale * 0.38 * t + powerCurve * ampScale * 0.55 * t * powerIntensity
		-- Twist melawan arah untuk leverage
		twistAngle = ampScale * 0.28 * t - powerCurve * ampScale * 0.45 * t * powerIntensity
		-- Tip deflect ke bawah karena air resistance
		tipDeflect = 0.1 * t - powerCurve * 0.25 * t * (1 + airPressure.smoothedPressure * 2)
		
		-- Overshoot subtlee
		if powerCurve > 0.7 and powerCurve < 0.95 then
			local overshoot = math.sin((powerCurve - 0.7) / 0.25 * math.pi) * 0.04
			flapAngle = flapAngle - overshoot * ampScale * t
		end
		
	elseif phase == "RECOVERY" then
		-- FASE 4
		local recoveryCurve = easeInCubic(phasePos)
		local recoverySpeed = params.recoverySpeed
		
		-- Naik perlahan kembali ke posisi fold
		flapAngle = -ampScale * 0.7 * (1 - recoveryCurve * recoverySpeed) + ampScale * 0.65 * recoveryCurve * recoverySpeed
		sweepAngle = ampScale * 0.17 * t * (1 - recoveryCurve * 0.6)
		twistAngle = -ampScale * 0.17 * t * (1 - recoveryCurve * 0.5)
		tipDeflect = -0.15 * t * (1 - recoveryCurve * 0.7)
	end
	
	-- ASYMMETRICAL TIMING 
	-- Power stroke lebih cepat dari recover
	if phase == "POWER" then
		flapAngle = flapAngle * 1.1 -- Extra power
	elseif phase == "RECOVERY" then
		flapAngle = flapAngle * 0.92 -- Gentler recovery
	end
	
	-- SECONDARY HARMONICS 
	if t > 0.2 and params.flapFrequency > 0.5 then
		-- Harmonic 2
		local harmonicPhase = cyclePos * 2 * math.pi * 2.1
		flapAngle = flapAngle + math.sin(harmonicPhase + 0.5) * ampScale * 0.08 * t
		
		-- Harmonic ketiga 
		if t > 0.6 then
			local microPhase = cyclePos * 2 * math.pi * 3.7
			flapAngle = flapAngle + math.sin(microPhase) * ampScale * 0.03 * math.pow(t, 2)
		end
	end
	
	-- WING TIP DEFLECTION 
	tipDeflect = tipDeflect + params.tipDeflection * math.pow(t, 1.8)
	
	-- Dynamic tip deflection berdasarkan cycle
	local cycleSin = math.sin(cyclePos * 2 * math.pi)
	if cycleSin > 0 then -- Downstroke area
		tipDeflect = tipDeflect - cycleSin * 0.06 * t * (1 + airPressure.smoothedPressure)
	end
	
	-- MEMBRANE PHYSICS 
	local membraneCurve = 0
	if params.flapFrequency > 0.1 then
		local cyclePosNorm = (math.sin(cyclePos * 2 * math.pi) + 1) / 2
		-- Membrane curves lebih saat upstroke
		membraneCurve = params.membraneCurve * (0.7 + cyclePosNorm * 0.6) * t
	else
		membraneCurve = params.membraneCurve * t
	end
	membraneCurve = membraneCurve - airPressure:getMembraneTension(t)
	
	-- DYNAMIC SKELETON 
	local boneScale = getDynamicBoneScale(bone, phase, phasePos, AnimState.horizontalSpeed, dt)
	AnimState.boneScales[propIndex] = boneScale
	
	-- Position offset 
	local posOffset = airPressure:getTipDrag(t) * 0.4
	posOffset = posOffset * boneScale
	
	-- Dynamic bone length offset
	if side ~= 0 then
		local boneStretch = (boneScale - 1.0) * off.pos.X * 0.3
		posOffset = posOffset + Vector3.new(boneStretch, 0, 0)
	end
	
	-- ORGANIC MICRO MOTION 
	local organicX = 0
	local organicZ = 0
	if params.randomness > 0 then
		-- Layer 1
		organicX = (smoothNoise(bobTime * 0.8 + propIndex * 3.7, bobTime * 0.5 + t * 2) - 0.5) * params.randomness * t
		organicZ = (smoothNoise(bobTime * 0.6 + propIndex * 2.3, bobTime * 0.4 + t * 3) - 0.5) * params.randomness * t * 0.7
		
		-- Layer 2
		organicX = organicX + (smoothNoise(bobTime * 0.15 + propIndex, bobTime * 0.08) - 0.5) * params.randomness * 0.5 * t
		organicZ = organicZ + (smoothNoise(bobTime * 0.12 + propIndex * 1.7, bobTime * 0.06) - 0.5) * params.randomness * 0.3 * t
		
		-- Layer 3
		if t > 0.5 then
			organicX = organicX + (smoothNoise(bobTime * 3 + propIndex * 5, bobTime * 2.1) - 0.5) * params.randomness * 0.15 * math.pow(t, 2)
		end
	end
	
	-- PERCH FOLD 
	local perchFoldX = 0
	local perchFoldZ = 0
	if AnimState.isPerched then
		AnimState.perchTransition = math.min(AnimState.perchTransition + dt * 1.5, 1)
		local fold = AnimState.perchTransition
		perchFoldZ = fold * math.rad(65) * side
		if bone == "wingtip" then
			perchFoldX = fold * math.rad(-35)
			perchFoldZ = perchFoldZ + fold * math.rad(25) * side
		elseif bone == "finger" then
			perchFoldX = fold * math.rad(-20)
			perchFoldZ = perchFoldZ + fold * math.rad(15) * side
		elseif bone == "wrist" then
			perchFoldX = fold * math.rad(-10)
			perchFoldZ = perchFoldZ + fold * math.rad(10) * side
		end
	else
		AnimState.perchTransition = math.max(AnimState.perchTransition - dt * 2, 0)
		local fold = AnimState.perchTransition
		if fold > 0 then
			perchFoldZ = fold * math.rad(65) * side
			if bone == "wingtip" then
				perchFoldX = fold * math.rad(-35)
				perchFoldZ = perchFoldZ + fold * math.rad(25) * side
			elseif bone == "finger" then
				perchFoldX = fold * math.rad(-20)
				perchFoldZ = perchFoldZ + fold * math.rad(15) * side
			elseif bone == "wrist" then
				perchFoldX = fold * math.rad(-10)
				perchFoldZ = perchFoldZ + fold * math.rad(10) * side
			end
		end
	end
	
	-- ASYMMETRIC TURNING
	local turnAsym = 0
	local turnAsymSweep = 0
	if AnimState.currentState == FlightState.TURN_LEFT then
		if side == -1 then
			turnAsym = -0.12 * ((params.flapAmplitude > 0 and params.flapFrequency > 0.1) and math.sin(cyclePos * 2 * math.pi) * 0.5 + 0.5 or 0)
			turnAsymSweep = -0.08
		elseif side == 1 then
			turnAsym = 0.08 * ((params.flapAmplitude > 0 and params.flapFrequency > 0.1) and math.sin(cyclePos * 2 * math.pi) * 0.5 + 0.5 or 0)
			turnAsymSweep = 0.05
		end
	elseif AnimState.currentState == FlightState.TURN_RIGHT then
		if side == 1 then
			turnAsym = -0.12 * ((params.flapAmplitude > 0 and params.flapFrequency > 0.1) and math.sin(cyclePos * 2 * math.pi) * 0.5 + 0.5 or 0)
			turnAsymSweep = -0.08
		elseif side == -1 then
			turnAsym = 0.08 * ((params.flapAmplitude > 0 and params.flapFrequency > 0.1) and math.sin(cyclePos * 2 * math.pi) * 0.5 + 0.5 or 0)
			turnAsymSweep = 0.05
		end
	end
	
	--BREATHING 
	local breath = 0
	if AnimState.currentState == FlightState.IDLE or AnimState.currentState == FlightState.PERCH then
		breath = math.sin(bobTime * 0.8) * 0.06 * (1 - t * 0.5)
	end
	
	-- COMBINE ALL ROTATIONS
	local finalFlap = flapAngle + tipDeflect + organicX + perchFoldX + breath + turnAsym
	local finalSweep = sweepAngle + turnAsymSweep
	local finalTwist = twistAngle + membraneCurve + organicZ + perchFoldZ
	
	return finalFlap, finalSweep, finalTwist, posOffset
end

-- Shoulder calculation wrapper
function WingPhysics:calculateShoulder(params, dt, airPressure)
	return ShoulderSystem:calculate(
		AnimState.currentPhase,
		AnimState.phaseProgress,
		params,
		AnimState.horizontalSpeed,
		airPressure,
		dt
	)
end

local AnimationController = {}

function AnimationController:update(character, root, dt)
	if not summonActive or #propCache < #WING_OFFSETS then return end
	if not root then return end
	
	-- Detect flight state
	local newState = StateDetector:analyze(character, root, dt)
	
	-- State transition handling
	if newState ~= AnimState.currentState then
		AnimState.previousState = AnimState.currentState
		AnimState.currentState = newState
		AnimState.stateTimer = 0
		AnimState.transitionBlend = 0
		table.insert(AnimState.stateHistory, 1, {state = newState, time = tick(), duration = 0})
		if #AnimState.stateHistory > 15 then table.remove(AnimState.stateHistory) end
	else
		AnimState.stateTimer = AnimState.stateTimer + dt
	end
	AnimState.stateTimerTotal = AnimState.stateTimerTotal + dt
	AnimState.transitionBlend = math.min(AnimState.transitionBlend + dt * 4, 1)
	
	-- Generate animation parameters
	local params = ParamGenerator:getParams(AnimState.currentState, dt)
	
	-- Update air pressure system
	AirPressureSystem:update(AnimState.horizontalSpeed, AnimState.verticalSpeed, dt)
	
	-- Update glide wind system
	GlideWindSystem:update(dt, AnimState.horizontalSpeed)
	
	-- Update 4-phase flap cycle
	if params.flapFrequency > 0.01 then
		-- Advance flap accumulator
		AnimState.flapAccumulator = AnimState.flapAccumulator + dt * params.flapFrequency
		-- Normalize ke 0-1
		AnimState.flapCyclePos = AnimState.flapAccumulator % 1.0
		-- Get current phase
		AnimState.currentPhase, AnimState.phaseProgress = getFlapPhase(AnimState.flapCyclePos)
	else
		-- Even when not flapping, slowly advance for wind effects
		AnimState.flapAccumulator = AnimState.flapAccumulator + dt * 0.3
		AnimState.flapCyclePos = AnimState.flapAccumulator % 1.0
		AnimState.currentPhase = "RECOVERY"
		AnimState.phaseProgress = 1.0
	end
	
	-- Calculate shoulder animation (6 DOF)
	local shoulderAnim = self:calculateShoulder(params, dt, AirPressureSystem)
	
	-- Base position calculation
	local basePos = root.Position
	local facing = root.CFrame.LookVector
	local faceFlat = Vector3.new(facing.X, 0, facing.Z)
	local faceCF = faceFlat.Magnitude > 0.01 and CFrame.new(Vector3.zero, faceFlat) or CFrame.new()
	
	-- Hover bobbing
	local hoverBob = 0
	if flyActive and AnimState.currentState == FlightState.HOVER then
		hoverBob = math.sin(bobTime * 1.4) * 0.35
	end
	
	-- Landing descent offset
	local landOffset = 0
	if AnimState.currentState == FlightState.LANDING then
		landOffset = AnimState.landingProgress * 0.5
	end
	
	-- Process each wing prop
	for i, prop in ipairs(propCache) do
		if i <= #WING_OFFSETS and prop and prop.Parent then
			local off = WING_OFFSETS[i]
			local t = off.t
			local side = off.side
			local bone = off.bone
			
			-- Skip spine untuk shoulder calculation
			if bone == "spine" then
				local spineBreath = math.sin(bobTime * 0.7) * 0.06
				local localPos = off.pos + Vector3.new(0, spineBreath, 0)
				local worldPos, finalRot
				
				if flyActive then
					local flyY = flyHeightOffset + 2.5
					if AnimState.currentState == FlightState.HOVER then
						flyY = flyY + hoverBob
					end
					worldPos = basePos + Vector3.new(0, flyY, 0) + (faceCF * localPos)
				else
					local groundY = 2.8
					if AnimState.currentState == FlightState.PERCH then groundY = 1.5 end
					worldPos = basePos + Vector3.new(0, groundY, 0) + (faceCF * localPos)
				end
				
				finalRot = CFrame.Angles(math.rad(20) + spineBreath * 0.5, 0, 0)
				local targetCF = CFrame.new(worldPos) * faceCF * finalRot
				
				task.spawn(function()
					local cfR = prop:FindFirstChild("SetCurrentCFrame")
					if cfR then pcall(function() cfR:InvokeServer(targetCF) end) end
					if colorTick > 1.2 then
						local colR = prop:FindFirstChild("ChangePropColor")
						if colR then pcall(function() colR:InvokeServer(propColor) end) end
					end
				end)
			else
				-- Calculate wing flex physics
				local flapX, sweepY, twistZ, posOffset = WingPhysics:calculateFlapAngle(
					i, params, dt, AirPressureSystem, GlideWindSystem
				)
				
				-- Dynamic wing span scaling
				local spanScale = AnimState.currentSpan
				-- Wing tip extends slightly more untuk silhouette
				if t > 0.85 then
					if AnimState.currentState == FlightState.GLIDE or AnimState.currentState == FlightState.LANDING then
						spanScale = spanScale * 1.06
					elseif AnimState.currentState == FlightState.DIVE then
						spanScale = spanScale * 0.92
					elseif AnimState.currentState == FlightState.ASCEND then
						spanScale = spanScale * 1.08
					end
				end
			
				local bodyTilt = AnimState.currentBodyTilt
				if side ~= 0 then
					if AnimState.currentState == FlightState.TURN_LEFT then
						bodyTilt = bodyTilt + math.rad(-6) * side
					elseif AnimState.currentState == FlightState.TURN_RIGHT then
						bodyTilt = bodyTilt + math.rad(6) * side
					else
						bodyTilt = bodyTilt * (1 + side * 0.05)
					end
				end
				
				local wingTilt = AnimState.currentWingTilt * t
				
				local shoulderOffset = Vector3.zero
				local shoulderRot = CFrame.new()
				
				if bone == "shoulder" then
					shoulderOffset = Vector3.new(0, shoulderAnim.posY, shoulderAnim.zPos)
					shoulderRot = CFrame.Angles(shoulderAnim.xRot, 0, shoulderAnim.zRot * side)
				else
					local shoulderInfluence = (1 - t) * 0.85 
					shoulderOffset = Vector3.new(0, shoulderAnim.posY * shoulderInfluence, shoulderAnim.zPos * shoulderInfluence * 0.5)
					
					
					local shoulderTwist = shoulderAnim.zRot * side * shoulderInfluence * 0.3
					twistZ = twistZ + shoulderTwist
				end
				
				local animRot = CFrame.Angles(
					flapX + bodyTilt + wingTilt,
					sweepY * side,
					twistZ * side
				)
				
				local scaledPos = off.pos * Vector3.new(spanScale, 1, spanScale)
				scaledPos = scaledPos + posOffset + shoulderOffset
				
				local posOffsetFinal = Vector3.new(0, hoverBob - landOffset, 0)
				
				-- Calculate world position
				local localPos = scaledPos + posOffsetFinal
				local worldPos
				
				if flyActive then
					local flyY = flyHeightOffset + 2.5
					if AnimState.currentState == FlightState.HOVER then
						flyY = flyY + hoverBob
					end
					worldPos = basePos + Vector3.new(0, flyY, 0) + (faceCF * localPos)
				else
					local groundY = 2.8
					if AnimState.currentState == FlightState.PERCH then
						groundY = 1.5
					end
					worldPos = basePos + Vector3.new(0, groundY, 0) + (faceCF * localPos)
				end
				
				local finalRot = off.rot * animRot * shoulderRot
				local targetCF = CFrame.new(worldPos) * faceCF * finalRot
				
				-- Send to server
				task.spawn(function()
					local cfR = prop:FindFirstChild("SetCurrentCFrame")
					if cfR then
						pcall(function() cfR:InvokeServer(targetCF) end)
					end
					if colorTick > 1.2 then
						local colR = prop:FindFirstChild("ChangePropColor")
						if colR then
							pcall(function() colR:InvokeServer(propColor) end)
						end
					end
				end)
			end
		end
	end
	
	if frameCount % 20 == 0 and statusLbl then
		local stateText = AnimState.currentState
		local extra = ""
		if AnimState.isPerched then extra = " [P]" end
		if AirPressureSystem.smoothedPressure > 0.3 then
			extra = extra .. " | Air: " .. math.floor(AirPressureSystem.smoothedPressure * 100) .. "%"
		end
		extra = extra .. " | Ph: " .. AnimState.currentPhase
		statusLbl.Text = "State: " .. stateText .. extra
	end
end

function AnimationController:calculateShoulder(params, dt, airPressure)
	return WingPhysics:calculateShoulder(params, dt, airPressure)
end

-- FUNCTIONS 
local function scanProps()
	propCache = {}
	local ok, wc = pcall(function()
		return workspace:WaitForChild("WorkspaceCom", 3):WaitForChild("001_TrafficCones", 3)
	end)
	if ok and wc then
		for _, v in ipairs(wc:GetChildren()) do
			if v.Name:find("Prop") and v.Name:find(plr.Name) then
				table.insert(propCache, v)
			end
		end
	else
		local function search(p, d)
			if d > 5 then return end
			for _, c in ipairs(p:GetChildren()) do
				if c.Name:find(plr.Name) and c:FindFirstChild("SetCurrentCFrame") then
					local dup = false
					for _, x in ipairs(propCache) do if x == c then dup = true break end end
					if not dup then table.insert(propCache, c) end
				end
				search(c, d + 1)
			end
		end
		search(workspace, 0)
	end
	return #propCache
end

local function disableAntiSit()
	if antiSitConn then
		antiSitConn:Disconnect()
		antiSitConn = nil
	end
	if antiSitHeartbeatConn then
		antiSitHeartbeatConn:Disconnect()
		antiSitHeartbeatConn = nil
	end
	local char = plr.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if hum then
		hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
	end
end

local function setupAntiSit()
	disableAntiSit()
	local char = plr.Character
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")
	if not hum then return end
	hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	antiSitConn = hum:GetPropertyChangedSignal("SeatPart"):Connect(function()
		if not antiSitActive then return end
		if hum.SeatPart then
			hum.Sit = false
			hum.Jump = true
			if root then
				root.CFrame = root.CFrame + Vector3.new(0, 3, 0)
			end
			hum:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)
	antiSitHeartbeatConn = RS.Heartbeat:Connect(function()
		if not antiSitActive then return end
		if hum.Parent then
			hum.Sit = false
			if hum.SeatPart then
				hum.SeatPart = nil
				hum:ChangeState(Enum.HumanoidStateType.GettingUp)
			end
		end
	end)
end

plr.CharacterAdded:Connect(function()
	task.wait(1)
	if antiSitActive then setupAntiSit() end
end)

local scanSection = createSection("PROP")
local scanRow = createRow(28)
local scanBtn = createButton2("SCAN PROPS", Color3.fromRGB(60, 60, 80), scanRow)
scanBtn.Size = UDim2.new(0.48, 0, 1, 0)
local propDisplay = createDisplay(scanRow, 0.5, 0.48)
local propCountLbl = createLabel(propDisplay, "Props: 0", 10)

local summonRow = createRow(30)
local summonBtn = createButton2("SUMMON WINGS", Color3.fromRGB(150, 30, 30), summonRow)
summonBtn.Size = UDim2.new(1, 0, 1, 0)
summonBtn.TextSize = 12

local flySection = createSection("FLIGHT CONTROL")
local flyRow = createRow(28)
local flyOffBtn = createButton2("LAND", Color3.fromRGB(60, 60, 80), flyRow)
flyOffBtn.Size = UDim2.new(0.48, 0, 1, 0)
local flyOnBtn = createButton2("FLY", Color3.fromRGB(150, 30, 30), flyRow)
flyOnBtn.Size = UDim2.new(0.48, 0, 1, 0)
flyOnBtn.Position = UDim2.new(0.52, 0, 0, 0)

local heightSection = createSection("FLIGHT HEIGHT")
local heightRow = createRow(28)
local hDownBtn = createButton2("▼", Color3.fromRGB(180, 60, 60), heightRow)
hDownBtn.Size = UDim2.new(0.2, 0, 1, 0)
local hDisplay = createDisplay(heightRow, 0.22, 0.56)
local heightLbl = createLabel(hDisplay, "Height: 0", 10)
local hUpBtn = createButton2("▲", Color3.fromRGB(60, 180, 60), heightRow)
hUpBtn.Size = UDim2.new(0.2, 0, 1, 0)
hUpBtn.Position = UDim2.new(0.8, 0, 0, 0)

local stepRow = createRow(24)
local stepLbl = Instance.new("TextLabel", stepRow)
stepLbl.Size = UDim2.new(0.2, 0, 1, 0)
stepLbl.Text = "Step:"
stepLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
stepLbl.TextSize = 10
stepLbl.Font = Enum.Font.GothamBold
stepLbl.BackgroundTransparency = 1
stepLbl.TextXAlignment = Enum.TextXAlignment.Left

local stepBtns = {}
local stepDefs = {1, 5, 10, 50}
for i, sv in ipairs(stepDefs) do
	local btn = createButton2(tostring(sv), Color3.fromRGB(40, 40, 60), stepRow)
	btn.Size = UDim2.new(0.18, 0, 1, 0)
	btn.Position = UDim2.new(0.22 + (i-1) * 0.195, 0, 0, 0)
	btn.TextSize = 9
	stepBtns[i] = btn
	btn.MouseButton1Click:Connect(function()
		heightStep = sv
		for _, b in ipairs(stepBtns) do
			b.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
		end
		btn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	end)
end
stepBtns[1].BackgroundColor3 = Color3.fromRGB(200, 50, 50)

local colorSection = createSection("WING COLOR")
local colorRow = createRow(28)
local colorDefs = {
	{n = "RED", c = Color3.fromRGB(200, 50, 50)},
	{n = "BLUE", c = Color3.fromRGB(0, 200, 255)},
	{n = "GOLD", c = Color3.fromRGB(255, 200, 40)},
	{n = "PURPLE", c = Color3.fromRGB(160, 40, 255)},
	{n = "GREEN", c = Color3.fromRGB(30, 255, 30)},
}
local colorBtns = {}
for i, cd in ipairs(colorDefs) do
	local btn = createButton2(cd.n, Color3.fromRGB(40, 40, 60), colorRow)
	btn.Size = UDim2.new(0.18, 0, 1, 0)
	btn.Position = UDim2.new((i-1) * 0.205, 0, 0, 0)
	btn.TextSize = 9
	colorBtns[i] = btn
	btn.MouseButton1Click:Connect(function()
		propColor = cd.c
		Stroke.Color = cd.c
		for _, b in ipairs(colorBtns) do
			b.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
		end
		btn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	end)
end
colorBtns[1].BackgroundColor3 = Color3.fromRGB(200, 50, 50)

local speedSection = createSection("WING FLAP SPEED")
local speedRow = createRow(28)
local speedDownBtn = createButton2("SLOW", Color3.fromRGB(180, 60, 60), speedRow)
speedDownBtn.Size = UDim2.new(0.48, 0, 1, 0)
local speedUpBtn = createButton2("FAST", Color3.fromRGB(60, 180, 60), speedRow)
speedUpBtn.Size = UDim2.new(0.48, 0, 1, 0)
speedUpBtn.Position = UDim2.new(0.52, 0, 0, 0)

local antiSitSection = createSection("ANTI SIT")
local antiSitRow = createRow(28)
local antiSitOffBtn = createButton2("OFF", Color3.fromRGB(180, 60, 60), antiSitRow)
antiSitOffBtn.Size = UDim2.new(0.48, 0, 1, 0)
local antiSitOnBtn = createButton2("ON", Color3.fromRGB(60, 60, 80), antiSitRow)
antiSitOnBtn.Size = UDim2.new(0.48, 0, 1, 0)
antiSitOnBtn.Position = UDim2.new(0.52, 0, 0, 0)

local resetSection = createSection("RESET")
local resetRow = createRow(28)
local resetBtn = createButton2("🔄 RESET ALL", Color3.fromRGB(180, 40, 40), resetRow)
resetBtn.Size = UDim2.new(1, 0, 1, 0)

local statusRow = createRow(20)
local statusLbl = createLabel(statusRow, "Status: Ready", 10, Color3.fromRGB(200, 200, 200))

scanBtn.MouseButton1Click:Connect(function()
	local n = scanProps()
	propCountLbl.Text = "Props: " .. n
	statusLbl.Text = "Status: " .. n .. " props found"
end)

summonBtn.MouseButton1Click:Connect(function()
	local needed = #WING_OFFSETS
	if #propCache < needed then
		local n = scanProps()
		propCountLbl.Text = "Props: " .. n
		if n < needed then
			statusLbl.Text = "Status: Need " .. needed .. " props for wings"
			return
		end
	end
	summonActive = not summonActive
	summonBtn.Text = summonActive and "✅ ACTIVE" or "SUMMON WINGS"
	statusLbl.Text = summonActive and "Status: Wings active" or "Status: Wings deactivated"
	if not summonActive then flyActive = false end
end)

flyOnBtn.MouseButton1Click:Connect(function()
	if not summonActive then statusLbl.Text = "Status: Summon first!"; return end
	flyActive = true
	AnimState.perchTimer = 0
	AnimState.isPerched = false
	AnimState.stateTimerTotal = 0
	flyOnBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	flyOffBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
	statusLbl.Text = "Status: Flying"
end)

flyOffBtn.MouseButton1Click:Connect(function()
	flyActive = false
	flyOffBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
	flyOnBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
	statusLbl.Text = "Status: Landed"
end)

hUpBtn.MouseButton1Click:Connect(function()
	flyHeightOffset = math.clamp(flyHeightOffset + heightStep, -200, 200)
	heightLbl.Text = "Height: " .. flyHeightOffset
end)

hDownBtn.MouseButton1Click:Connect(function()
	flyHeightOffset = math.clamp(flyHeightOffset - heightStep, -200, 200)
	heightLbl.Text = "Height: " .. flyHeightOffset
end)

speedUpBtn.MouseButton1Click:Connect(function()
	wingSpeed = math.min(wingSpeed + 0.5, 6)
	statusLbl.Text = "Speed: " .. string.format("%.1f", wingSpeed)
end)

speedDownBtn.MouseButton1Click:Connect(function()
	wingSpeed = math.max(wingSpeed - 0.5, 0.5)
	statusLbl.Text = "Speed: " .. string.format("%.1f", wingSpeed)
end)

antiSitOnBtn.MouseButton1Click:Connect(function()
	antiSitActive = true
	setupAntiSit()
	antiSitOnBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	antiSitOffBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
	statusLbl.Text = "Status: Anti Sit ON"
end)

antiSitOffBtn.MouseButton1Click:Connect(function()
	antiSitActive = false
	disableAntiSit()
	antiSitOffBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
	antiSitOnBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
	statusLbl.Text = "Status: Anti Sit OFF"
end)

resetBtn.MouseButton1Click:Connect(function()
	summonActive = false
	flyActive = false
	flyHeightOffset = 0
	heightStep = 1
	wingSpeed = 2.5
	antiSitActive = false
	disableAntiSit()
	
	-- Reset animation state
	AnimState.currentState = FlightState.IDLE
	AnimState.previousState = FlightState.IDLE
	AnimState.stateTimer = 0
	AnimState.stateTimerTotal = 0
	AnimState.takeOffFlapCount = 0
	AnimState.takeOffActive = false
	AnimState.landingActive = false
	AnimState.landingProgress = 0
	AnimState.perchTimer = 0
	AnimState.isPerched = false
	AnimState.perchTransition = 0
	AnimState.glideTimer = 0
	AnimState.transitionBlend = 0
	AnimState.currentAmplitude = 0.3
	AnimState.currentFrequency = 2.5
	AnimState.currentSpan = 1.0
	AnimState.currentBodyTilt = 0
	AnimState.currentWingTilt = 0
	AnimState.flapCyclePos = 0
	AnimState.currentPhase = "RECOVERY"
	AnimState.phaseProgress = 0
	AnimState.flapAccumulator = 0
	
	currentSpanTarget = 1.0
	currentSpanSmoothed = 1.0
	spanVelocity = 0
	AirPressureSystem.smoothedPressure = 0
	AirPressureSystem.pressureVelocity = 0
	AirPressureSystem.tipDragX = 0
	AirPressureSystem.tipDragY = 0
	AirPressureSystem.membraneTension = 0
	ShoulderSystem.currentY = 0
	ShoulderSystem.currentZRot = 0
	ShoulderSystem.currentZPos = 0
	ShoulderSystem.currentXRot = 0
	ShoulderSystem.velocityY = 0
	ShoulderSystem.velocityZRot = 0
	ShoulderSystem.velocityZPos = 0
	ShoulderSystem.velocityXRot = 0
	GlideWindSystem.windTime = 0
	GlideWindSystem.gustPhase = 0
	GlideWindSystem.turbulence = 0
	for i = 1, 15 do AnimState.boneScales[i] = 1.0 end
	
	antiSitOffBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
	antiSitOnBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
	for _, btn in ipairs(stepBtns) do
		btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
	end
	stepBtns[1].BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	heightLbl.Text = "Height: 0"
	summonBtn.Text = "SUMMON WINGS"
	flyOffBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
	flyOnBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
	statusLbl.Text = "Status: Reseted"
end)

local open = true
Min.MouseButton1Click:Connect(function()
	open = not open
	ScrollFrame.Visible = open
	Main.Size = open and UDim2.new(0, 380, 0, 420) or UDim2.new(0, 380, 0, 55)
	Min.Text = open and "−" or "+"
end)

Close.MouseButton1Click:Connect(function()
	disableAntiSit()
	gui:Destroy()
end)

-- MAIN LOOP ANIMATION
RS.Heartbeat:Connect(function(dt)
	frameCount = frameCount + 1
	colorTick = colorTick + dt
	bobTime = bobTime + dt
	
	if frameCount % 2 ~= 0 then return end
	if not summonActive or #propCache < #WING_OFFSETS then return end
	
	local char = plr.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not char or not root then return end
	
	AnimationController:update(char, root, dt)
	
	if colorTick > 1.2 then colorTick = 0 end
end)
