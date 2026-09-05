local Fluent = loadstring(game:HttpGet(
	"https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
	))()


local SaveManager = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua" 
	))() 
 
 
 
local CorrectKey = "MHKZ Script123" 
 
local KeyWindow = Fluent:CreateWindow({ 
	Title = "MHKZ Hub - Key System", 
	SubTitle = "Key daxl ka", 
	TabWidth = 160, 
	Size = UDim2.fromOffset(450, 300), 
	Acrylic = true, 
	Theme = "Dark", 
	MinimizeKey = Enum.KeyCode.LeftControl 
}) 
 
local KeyTab = KeyWindow:AddTab({ 
	Title = "Key", 
	Icon = "key" 
}) 
 
local KeyInput = KeyTab:AddInput("KeyInput", { 
	Title = "Key Daxl ka", 
	Default = "", 
	Placeholder = "Key Daxl ka vere....", 
	Numeric = false, 
	Finished = false, 
}) 

local StartHub
 
KeyTab:AddButton({ 
	Title = "Checking Key", 
	Callback = function() 
		if KeyInput.Value == CorrectKey then 
			Fluent:Notify({ 
				Title = "MHKZ Hub", 
				Content = "Key ye ta drsta! 🔓", 
				Duration = 3 
			}) 
 
			KeyWindow:Destroy() 
 
			StartHub()
 
		else 
			Fluent:Notify({ 
				Title = "MHKZ Hub", 
				Content = "key xalata! ❌", 
				Duration = 3 
			}) 
		end 
	end 
}) 
 
 
 
 
 
StartHub = function()

local Camera = workspace.CurrentCamera 
local Viewport = Camera.ViewportSize 
 
-- Smaller window on phones 
local WindowWidth = math.min(430, Viewport.X - 20) 
local WindowHeight = math.min(350, Viewport.Y - 80) 
 
local Window = Fluent:CreateWindow({ 
	Title = "MHKZ Hub " .. Fluent.Version, 
	SubTitle = "by MHKZ", 
	TabWidth = 120, 
 
	-- SMALLER WINDOW 
	Size = UDim2.fromOffset(WindowWidth, WindowHeight), 
 
	Acrylic = true, 
	Theme = "Dark", 
 
	-- PC keyboard minimize 
	MinimizeKey = Enum.KeyCode.LeftControl 
}) 
 
 
--================================================== 
-- 📱 MOBILE FLOATING LOGO 
--================================================== 
 
local Player = game.Players.LocalPlayer 
local PlayerGui = Player:WaitForChild("PlayerGui") 
 
local MobileGui = Instance.new("ScreenGui") 
MobileGui.Name = "MobileHubButton" 
MobileGui.ResetOnSpawn = false 
MobileGui.DisplayOrder = 999999 
MobileGui.Parent = PlayerGui 
 
 
local LogoButton = Instance.new("TextButton") 
LogoButton.Name = "HubLogo" 
LogoButton.Size = UDim2.fromOffset(55, 55) 
LogoButton.Position = UDim2.new(0.287, 0,0.121, 0) 
LogoButton.BackgroundColor3 = Color3.fromRGB(44, 255, 20) 
LogoButton.Text = "M" 
LogoButton.TextColor3 = Color3.fromRGB(0, 0, 0) 
LogoButton.TextSize = 24 
LogoButton.Font = Enum.Font.GothamBold 
LogoButton.AutoButtonColor = true 
LogoButton.Parent = MobileGui 
 
local frame = Instance.new("Frame") 
 
 
 
-- Make it ROUND 
local Corner = Instance.new("UICorner") 
Corner.CornerRadius = UDim.new(1, 0) 
Corner.Parent = LogoButton 
 
 
--================================================== 
-- 📱 SHOW / HIDE WINDOW 
--================================================== 
 
local WindowVisible = true 
 
--================================================== 
-- 📱 MOBILE DRAG + CLICK 
--================================================== 
 
local UserInputService = game:GetService("UserInputService") 
 
local dragging = false 
local dragStart 
local startPos 
local moved = false 
 
LogoButton.InputBegan:Connect(function(input) 
	if input.UserInputType == Enum.UserInputType.MouseButton1 
		or input.UserInputType == Enum.UserInputType.Touch then 
 
		dragging = true 
		moved = false 
		dragStart = input.Position 
		startPos = LogoButton.Position 
 
		input.Changed:Connect(function() 
			if input.UserInputState == Enum.UserInputState.End then 
				dragging = false 
 
				-- Only toggle if the player didn't drag 
				if not moved then 
					WindowVisible = not WindowVisible 
					Window.Root.Visible = WindowVisible 
				end 
			end 
		end) 
	end 
end) 
 
UserInputService.InputChanged:Connect(function(input) 
	if not dragging then 
		return 
	end 
 
	if input.UserInputType == Enum.UserInputType.MouseMovement 
		or input.UserInputType == Enum.UserInputType.Touch then 
 
		local delta = input.Position - dragStart 
 
		-- Consider it a drag after moving 8 pixels 
		if delta.Magnitude > 8 then 
			moved = true 
		end 
 
		LogoButton.Position = UDim2.new( 
			startPos.X.Scale, 
			startPos.X.Offset + delta.X, 
			startPos.Y.Scale, 
			startPos.Y.Offset + delta.Y 
		) 
	end 
end) 
 
