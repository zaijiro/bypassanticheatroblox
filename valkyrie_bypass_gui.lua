--[[
    ═══════════════════════════════════════════════════════════════
    VALKYRIE BYPASS - GUI DE CONTRÔLE
    ═══════════════════════════════════════════════════════════════
    Interface graphique pour contrôler facilement le bypass
]]

-- Charger le bypass principal
local ValkyrieBypass = loadstring(game:HttpGet("URL_DU_BYPASS_PRINCIPAL"))()

-- ═══════════════════════════════════════════════════════════════
-- CRÉATION DE L'INTERFACE
-- ═══════════════════════════════════════════════════════════════

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")

-- Configuration du ScreenGui
ScreenGui.Name = "ValkyrieBypassGUI"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Configuration du MainFrame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Active = true
MainFrame.Draggable = true

-- Coins arrondis
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Titre
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.GothamBold
Title.Text = "🛡️ VALKYRIE BYPASS v2.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

-- Bouton Fermer
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -40, 0, 5)
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- ═══════════════════════════════════════════════════════════════
-- FONCTION POUR CRÉER DES BOUTONS
-- ═══════════════════════════════════════════════════════════════

local function CreateButton(name, text, position, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = MainFrame
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.BorderSizePixel = 0
    button.Position = position
    button.Size = UDim2.new(0, 180, 0, 40)
    button.Font = Enum.Font.Gotham
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = button
    
    button.MouseButton1Click:Connect(callback)
    
    -- Effet hover
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    
    return button
end

-- Fonction pour créer un slider
local function CreateSlider(name, text, position, minValue, maxValue, defaultValue, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = name
    sliderFrame.Parent = MainFrame
    sliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Position = position
    sliderFrame.Size = UDim2.new(0, 360, 0, 60)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = sliderFrame
    
    local label = Instance.new("TextLabel")
    label.Parent = sliderFrame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 10, 0, 5)
    label.Size = UDim2.new(1, -20, 0, 20)
    label.Font = Enum.Font.Gotham
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Parent = sliderFrame
    valueLabel.BackgroundTransparency = 1
    valueLabel.Position = UDim2.new(1, -60, 0, 5)
    valueLabel.Size = UDim2.new(0, 50, 0, 20)
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.Text = tostring(defaultValue)
    valueLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
    valueLabel.TextSize = 12
    
    local sliderBar = Instance.new("Frame")
    sliderBar.Parent = sliderFrame
    sliderBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    sliderBar.BorderSizePixel = 0
    sliderBar.Position = UDim2.new(0, 10, 0, 35)
    sliderBar.Size = UDim2.new(1, -20, 0, 15)
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0, 8)
    barCorner.Parent = sliderBar
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Parent = sliderBar
    sliderFill.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    sliderFill.BorderSizePixel = 0
    sliderFill.Size = UDim2.new((defaultValue - minValue) / (maxValue - minValue), 0, 1, 0)
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 8)
    fillCorner.Parent = sliderFill
    
    local dragging = false
    
    local function update(input)
        local relativeX = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
        local value = math.floor(minValue + (maxValue - minValue) * relativeX)
        
        sliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
        valueLabel.Text = tostring(value)
        callback(value)
    end
    
    sliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            update(input)
        end
    end)
    
    sliderBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)
    
    return sliderFrame
end

