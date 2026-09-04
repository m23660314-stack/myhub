local Fluent = loadstring(game:HttpGet(
	"https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
	))()

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