Window.Root.Destroying:Connect(function() 
	if LogoButton then 
		LogoButton:Destroy() 
	end 
 
	if MobileGui then 
		MobileGui:Destroy() 
	end 
end) 
 
 
 
---tabs-------- 
 
 
-- Fluent provides Lucide Icons, they are optional 
local Tabs = { 
	player = Window:AddTab({ Title = "Player", Icon = nil }), 
	teleport = Window:AddTab({ Title = "Teleport", Icon = nil }), 
	Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }) 
} 
 
Tabs.player:AddParagraph({ 
	Title = "tshten player e ta yel vere", 
	Content = nil 
}) 
 
local Input = Tabs.player:AddInput("WalkSpeed", { 
	Title = "Walkspeed", 
	Description = "Walkspeed", 
	Default = "16", 
	Placeholder = "Placeholder", 
	Numeric = true, -- Only allows numbers 
	Finished = false, -- Only calls callback when you press enter 
	Callback = function(Value) 
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value 
	end 
}) 
 
 
 
local Input = Tabs.player:AddInput("JumpPower", { 
	Title = "Jumpower", 
	Description = "Jumpower", 
	Default = "32", 
	Placeholder = "Placeholder", 
	Numeric = true, -- Only allows numbers 
	Finished = false, -- Only calls callback when you press enter 
	Callback = function(Value) 
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value 
	end 
}) 
 
Tabs.player:AddParagraph({ 
	Title = "Xoin", 
	Content = nil 
}) 
 
Tabs.player:AddButton({ 
	Title = "Xwa koshtn", 
	Description = "MADE BY MHKZ", 
	Callback = function() 
		game.Players.LocalPlayer.Character.Humanoid.Health = 0 
	end 
}) 
 
local noclip = false 
local runservice = game:GetService("RunService") 
 
local Toggle = Tabs.player:AddToggle("NoClip",  
	{ 
		Title = "Dnav diwara bche",  
		Description = "Noclip", 
		Default = false, 
		Callback = function(state) 
			noclip = state 
		end  
	}) 
 
 
runservice.Stepped:Connect(function() 
	if noclip then 
		local char = game.Players.LocalPlayer.Character 
 
		if char then 
			for _, part in ipairs(char:GetDescendants()) do 
				if part:IsA("BasePart") then 
					part.CanCollide = not noclip 
				end 
 
			end 
		end 
	end 
end) 
 
 
 
 
local Slider = Tabs.player:AddSlider("FOV",  
	{ 
		Title = "Pov", 
		Description = "POV badl ka", 
		Default = 70, 
		Min = 0, 
		Max = 120, 
		Rounding = 1, 
		Callback = function(Value) 
			game.Workspace.CurrentCamera.FieldOfView = Value 
		end 
	}) 
 
 
 
--teleport tabb---------- 
 
 
Tabs.teleport:AddParagraph({ 
	Title = "De blocke dayne o de che blocke", 
	Content = nil 
}) 
 
 
 
 
 
 
--parta 1------------- 
local partama = Instance.new("Part") 
partama.Parent = workspace 
partama.Anchored = true 
partama.CanCollide = false 
partama.BrickColor = BrickColor.new("Lime green") 
 
 
 
 
 
Tabs.teleport:AddButton({ 
	Title = "Blocke dayna", 
	Description = "Blocke spawn ka nk xwa !", 
	Callback = function() 
		partama.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position 
	end 
}) 
 
 
 