-- Fonction pour créer un toggle
local function CreateToggle(name, text, position, defaultState, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = name
    toggleFrame.Parent = MainFrame
    toggleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Position = position
    toggleFrame.Size = UDim2.new(0, 360, 0, 40)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = toggleFrame
    
    local label = Instance.new("TextLabel")
    label.Parent = toggleFrame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 10, 0, 0)
    label.Size = UDim2.new(1, -60, 1, 0)
    label.Font = Enum.Font.Gotham
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = toggleFrame
    toggleButton.BackgroundColor3 = defaultState and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
    toggleButton.BorderSizePixel = 0
    toggleButton.Position = UDim2.new(1, -50, 0.5, -15)
    toggleButton.Size = UDim2.new(0, 40, 0, 30)
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.Text = defaultState and "ON" or "OFF"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextSize = 11
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = toggleButton
    
    local state = defaultState
    
    toggleButton.MouseButton1Click:Connect(function()
        state = not state
        toggleButton.Text = state and "ON" or "OFF"
        toggleButton.BackgroundColor3 = state and Color3.fromRGB(50, 150, 50) or Color3.fromRGB(150, 50, 50)
        callback(state)
    end)
    
    return toggleFrame
end

-- ═══════════════════════════════════════════════════════════════
-- CRÉATION DES CONTRÔLES
-- ═══════════════════════════════════════════════════════════════

-- Status
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
StatusLabel.BorderSizePixel = 0
StatusLabel.Position = UDim2.new(0, 20, 0, 60)
StatusLabel.Size = UDim2.new(1, -40, 0, 30)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "✅ Bypass Actif - Valkyrie Neutralisé"
StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
StatusLabel.TextSize = 11

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 6)
statusCorner.Parent = StatusLabel

-- Sliders
CreateSlider("SpeedSlider", "🏃 Vitesse de marche", UDim2.new(0, 20, 0, 100), 16, 200, 16, function(value)
    ValkyrieBypass:SetSpeed(value)
end)

CreateSlider("JumpSlider", "🦘 Puissance de saut", UDim2.new(0, 20, 0, 170), 50, 200, 50, function(value)
    ValkyrieBypass:SetJumpPower(value)
end)

CreateSlider("FlySpeedSlider", "✈️ Vitesse de vol", UDim2.new(0, 20, 0, 240), 10, 150, 50, function(value)
    if Fly.Enabled then
        Fly.Speed = value
    end
end)

-- Toggles
CreateToggle("NoClipToggle", "👻 NoClip (Traverser les murs)", UDim2.new(0, 20, 0, 310), false, function(state)
    ValkyrieBypass:ToggleNoClip(state)
end)

CreateToggle("FlyToggle", "✈️ Fly (Voler)", UDim2.new(0, 20, 0, 360), false, function(state)
    local speed = 50 -- Vitesse par défaut
    ValkyrieBypass:ToggleFly(state, speed)
end)

-- Bouton de téléportation
CreateButton("TeleportButton", "📍 TP vers Curseur", UDim2.new(0, 20, 0, 410), function()
    local player = game:GetService("Players").LocalPlayer
    local mouse = player:GetMouse()
    
    if mouse.Hit then
        ValkyrieBypass:TeleportTo(CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0)))
        StatusLabel.Text = "✅ Téléporté vers le curseur"
        StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        StatusLabel.Text = "❌ Pointez vers une surface"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
    
    task.wait(2)
    StatusLabel.Text = "✅ Bypass Actif - Valkyrie Neutralisé"
    StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
end)

-- Bouton Reset
CreateButton("ResetButton", "🔄 Reset Position", UDim2.new(0, 210, 0, 410), function()
    local player = game:GetService("Players").LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
        StatusLabel.Text = "✅ Position réinitialisée"
    end
end)

-- Bouton Credits
local creditsLabel = Instance.new("TextLabel")
creditsLabel.Parent = MainFrame
creditsLabel.BackgroundTransparency = 1
creditsLabel.Position = UDim2.new(0, 0, 1, -25)
creditsLabel.Size = UDim2.new(1, 0, 0, 20)
creditsLabel.Font = Enum.Font.Gotham
creditsLabel.Text = "Made with 🔥 - Bypass v2.0 Advanced"
creditsLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
creditsLabel.TextSize = 10

print("✅ GUI de contrôle chargé!")
print("📋 Appuyez sur RightShift pour afficher/masquer")

-- Toggle visibility avec RightShift
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightShift and not gameProcessed then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
