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
LogoButton.Position = UDim2.new(1, -75, 1, -100)
LogoButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LogoButton.Text = "M"
LogoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoButton.TextSize = 24
LogoButton.Font = Enum.Font.GothamBold
LogoButton.AutoButtonColor = true
LogoButton.Parent = MobileGui

-- Make it ROUND
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1, 0)
Corner.Parent = LogoButton


--==================================================
-- 📱 SHOW / HIDE WINDOW
--==================================================

local WindowVisible = true

LogoButton.Activated:Connect(function()
	WindowVisible = not WindowVisible

	Window.Root.Visible = WindowVisible
end)
