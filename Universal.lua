local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Oven Hub",
   LoadingTitle = "Oven Hub - Universal",
   LoadingSubtitle = "by LLL",
   Theme = "AmberGlow"
})
-- Main Tab --
local MainTab = Window:CreateTab("Main", "home")
-- PVP Tab --
local PvPTab = Window:CreateTab("PvP", 7734056608)

local AimAssistToggle = PvPTab:CreateToggle({
   Name = "Aim Assist",
   CurrentValue = false,
   Callback = function(Value)
       local player = game.Players.LocalPlayer
       local mouse = player:GetMouse()
       local connection
       if Value then
           local function AimLock()
               local target
               local lastMagnitude = math.huge
               for _, v in pairs(game.Players:GetPlayers()) do
                   if v ~= player and v.Character and v.Character.PrimaryPart then
                       local charPos = v.Character.PrimaryPart.Position
                       local mousePos = mouse.Hit.p
                       if (charPos - mousePos).Magnitude < lastMagnitude then
                           lastMagnitude = (charPos - mousePos).Magnitude
                           target = v
                       end
                   end
               end
               if target and target.Character and target.Character.PrimaryPart then
                   local charPos = target.Character.PrimaryPart.Position
                   local cam = workspace.CurrentCamera
                   local pos = cam.CFrame.Position
                   workspace.CurrentCamera.CFrame = CFrame.new(pos, charPos)
               end
           end
           connection = game:GetService("RunService").RenderStepped:Connect(function()
               AimLock()
           end)
       else
           if connection then
               connection:Disconnect()
               connection = nil
           end
       end
   end,
})
-- Player Tab --
local PlayerTab = Window:CreateTab("Player", 4335489011)
-- Visual Tab --
local VisualTab = Window:CreateTab("Visual", "monitor")
-- Misc Tab --
local MiscTab = Window:CreateTab("Misc", 7733917120)
-- Settings Tab --
local SettingsTab = Window:CreateTab("Settings", 4370318685)

local DestroyUIButton = SettingsTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
      Rayfield:Destroy()
   end,
})
