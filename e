local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local Backpack = player:WaitForChild("Backpack")

-- MAIN SCREEN GUI HOLDER
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CookieHubUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

----------------------------------------------------
-- 1) INTRO SPLASH SCREEN
----------------------------------------------------
local introFrame = Instance.new("Frame")
introFrame.Size = UDim2.new(0, 320, 0, 120)
introFrame.Position = UDim2.new(0.5, -160, 0.4, -60)
introFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
introFrame.BorderSizePixel = 0
introFrame.Parent = screenGui
local introCorner = Instance.new("UICorner", introFrame)
introCorner.CornerRadius = UDim.new(0, 15)

local introTitle = Instance.new("TextLabel")
introTitle.Size = UDim2.new(1, 0, 0.6, 0)
introTitle.BackgroundTransparency = 1
introTitle.Text = "Imp Hub"
introTitle.Font = Enum.Font.GothamBold
introTitle.TextSize = 30
introTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
introTitle.Parent = introFrame

local introSub = Instance.new("TextLabel")
introSub.Size = UDim2.new(1, 0, 0.4, 0)
introSub.Position = UDim2.new(0, 0, 0.6, 0)
introSub.BackgroundTransparency = 1
introSub.Text = "By Cookie Script"
introSub.Font = Enum.Font.Gotham
introSub.TextSize = 20
introSub.TextColor3 = Color3.fromRGB(200, 200, 200)
introSub.Parent = introFrame

----------------------------------------------------
-- 2) LOADING SCREEN (initially hidden)
----------------------------------------------------
local loadFrame = Instance.new("Frame")
loadFrame.Size = UDim2.new(0, 320, 0, 180)
loadFrame.Position = UDim2.new(0.5, -160, 0.55, -90)
loadFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
loadFrame.BorderSizePixel = 0
loadFrame.Visible = false
loadFrame.Parent = screenGui
local loadCorner = Instance.new("UICorner", loadFrame)
loadCorner.CornerRadius = UDim.new(0, 15)

-- Title
local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(1, 0, 0, 40)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "Imp Hub"
loadTitle.Font = Enum.Font.GothamBold
loadTitle.TextSize = 24
loadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
loadTitle.Parent = loadFrame

-- Note below title in red
local noteLabel = Instance.new("TextLabel")
noteLabel.Size = UDim2.new(1, 0, 0, 20)
noteLabel.Position = UDim2.new(0, 0, 0, 40)
noteLabel.BackgroundTransparency = 1
noteLabel.Text = "This Loading Totally Depends On Your Internet"
noteLabel.Font = Enum.Font.GothamBold
noteLabel.TextSize = 14
noteLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
noteLabel.Parent = loadFrame

-- Progress bar background
local loadBarBack = Instance.new("Frame")
loadBarBack.Size = UDim2.new(0.85, 0, 0, 25)
loadBarBack.Position = UDim2.new(0.075, 0, 0.4, 0)
loadBarBack.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
loadBarBack.BorderSizePixel = 0
loadBarBack.Parent = loadFrame
local loadBarCorner = Instance.new("UICorner", loadBarBack)
loadBarCorner.CornerRadius = UDim.new(0, 12)

-- Progress bar fill
local loadBar = Instance.new("Frame")
loadBar.Size = UDim2.new(0, 0, 1, 0)
loadBar.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
loadBar.BorderSizePixel = 0
loadBar.Parent = loadBarBack
local loadBarCorner2 = Instance.new("UICorner", loadBar)
loadBarCorner2.CornerRadius = UDim.new(0, 12)

-- % label below bar
local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(1, 0, 0, 20)
percentLabel.Position = UDim2.new(0, 0, 0.38, 30) -- below progress bar
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.Font = Enum.Font.GothamBold
percentLabel.TextSize = 16
percentLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
percentLabel.Parent = loadFrame

-- "Loading..." text under the bar
local loadTxt = Instance.new("TextLabel")
loadTxt.Size = UDim2.new(1, 0, 0, 25)
loadTxt.Position = UDim2.new(0, 0, 0.5, 30)
loadTxt.BackgroundTransparency = 1
loadTxt.Text = "Loading..."
loadTxt.Font = Enum.Font.Gotham
loadTxt.TextSize = 18
loadTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
loadTxt.Parent = loadFrame

-- Subtext (subscribe or extra)
local subText = Instance.new("TextLabel")
subText.Size = UDim2.new(1, 0, 0, 30)
subText.Position = UDim2.new(0, 0, 0.75, 0)
subText.BackgroundTransparency = 1
subText.Text = "Subscribe To Cookie Script"
subText.Font = Enum.Font.Gotham
subText.TextSize = 18
subText.TextColor3 = Color3.fromRGB(0, 200, 255)
subText.Parent = loadFrame

----------------------------------------------------
-- 3) MAIN COOKIE HUB GUI (hidden until loading done)
----------------------------------------------------
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 240, 0, 150)
mainFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false
mainFrame.Parent = screenGui
local cornerFrame = Instance.new("UICorner", mainFrame)
cornerFrame.CornerRadius = UDim.new(0, 15)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
title.Text = "Imp Hub (Duper)"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = mainFrame