Tabs.teleport:AddButton({ 
	Title = "Teleport be blocke", 
	Description = "To bche nk blocke b teleporte", 
	Callback = function() 
		game.Players.LocalPlayer.Character.HumanoidRootPart.Position = partama.Position 
	end 
}) 
 
 
Tabs.teleport:AddButton({ 
	Title = "Shashak de bo teleporte", 
	Description = "Shashak de bo bkar ina na teleport ", 
	Callback = function() 
		local Players = game:GetService("Players") 
 
		local player = Players.LocalPlayer 
		local playerGui = player:WaitForChild("PlayerGui") 
 
		-- ScreenGui 
		local gui = Instance.new("ScreenGui") 
		gui.Name = "TeleportGui" 
		gui.ResetOnSpawn = false 
		gui.Parent = playerGui 
 
		-- Main window 
		local frame = Instance.new("Frame") 
		frame.Size = UDim2.new(0, 217, 0, 126) 
		frame.Position = UDim2.new(0.5, -108, 0.5, -63) 
		frame.BackgroundColor3 = Color3.fromRGB(130, 130, 130) 
		frame.BorderColor3 = Color3.fromRGB(0, 0, 0) 
		frame.BorderSizePixel = 1 
		frame.Parent = gui 
 
		-- Top bar 
		local topBar = Instance.new("Frame") 
		topBar.Size = UDim2.new(1, 0, 0, 29) 
		topBar.Position = UDim2.new(0, 0, 0, 0) 
		topBar.BackgroundColor3 = Color3.fromRGB(190, 190, 190) 
		topBar.BorderColor3 = Color3.fromRGB(0, 0, 0) 
		topBar.BorderSizePixel = 1 
		topBar.Parent = frame 
 
		-- Drag detector 
		local move = Instance.new("UIDragDetector") 
		move.Parent = frame 
 
		-- X button 
		local closeButton = Instance.new("TextButton") 
		closeButton.Size = UDim2.new(0, 37,0, 24) 
		closeButton.Position = UDim2.new(1, -40,0, 2) 
		closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) 
		closeButton.BorderColor3 = Color3.fromRGB(0, 0, 0) 
		closeButton.BorderSizePixel = 1 
		closeButton.Text = "X" 
		closeButton.TextColor3 = Color3.fromRGB(0, 0, 0) 
		closeButton.TextSize = 24 
		closeButton.Font = Enum.Font.GothamBold 
		closeButton.Parent = frame 
 
		-- Teleport button 
		local teleportButton = Instance.new("TextButton") 
		teleportButton.Size = UDim2.new(0, 184, 0, 40) 
		teleportButton.Position = UDim2.new(0.5, -92, 0, 48) 
		teleportButton.BackgroundColor3 = Color3.fromRGB(55, 205, 20) 
		teleportButton.BorderSizePixel = 0 
		teleportButton.Text = "Teleport" 
		teleportButton.TextColor3 = Color3.fromRGB(0, 0, 0) 
		teleportButton.TextSize = 32 
		teleportButton.Font = Enum.Font.GothamBold 
		teleportButton.Parent = frame 
 
		-- Rounded corners 
		local corner = Instance.new("UICorner") 
		corner.CornerRadius = UDim.new(0, 10) 
		corner.Parent = teleportButton 
 
		-- Close GUI 
		closeButton.MouseButton1Click:Connect(function() 
			gui:Destroy() 
		end) 
 
		-- Teleport 
		teleportButton.MouseButton1Click:Connect(function() 
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = partama.Position 
		end) 
	end 
}) 
 
 
 
 
local tweenService = game:GetService("TweenService") 
local tweenInfo = TweenInfo.new(4) 
 
Tabs.teleport:AddButton({ 
	Title = "Bfre nk blocke ", 
	Description = "Bfre nk blocke na teleport", 
	Callback = function() 
		local goal = { 
 
			Position = partama.Position 
 
		} 
		local tween = tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart,tweenInfo,goal) 
 
		tween:Play() 
	end 
}) 
 
 
Tabs.teleport:AddParagraph({ 
	Title = "Bot", 
	Content = nil 
}) 
 
 
 
-- parta 2-------- 
local parta2 = Instance.new("Part") 
parta2.Parent = workspace 
parta2.Anchored = true 
parta2.CanCollide = false 
parta2.BrickColor = BrickColor.new("Really blue") 
 
 
Tabs.teleport:AddButton({ 
	Title = "Blocke 2 spawn ka ", 
	Description = "Blocke 2 spawn ka nk player xwa", 
	Callback = function() 
		parta2.Position = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position 
	end 
}) 
 
local Toggle = Tabs.teleport:AddToggle("BotBlock2",  
	{ 
		Title = "Bot e blocke 2",  
		Description = "Player e ta wak bot bcht blocke 2", 
		Default = false, 
		Callback = function(state) 
			local bot1 = state 
			if bot1 == true then 
				local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") 
				local character = game.Players.LocalPlayer.Character 
 
 
				if character and humanoid then 
					humanoid:MoveTo(parta2.Position) 
 
				end 
 
 
 
 
 
			end 
		end  
	}) 
 
 
 
 
 
 
 
 
 
 
 
 
--================================================== 
-- 🎨 THEME DROPDOWN 
--================================================== 
 
local ThemeNames = {} 
 
for _, ThemeName in pairs(Fluent.Themes) do 
	table.insert(ThemeNames, ThemeName) 
end 
 
local ThemeDropdown = Tabs.Settings:AddDropdown("ThemeDropdown", { 
	Title = "Themes", 
	Description = "Changes themes", 
	Values = ThemeNames, 
	Multi = false, 
	Default = Fluent.Theme, 
}) 
 
ThemeDropdown:OnChanged(function(Value) 
	print("Selected theme:", Value) 
 
	Fluent:SetTheme(Value) 
end) 
 
ThemeDropdown:OnChange(function(Value) 
	Fluent:SetTheme(Value) 
end) 
 
 
 
 
 
 
Tabs.Settings:AddParagraph({ 
	Title = "Save ka script ", 
	Content = "tshtet ta nachn sarepeva " 
}) 
 
SaveManager:SetLibrary(Fluent) 
SaveManager:SetIgnoreIndexes({}) 
SaveManager:SetFolder("MHKZ Hub") 
SaveManager:BuildConfigSection(Tabs.Settings)

end
