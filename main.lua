local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()



local Window = Fluent:CreateWindow({
	Title = "MHKZ Hub " .. Fluent.Version,
	SubTitle = "by MHKZ",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

Fluent:Notify({
	Title = "Notification",
	Content = "You Execute a script !", 
	SubContent = "by MHKZ", -- Optional
	Duration = 3 -- Set to nil to make the notification not disappear
})

-- Fluent provides Lucide Icons, they are optional
local maintab = {
	Main = Window:AddTab({ Title = "Player", Icon = nil }),
	
}

local Section = maintab.Main:AddSection("Player Settings")


local Slider = maintab.Main:AddSlider("Slider", 
	{
		Title = "Walkspeed ",
		Description = "Change your walkspeed",
		Default = 16,
		Min = 0,
		Max = 500,
		Rounding = 1,
		Callback = function(Value)
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
		end
	})