local dupeBtn = Instance.new("TextButton")
dupeBtn.Size = UDim2.new(0.85, 0, 0, 40)
dupeBtn.Position = UDim2.new(0.075, 0, 0.45, 0)
dupeBtn.Text = "Dupe Item"
dupeBtn.Font = Enum.Font.GothamBold
dupeBtn.TextSize = 18
dupeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
dupeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
dupeBtn.Parent = mainFrame
local cornerButton = Instance.new("UICorner", dupeBtn)
cornerButton.CornerRadius = UDim.new(0, 12)

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0.78, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Ready"
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 16
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.Parent = mainFrame

local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 20)
footer.Position = UDim2.new(0, 0, 0.9, 0)
footer.BackgroundTransparency = 1
footer.Text = "Yt - Cookie Scripts"
footer.Font = Enum.Font.GothamBold
footer.TextSize = 14
footer.TextColor3 = Color3.fromRGB(0, 200, 255)
footer.Parent = mainFrame

----------------------------------------------------
-- 4) ANIMATION: INTRO → LOADING → MAIN
----------------------------------------------------
task.delay(2, function()
    local fade1 = TweenService:Create(introTitle, TweenInfo.new(1), {TextTransparency = 1})
    local fade2 = TweenService:Create(introSub, TweenInfo.new(1), {TextTransparency = 1})
    local fade3 = TweenService:Create(introFrame, TweenInfo.new(1), {BackgroundTransparency = 1})
    fade1:Play()
    fade2:Play()
    fade3:Play()

    fade3.Completed:Connect(function()
        introFrame:Destroy()
        loadFrame.Visible = true
        loadFrame.BackgroundTransparency = 1
        local fadeIn = TweenService:Create(loadFrame, TweenInfo.new(1), {BackgroundTransparency = 0})
        fadeIn:Play()

        -- progress bar animation (2 minutes)
        local totalTime = 120
        local step = 0.1
        task.spawn(function()
            for i = 0, totalTime, step do
                local percent = math.floor((i / totalTime) * 100)
                percentLabel.Text = percent .. "%"
                loadBar.Size = UDim2.new(i / totalTime, 0, 1, 0)
                task.wait(step)
            end
            percentLabel.Text = "100%"
            loadFrame:Destroy()
            mainFrame.Visible = true
        end)
    end)
end)

----------------------------------------------------
-- 5) DUPE FUNCTION WITH 15s VISUAL COOLDOWN
----------------------------------------------------
local dupeCooldown = false

local function cloneHeldTool()
    if dupeCooldown then
        statusLabel.Text = "⏳ Please wait 15 seconds..."
        return
    end

    local char = player.Character
    if not char then
        statusLabel.Text = "⚠️ No character loaded"
        return
    end

    local tool = nil
    for _, item in ipairs(char:GetChildren()) do
        if item:IsA("Tool") then
            tool = item
            break
        end
    end

    if not tool then
        statusLabel.Text = "⚠️ No tool in hand!"
        return
    end

    dupeBtn.Active = false
    dupeBtn.Text = "Processing..."
    statusLabel.Text = "⏳ Duplicating " .. tool.Name .. "..."

    -- Dupe progress bar
    local progBar = Instance.new("Frame")
    progBar.Parent = dupeBtn
    progBar.BackgroundColor3 = Color3.fromRGB(0,180,255)
    progBar.BorderSizePixel = 0
    progBar.Size = UDim2.new(0,0,1,0)
    progBar.Position = UDim2.new(0,0,0,0)
    local progCorner = Instance.new("UICorner", progBar)
    progCorner.CornerRadius = UDim.new(0,10)

    local tweenInfo2 = TweenInfo.new(10, Enum.EasingStyle.Linear)
    local tween2 = TweenService:Create(progBar, tweenInfo2, {Size = UDim2.new(1,0,1,0)})
    tween2:Play()

    tween2.Completed:Connect(function()
        local duplicate = tool:Clone()
        duplicate.Parent = Backpack

        progBar:Destroy()
        dupeBtn.Active = true
        dupeBtn.Text = "Dupe Item"
        statusLabel.Text = "✅ Duplicated: " .. tool.Name

        -- Start 15-second visual cooldown
        dupeCooldown = true
        local cooldownBar = Instance.new("Frame")
        cooldownBar.Parent = dupeBtn
        cooldownBar.BackgroundColor3 = Color3.fromRGB(0,100,255)
        cooldownBar.BorderSizePixel = 0
        cooldownBar.Size = UDim2.new(1,0,1,0)
        cooldownBar.Position = UDim2.new(0,0,0,0)
        local corner = Instance.new("UICorner", cooldownBar)
        corner.CornerRadius = UDim.new(0,10)

        local tweenCD = TweenService:Create(cooldownBar, TweenInfo.new(15, Enum.EasingStyle.Linear), {Size = UDim2.new(0,0,1,0)})
        tweenCD:Play()
        tweenCD.Completed:Connect(function()
            cooldownBar:Destroy()
            dupeCooldown = false
            statusLabel.Text = "Status: Ready"
        end)
    end)
end

dupeBtn.MouseButton1Click:Connect(cloneHeldTool)
