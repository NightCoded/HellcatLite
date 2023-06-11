-- SCRIPT NAME : HELLCAT LITE
-- RELEASE : 5 JUNY 2023
-- VERSION : 1.0
-- COMPANY : NIGHTCODE (https://github.com/ClayHackerTeam)

-- THIS SCRIPT JUST MAKE IN SMARTPHONE (ANDROID), I MAKE MANUAL CODING (LUA), SO MAYBE THIS SCRIPT IS BROKEN :)

local gaje = {
    Flags = {},
    SectionsOpened = false
    }

local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Mouse = game.Players.LocalPlayer:GetMouse()

local Blacklist = {Enum.KeyCode.Unknown, Enum.KeyCode.CapsLock, Enum.KeyCode.Escape, Enum.KeyCode.Tab, Enum.KeyCode.Return, Enum.KeyCode.Backspace, Enum.KeyCode.Space, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D}

local request = syn and syn.request or http and http.request or http_request or request or httprequest
local getcustomasset = getcustomasset or getsynasset
local isfolder = isfolder or syn_isfolder or is_folder
local makefolder = makefolder or make_folder or createfolder or create_folder

for _,v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "HellcatLite" then
        v:Destroy()
    end
end


if not game:GetService("CoreGui"):FindFirstChild("NotificationLibrary") then
local notificationLibrary = Instance.new("ScreenGui")
notificationLibrary.Name = "NotificationLibrary"
notificationLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
notificationLibrary.Parent = game:GetService("CoreGui")

local notificationHolder = Instance.new("Frame")
notificationHolder.Name = "NotificationHolder"
notificationHolder.AnchorPoint = Vector2.new(0, 0.5)
notificationHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
notificationHolder.BackgroundTransparency = 1
notificationHolder.Position = UDim2.fromScale(0, 0.5)
notificationHolder.Size = UDim2.fromScale(0.8, 1)
notificationHolder.Parent = notificationLibrary

local notificationUIListLayout = Instance.new("UIListLayout")
notificationUIListLayout.Name = "NotificationUIListLayout"
notificationUIListLayout.FillDirection = Enum.FillDirection.Vertical
notificationUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
notificationUIListLayout.Padding = UDim.new(0, 4)
notificationUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
notificationUIListLayout.Parent = notificationHolder

local notificationUIPadding = Instance.new("UIPadding")
notificationUIPadding.Name = "NotificationUIPadding"
notificationUIPadding.PaddingBottom = UDim.new(0, 9)
notificationUIPadding.PaddingLeft = UDim.new(0, 5)
notificationUIPadding.Parent = notificationHolder
end

local NotificationLib = game:GetService("CoreGui"):FindFirstChild("NotificationLibrary")
local Holder = NotificationLib:FindFirstChild("NotificationHolder")

function Notification(NotificationInfo)
NotificationInfo.Text = NotificationInfo.Text or "This is a notification."
NotificationInfo.Duration = NotificationInfo.Duration or 5

local notificationText = Instance.new("TextLabel")
notificationText.Name = "NotificationText"
notificationText.ClipsDescendants = true
notificationText.Font = Enum.Font.SourceSans
notificationText.Text = NotificationInfo.Text
notificationText.TextColor3 = Color3.fromRGB(214, 214, 214)
notificationText.TextSize = 13
notificationText.BackgroundColor3 = Color3.fromRGB(25, 25, 33)
notificationText.BorderSizePixel = 0
notificationText.Position = UDim2.fromScale(0, 0.954)
notificationText.Size = UDim2.fromOffset(0, 38)
notificationText.Parent = Holder

local outerFrame = Instance.new("Frame")
outerFrame.Name = "OuterFrame"
outerFrame.AnchorPoint = Vector2.new(0, 1)
outerFrame.BackgroundColor3 = Color3.fromRGB(8, 242, 155)
outerFrame.BorderSizePixel = 0
outerFrame.Position = UDim2.fromScale(0, 1)
outerFrame.Size = UDim2.new(1, 0, 0, 3)
outerFrame.ZIndex = 2
outerFrame.Parent = notificationText

local notificationUICorner = Instance.new("UICorner")
notificationUICorner.Name = "NotificationUICorner"
notificationUICorner.CornerRadius = UDim.new(0, 4)
notificationUICorner.Parent = notificationText

local innerFrame = Instance.new("Frame")
innerFrame.Name = "InnerFrame"
innerFrame.AnchorPoint = Vector2.new(0, 1)
innerFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
innerFrame.BorderSizePixel = 0
innerFrame.Position = UDim2.fromScale(0, 1)
innerFrame.Size = UDim2.new(1, 0, 0, 3)
innerFrame.Parent = notificationText

local NotifText = notificationText
local TextBounds = NotifText.TextBounds

coroutine.wrap(function()
local InTween = TweenService:Create(NotifText, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0, TextBounds.X + 20, 0, 38)})
InTween:Play()
InTween.Completed:Wait()

local LineTween = TweenService:Create(outerFrame, TweenInfo.new(NotificationInfo.Duration, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 3)})
LineTween:Play()
LineTween.Completed:Wait()

local OutTween = TweenService:Create(NotifText, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 0, 0, 38)})
OutTween:Play()
OutTween.Completed:Wait()
notificationText:Destroy()
end)()
end

if not isfolder("HellcatLite") then
    makefolder("HellcatLite")
Notification({
Text = "Downloading assets..",
Duration = 5
})
local Logo = request({Url = "https://raw.githubusercontent.com/NightCoded/HellcatLite/main/assets/Logo.png", Method = "GET"})
writefile("HellcatLite/Logo.png", Logo.Body)

local Chevron = request({Url = "https://raw.githubusercontent.com/NightCoded/HellcatLite/main/assets/Chevron.png", Method = "GET"})
writefile("HellcatLite/Chevron.png", Chevron.Body)

local Circle = request({Url = "https://raw.githubusercontent.com/NightCoded/HellcatLite/main/assets/Circle.png", Method = "GET"})
writefile("HellcatLite/Circle.png", Circle.Body)
wait(5)
end



local Library = {}

Notification({
Text = "Don't forget to subscribe HELLCAT_ID",
Duration = 3
})

function Library:CreateMain(Info)
Info.Opened = Info.Opened or gaje.SectionsOpened

local hellcat = Instance.new("ScreenGui")
hellcat.ZIndexBehavior = Enum.ZIndexBehavior.Global
hellcat.Parent = CoreGui

local section = Instance.new("Frame")
section.Name = "Section"
section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
section.BackgroundTransparency = 1
section.Size = UDim2.new(0, 500, 0, 300)
section.Position = UDim2.new(0.140, 0, 0.090, 0)
section.ClipsDescendants = true
section.Parent = hellcat


local SectionOpened = Instance.new("BoolValue", section)
SectionOpened.Value = Info.Opened

local sectionFrame = Instance.new("Frame")
sectionFrame.Name = "SectionFrame"
sectionFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 33)
sectionFrame.BorderSizePixel = 0
sectionFrame.Size = UDim2.new(0, 175, 0, 28)
sectionFrame.Parent = section
sectionFrame.Active = true
sectionFrame.Draggable = true


local sectionUICorner = Instance.new("UICorner")
sectionUICorner.Name = "SectionUICorner"
sectionUICorner.CornerRadius = UDim.new(0, 2)
sectionUICorner.Parent = sectionFrame

local sectionName = Instance.new("ImageLabel")
sectionName.Name = "SectionName"
sectionName.Image = getcustomasset("HellcatLite/Logo.png")
sectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sectionName.BackgroundTransparency = 1
sectionName.Position = UDim2.new(0.0343, 0, 0, 6)
sectionName.Size = UDim2.new(0, 70, 0, 15)
sectionName.Parent = sectionFrame

local sectionButton = Instance.new("TextButton")
sectionButton.Name = "SectionButton"
sectionButton.Font = Enum.Font.SourceSans
sectionButton.Text = ""
sectionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
sectionButton.AutoButtonColor = false
sectionButton.BackgroundTransparency = 1
sectionButton.BorderSizePixel = 0
sectionButton.BackgroundColor3 = Color3.fromRGB(25, 25, 33)
sectionButton.Size = UDim2.new(0, 175, 0, 28)
sectionButton.Parent = sectionFrame

local sectionIcon = Instance.new("ImageLabel")
sectionIcon.Name = "SectionIcon"
sectionIcon.Image = getcustomasset("HellcatLite/Chevron.png")
sectionIcon.ImageColor3 = Color3.fromRGB(237, 237, 237)
sectionIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sectionIcon.BackgroundTransparency = 1
sectionIcon.Position = UDim2.new(0, 155, 0, 5)
sectionIcon.Rotation = 90
sectionIcon.Selectable = false
sectionIcon.Size = UDim2.new(0, 17, 0, 17)
sectionIcon.Parent = sectionFrame

local containerHolder = Instance.new("Frame")
containerHolder.Name = "ContainerHolder"
containerHolder.BackgroundColor3 = Color3.fromRGB(25, 32, 43)
containerHolder.BackgroundTransparency = 0
containerHolder.ClipsDescendants = true
containerHolder.BorderSizePixel = 0
containerHolder.Visible = false
containerHolder.Position = UDim2.new(0, 0, 0, 28)
containerHolder.Size = UDim2.new(0, 175, 0, 0)
containerHolder.Parent = sectionFrame

local itemContainer = Instance.new("ScrollingFrame")
itemContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
itemContainer.CanvasSize = UDim2.new()
itemContainer.ScrollBarThickness = 0
itemContainer.Name = "ItemContainer"
itemContainer.BackgroundColor3 = Color3.fromRGB(25, 32, 43)
itemContainer.BorderSizePixel = 0
itemContainer.Size = UDim2.new(0, 175, 0, 0)
itemContainer.Parent = containerHolder

local uIListLayout0 = Instance.new("UIListLayout")
uIListLayout0.Name = "UIListLayout"
uIListLayout0.SortOrder = Enum.SortOrder.LayoutOrder
uIListLayout0.Parent =  containerHolder

local SectionY = 28
local ContainerY = 0

itemContainer.ChildAdded:Connect(function(v)
    if v.ClassName ~= "UIListLayout" then
        if v.Name ~= "Slider" then
        SectionY = SectionY + 28
        ContainerY = ContainerY + 28
        else
        SectionY = SectionY + 36
        ContainerY = ContainerY + 36
        end
    end
end)

local OpenedSec = false

function Library:Select()
    OpenedSec = not OpenedSec
    SectionOpened.Value = OpenedSec

    containerHolder.Visible = true
    section.Size = OpenedSec and UDim2.new(0, 175, 0, SectionY + 5) or UDim2.new(0, 175, 0, 33)
    sectionFrame.Size = OpenedSec and UDim2.new(0, 175, 0, SectionY) or UDim2.new(0, 175, 0, 28)
    containerHolder.Position = OpenedSec and UDim2.new(0, 0, 0, 28) or UDim2.new(0, 0, 0, 0)
    containerHolder.Size = OpenedSec and UDim2.new(0, 175, 0, ContainerY) or UDim2.new(0, 175, 0, 0)
    sectionIcon.Rotation = OpenedSec and -90 or 90
    sectionIcon.Position = OpenedSec and UDim2.new(0, 156, 0, 5) or UDim2.new(0, 155, 0, 5)
    itemContainer.Size = OpenedSec and UDim2.new(0, 175, 0, ContainerY) or UDim2.new(0, 175, 0, 0)
end

task.spawn(function()
if Info.Opened then
    for i = 1,3 do
        Library:Select()
        wait()
    end
end
end)

sectionButton.MouseButton1Click:Connect(function()
    Library:Select()
end)

local itemUIListLayout = Instance.new("UIListLayout")
itemUIListLayout.Name = "ItemUIListLayout"
itemUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
itemUIListLayout.Parent = itemContainer

local sectionUIStroke = Instance.new("UIStroke")
sectionUIStroke.Name = "SectionUIStroke"
sectionUIStroke.Color = Color3.fromRGB(37, 37, 44)
sectionUIStroke.Parent = sectionFrame

local ItemSection = {}

function ItemSection:Toggle(Info)
Info.Text = Info.Text or "Toggle"
Info.Default = Info.Default or false
Info.Flag = Info.Flag or nil
Info.Callback = Info.Callback or function() end

local toggletable = {}

if Info.Flag then
    gaje.Flags[Info.Flag] = Info.Default
end

local Enabled = false

local toggle = Instance.new("Frame")
toggle.Name = "Toggle"
toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggle.BackgroundTransparency = 1
toggle.Size = UDim2.new(0, 175, 0, 28)
toggle.Parent = itemContainer

local toggleFrame = Instance.new("Frame")
toggleFrame.Name = "ToggleFrame"
toggleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
toggleFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 43)
toggleFrame.BorderSizePixel = 0
toggleFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
toggleFrame.Size = UDim2.new(0, 171, 0, 24)
toggleFrame.Parent = toggle

local toggleText = Instance.new("TextLabel")
toggleText.Name = "toggleText"
toggleText.Font = Enum.Font.SourceSans
toggleText.Text = Info.Text
toggleText.TextColor3 = Color3.fromRGB(237, 237, 237)
toggleText.TextSize = 12
toggleText.TextXAlignment = Enum.TextXAlignment.Left
toggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleText.BackgroundTransparency = 1
toggleText.Position = UDim2.new(0.0234, 0, 0, 0)
toggleText.Size = UDim2.new(0, 167, 0, 24)
toggleText.Parent = toggleFrame

local toggleTextButton = Instance.new("TextButton")
toggleTextButton.Name = "toggleTextButton"
toggleTextButton.Font = Enum.Font.SourceSans
toggleTextButton.Text = ""
toggleTextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
toggleTextButton.TextSize = 14
toggleTextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleTextButton.BackgroundTransparency = 1
toggleTextButton.Size = UDim2.new(0, 171, 0, 24)
toggleTextButton.Parent = toggleFrame

local toggleUIStroke = Instance.new("UIStroke")
toggleUIStroke.Name = "toggleUIStroke"
toggleUIStroke.Color = Color3.fromRGB(31, 31, 43)
toggleUIStroke.Parent = toggleFrame

toggleFrame.MouseEnter:Connect(function()
    TweenService:Create(toggleFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(43, 50, 67)}):Play()
end)

toggleFrame.MouseLeave:Connect(function()
    TweenService:Create(toggleFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(31, 31, 43)}):Play()
    TweenService:Create(toggleUIStroke, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(31, 31, 43)}):Play()
end)

toggleTextButton.MouseButton1Down:Connect(function()
    TweenService:Create(toggleUIStroke, TweenInfo.new(.13, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(31, 31, 43)}):Play()
end)

toggleTextButton.MouseButton1Up:Connect(function()
    TweenService:Create(toggleUIStroke, TweenInfo.new(.13, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(31, 31, 43)}):Play()
end)

local toggleOuter = Instance.new("Frame")
toggleOuter.Name = "ToggleOuter"
toggleOuter.BackgroundColor3 = Color3.fromRGB(48, 56, 75)
toggleOuter.Position = UDim2.new(-0.023, 139, 0.167, 1)
toggleOuter.Size = UDim2.new(0, 30, 0, 14)
toggleOuter.Parent = toggleFrame

local toggleOuterUIStroke = Instance.new("UIStroke")
toggleOuterUIStroke.Name = "toggleOuterUIStroke"
toggleOuterUIStroke.Color = Color3.fromRGB(42, 49, 65)
toggleOuterUIStroke.Parent = toggleOuter

local toggleOuterUICorner = Instance.new("UICorner")
toggleOuterUICorner.Name = "toggleOuterUICorner"
toggleOuterUICorner.CornerRadius = UDim.new(1, 0)
toggleOuterUICorner.Parent = toggleOuter

local toggleInner = Instance.new("ImageLabel")
toggleInner.Name = "toggleInner"
toggleInner.Image = getcustomasset("HellcatLite/Circle.png")
toggleInner.ImageColor3 = Color3.fromRGB(77, 90, 121)
toggleInner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleInner.BackgroundTransparency = 1
toggleInner.BorderSizePixel = 0
toggleInner.Position = UDim2.new(0, 2, 0, 2)
toggleInner.Size = UDim2.new(0, 10, 0, 10)
toggleInner.Parent = toggleOuter

function toggletable:Set(bool)
Enabled = bool
if Info.Flag then
    gaje.Flags[Info.Flag] = bool
end
TweenService:Create(toggleOuter, TweenInfo.new(.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundColor3 = bool and Color3.fromRGB(8, 242, 155) or Color3.fromRGB(48, 56, 75)}):Play()
TweenService:Create(toggleInner, TweenInfo.new(.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageColor3 = bool and Color3.fromRGB(48, 56, 75) or Color3.fromRGB(77, 90, 121)}):Play()
TweenService:Create(toggleInner, TweenInfo.new(.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = bool and UDim2.new(0, 18, 0, 2) or UDim2.new(0, 2, 0, 2)}):Play()
TweenService:Create(toggleOuterUIStroke, TweenInfo.new(.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = bool and Color3.fromRGB(8, 242, 155) or Color3.fromRGB(42, 49, 65)}):Play()
task.spawn(Info.Callback, bool)
end

if Info.Default then
    toggletable:Set(true)
end

toggleTextButton.MouseButton1Click:Connect(function()
    Enabled = not Enabled
    
    toggletable:Set(Enabled)
end)

return toggletable
end

function ItemSection:Dropdown(Info)
Info.Text = Info.Text or "Dropdown"
Info.Flag = Info.Flag or nil
Info.Default = Info.Default or nil
Info.List = Info.List or {}
Info.Callback = Info.Callback or function() end
Info.ChangeTextOnPick = Info.ChangeTextOnPick or false

local insidedropdown = {}

local dropdown = Instance.new("Frame")
dropdown.Name = "Dropdown"
dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdown.BackgroundTransparency = 1
dropdown.Position = UDim2.new(0, 0, 3, 0)
dropdown.Size = UDim2.new(0, 175, 0, 28)
dropdown.Parent = itemContainer

local dropdownFrame = Instance.new("Frame")
dropdownFrame.Name = "dropdownFrame"
dropdownFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 43)
dropdownFrame.BorderSizePixel = 0
dropdownFrame.Position = UDim2.new(0, 2, 0, 2)
dropdownFrame.Size = UDim2.new(0, 171, 0, 24)
dropdownFrame.Parent = dropdown

local dropdownText = Instance.new("TextLabel")
dropdownText.Name = "dropdownText"
dropdownText.Font = Enum.Font.SourceSans
dropdownText.Text = Info.Text
dropdownText.TextColor3 = Color3.fromRGB(237, 237, 237)
dropdownText.TextSize = 12
dropdownText.TextXAlignment = Enum.TextXAlignment.Left
dropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdownText.BackgroundTransparency = 1
dropdownText.Position = UDim2.new(0.0234, 0, 0, 0)
dropdownText.Size = UDim2.new(0, 167, 0, 24)
dropdownText.Parent = dropdownFrame

local dropdownTextButton = Instance.new("TextButton")
dropdownTextButton.Name = "dropdownTextButton"
dropdownTextButton.Font = Enum.Font.SourceSans
dropdownTextButton.Text = ""
dropdownTextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
dropdownTextButton.TextSize = 14
dropdownTextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdownTextButton.BackgroundTransparency = 1
dropdownTextButton.Size = UDim2.new(0, 171, 0, 24)
dropdownTextButton.Parent = dropdownFrame

local dropdownUIStroke = Instance.new("UIStroke")
dropdownUIStroke.Name = "dropdownUIStroke"
dropdownUIStroke.Color = Color3.fromRGB(31, 31, 43)
dropdownUIStroke.Parent = dropdownFrame

local dropdownIcon = Instance.new("ImageLabel")
dropdownIcon.Name = "dropdownIcon"
dropdownIcon.Image = getcustomasset("HellcatLite/Chevron.png")
dropdownIcon.ImageColor3 = Color3.fromRGB(237, 237, 237)
dropdownIcon.Active = true
dropdownIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdownIcon.BackgroundTransparency = 1
dropdownIcon.Position = UDim2.new(0, 155, 0, 5)
dropdownIcon.Rotation = 90
dropdownIcon.Size = UDim2.new(0, 17, 0, 17)
dropdownIcon.ZIndex = 2
dropdownIcon.Parent = dropdown

local dropdownContainer = Instance.new("Frame")
dropdownContainer.Name = "dropdownContainer"
dropdownContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
dropdownContainer.BackgroundTransparency = 1
dropdownContainer.BorderSizePixel = 0
dropdownContainer.ClipsDescendants = true
dropdownContainer.Position = UDim2.new(0, 2, 0, 24)
dropdownContainer.Size = UDim2.new(0, 171, 0, 0)
dropdownContainer.Parent = dropdown

local dropdownUIListLayout = Instance.new("UIListLayout")
dropdownUIListLayout.Name = "dropdownUIListLayout"
dropdownUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
dropdownUIListLayout.Parent = dropdownContainer

dropdownFrame.MouseEnter:Connect(function()
    TweenService:Create(dropdownFrame, TweenInfo.new(.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(43, 50, 67)}):Play()
end)

dropdownFrame.MouseLeave:Connect(function()
    TweenService:Create(dropdownFrame, TweenInfo.new(.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(31, 31, 43)}):Play()
    TweenService:Create(dropdownUIStroke, TweenInfo.new(.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(31, 31, 43)}):Play()
end)

dropdownTextButton.MouseButton1Down:Connect(function()
    TweenService:Create(dropdownUIStroke, TweenInfo.new(.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(31, 31, 43)}):Play()
end)

dropdownTextButton.MouseButton1Up:Connect(function()
    TweenService:Create(dropdownUIStroke, TweenInfo.new(.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(31, 31, 43)}):Play()
end)

if Info.Default then
    task.spawn(Info.Callback, Info.Default)
    if Info.Flag then
        library.Flags[Info.Flag] = Info.Default
    end
    if Info.ChangeTextOnPick then
        dropdownText.Text = Info.Default
    end
end


local DropdownY = 0
local DropdownOpened = false

function insidedropdown:Add(str)
DropdownY = DropdownY + 24

if DropdownOpened then
    TweenService:Create(section, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 175, 0, section.Size.Y.Offset + 24)}):Play()
    TweenService:Create(sectionFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 175, 0, sectionFrame.Size.Y.Offset + 24)}):Play()
    TweenService:Create(itemContainer, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 175, 0, itemContainer.Size.Y.Offset + 24)}):Play()
    TweenService:Create(dropdown, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 175, 0, dropdown.Size.Y.Offset + 24)}):Play()
    TweenService:Create(dropdownFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 171, 0, dropdownFrame.Size.Y.Offset + 24)}):Play()
    TweenService:Create(dropdownContainer, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 171, 0, dropdownContainer.Size.Y.Offset + 24)}):Play()
    task.wait(.1)
end

local dropdownElement = Instance.new("Frame")
dropdownElement.Name = "dropdownElement"
dropdownElement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdownElement.BackgroundTransparency = 1
dropdownElement.Size = UDim2.new(0, 171, 0, 24)
dropdownElement.ZIndex = 2
dropdownElement.Parent = dropdownContainer

local dropdownElementText = Instance.new("TextLabel")
dropdownElementText.Name = "dropdownElementText"
dropdownElementText.Font = Enum.Font.SourceSans
dropdownElementText.Text = str
dropdownElementText.TextColor3 = Color3.fromRGB(8, 242, 155)
dropdownElementText.TextSize = 12
dropdownElementText.TextXAlignment = Enum.TextXAlignment.Left
dropdownElementText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdownElementText.BackgroundTransparency = 1
dropdownElementText.Position = UDim2.new(0.0234, 0, 0, 0)
dropdownElementText.Size = UDim2.new(0, 167, 0, 24)
dropdownElementText.Parent = dropdownElement

local dropdownElementButton = Instance.new("TextButton")
dropdownElementButton.Name = "dropdownElementButton"
dropdownElementButton.Font = Enum.Font.SourceSans
dropdownElementButton.Text = ""
dropdownElementButton.TextColor3 = Color3.fromRGB(8, 242, 155)
dropdownElementButton.TextSize = 14
dropdownElementButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dropdownElementButton.BackgroundTransparency = 1
dropdownElementButton.Size = UDim2.new(0, 171, 0, 24)
dropdownElementButton.Parent = dropdownElement

dropdownElement.MouseEnter:Connect(function()
    TweenService:Create(dropdownElementText, TweenInfo.new(.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(5, 5, 5)}):Play()
end)

dropdownElement.MouseLeave:Connect(function()
    TweenService:Create(dropdownElementText, TweenInfo.new(.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(8, 242, 155)}):Play()
end)

dropdownElementButton.MouseButton1Click:Connect(function()
    task.spawn(Info.Callback, dropdownElementText.Text)
    if Info.Flag then
        library.Flags[Info.Flag] = dropdownElementText.Text
    end
    if Info.ChangeTextOnPick then
        dropdownText.Text = dropdownElementText.Text
    end
    
    TweenService:Create(dropdownFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(31, 31, 43)}):Play()
    TweenService:Create(dropdownUIStroke, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(31, 31, 43)}):Play()

    DropdownOpened = false

    if DropdownOpened then
        containerHolder.ClipsDescendants = false
    end
    TweenService:Create(section, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 175, 0, section.Size.Y.Offset + (DropdownY)) or UDim2.new(0, 175, 0, section.Size.Y.Offset - (DropdownY))}):Play()
    TweenService:Create(sectionFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 175, 0, sectionFrame.Size.Y.Offset + (DropdownY)) or UDim2.new(0, 175, 0, sectionFrame.Size.Y.Offset - (DropdownY))}):Play()
    TweenService:Create(itemContainer, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 175, 0, itemContainer.Size.Y.Offset + (DropdownY)) or UDim2.new(0, 175, 0, itemContainer.Size.Y.Offset - (DropdownY))}):Play()
    TweenService:Create(dropdown, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 175, 0, DropdownY + 28) or UDim2.new(0, 175, 0, 28)}):Play()
    TweenService:Create(dropdownFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 171, 0, DropdownY + 24) or UDim2.new(0, 171, 0, 24)}):Play()
    TweenService:Create(dropdownContainer, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 171, 0, DropdownY) or UDim2.new(0, 171, 0, 0)}):Play()
    TweenService:Create(dropdownIcon, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Rotation = DropdownOpened and -90 or 90}):Play()
    dropdownIcon.Position = DropdownOpened and UDim2.new(0, 156, 0, 5) or UDim2.new(0, 155, 0, 5)
    if not DropdownOpened then
        task.wait(.1)
        containerHolder.ClipsDescendants = true
    end    
end)
end

function insidedropdown:Remove(opt)
    for _,v in pairs(dropdownContainer:GetChildren()) do
        if v.ClassName == "Frame" and v.dropdownElementText.Text == opt then
            DropdownY = DropdownY - 24
            if DropdownOpened then
                TweenService:Create(section, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 175, 0, section.Size.Y.Offset - 24)}):Play()
                TweenService:Create(sectionFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 175, 0, sectionFrame.Size.Y.Offset - 24)}):Play()
                TweenService:Create(itemContainer, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 175, 0, itemContainer.Size.Y.Offset - 24)}):Play()
                TweenService:Create(dropdown, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 175, 0, dropdown.Size.Y.Offset - 24)}):Play()
                TweenService:Create(dropdownFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 171, 0, dropdownFrame.Size.Y.Offset - 24)}):Play()
                TweenService:Create(dropdownContainer, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(0, 171, 0, dropdownContainer.Size.Y.Offset - 24)}):Play()
                task.wait(.1)
            end
            v:Destroy()
        end
    end
end

function insidedropdown:Clear()
    for _,v in pairs(dropdownContainer:GetChildren()) do
        if v.ClassName == "Frame" then
            insidedropdown:Remove(v.dropdownElementText.Text)
        end
    end
end

for _,v in ipairs(Info.List) do
    insidedropdown:Add(v)
end

SectionOpened:GetPropertyChangedSignal("Value"):Connect(function()
    DropdownOpened = false
    
    if DropdownOpened then
        containerHolder.ClipsDescendants = false
    end
    dropdown.Size = DropdownOpened and UDim2.new(0, 175, 0, DropdownY + 28) or UDim2.new(0, 175, 0, 28)
    dropdownFrame.Size = DropdownOpened and UDim2.new(0, 171, 0, DropdownY + 24) or UDim2.new(0, 171, 0, 24)
    dropdownContainer.Size = DropdownOpened and UDim2.new(0, 171, 0, DropdownY) or UDim2.new(0, 171, 0, 0)
    section.Size = DropdownOpened and UDim2.new(0, 175, 0, section.Size.Y.Offset + (DropdownY)) or UDim2.new(0, 175, 0, section.Size.Y.Offset - (DropdownY))
    sectionFrame.Size = DropdownOpened and UDim2.new(0, 175, 0, sectionFrame.Size.Y.Offset + (DropdownY)) or UDim2.new(0, 175, 0, sectionFrame.Size.Y.Offset - (DropdownY))
    itemContainer.Size = DropdownOpened and UDim2.new(0, 175, 0, itemContainer.Size.Y.Offset + (DropdownY)) or UDim2.new(0, 175, 0, itemContainer.Size.Y.Offset - (DropdownY))
    dropdownIcon.Rotation = DropdownOpened and -90 or 90
    dropdownIcon.Position = DropdownOpened and UDim2.new(0, 156, 0, 5) or UDim2.new(0, 155, 0, 5)
    if not DropdownOpened then
        task.wait(.1)
        containerHolder.ClipsDescendants = true
    end 
end)

dropdownTextButton.MouseButton1Click:Connect(function()
    DropdownOpened = not DropdownOpened
    
    if DropdownOpened then
        containerHolder.ClipsDescendants = false
    end
    TweenService:Create(section, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 175, 0, section.Size.Y.Offset + (DropdownY)) or UDim2.new(0, 175, 0, section.Size.Y.Offset - (DropdownY))}):Play()
    TweenService:Create(sectionFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 175, 0, sectionFrame.Size.Y.Offset + (DropdownY)) or UDim2.new(0, 175, 0, sectionFrame.Size.Y.Offset - (DropdownY))}):Play()
    TweenService:Create(itemContainer, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 175, 0, itemContainer.Size.Y.Offset + (DropdownY)) or UDim2.new(0, 175, 0, itemContainer.Size.Y.Offset - (DropdownY))}):Play()
    TweenService:Create(dropdown, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 175, 0, DropdownY + 28) or UDim2.new(0, 175, 0, 28)}):Play()
    TweenService:Create(dropdownFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 171, 0, DropdownY + 24) or UDim2.new(0, 171, 0, 24)}):Play()
    TweenService:Create(dropdownContainer, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = DropdownOpened and UDim2.new(0, 171, 0, DropdownY) or UDim2.new(0, 171, 0, 0)}):Play()
    TweenService:Create(dropdownIcon, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Rotation = DropdownOpened and -90 or 90}):Play()
    dropdownIcon.Position = DropdownOpened and UDim2.new(0, 156, 0, 5) or UDim2.new(0, 155, 0, 5)
    if not DropdownOpened then
        task.wait(.1)
        containerHolder.ClipsDescendants = true
    end 
end)

return insidedropdown
end

function ItemSection:Button(Info)
Info.Text = Info.Text or "Button"
Info.Callback = Info.Callback or function() end

local button = Instance.new("Frame")
button.Name = "Button"
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundTransparency = 1
button.Size = UDim2.new(0, 175, 0, 28)
button.Parent = itemContainer

local buttonFrame = Instance.new("Frame")
buttonFrame.Name = "ButtonFrame"
buttonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
buttonFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 43)
buttonFrame.BorderSizePixel = 0
buttonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
buttonFrame.Size = UDim2.new(0, 171, 0, 24)
buttonFrame.Parent = button

local buttonUIStroke = Instance.new("UIStroke")
buttonUIStroke.Name = "buttonUIStroke"
buttonUIStroke.Color = Color3.fromRGB(31, 31, 43)
buttonUIStroke.Parent = buttonFrame

buttonFrame.MouseEnter:Connect(function()
    TweenService:Create(buttonFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(43, 50, 67)}):Play()
end)

buttonFrame.MouseLeave:Connect(function()
    TweenService:Create(buttonFrame, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(31, 31, 43)}):Play()
    TweenService:Create(buttonUIStroke, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(31, 31, 43)}):Play()
end)

local buttonText = Instance.new("TextLabel")
buttonText.Name = "ButtonText"
buttonText.Font = Enum.Font.SourceSans
buttonText.Text = Info.Text
buttonText.TextColor3 = Color3.fromRGB(237, 237, 237)
buttonText.TextSize = 12
buttonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonText.BackgroundTransparency = 1
buttonText.Size = UDim2.new(0, 171, 0, 24)
buttonText.Parent = buttonFrame

local buttonTextButton = Instance.new("TextButton")
buttonTextButton.Name = "ButtonTextButton"
buttonTextButton.Font = Enum.Font.SourceSans
buttonTextButton.Text = ""
buttonTextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
buttonTextButton.TextSize = 12
buttonTextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonTextButton.BackgroundTransparency = 1
buttonTextButton.Size = UDim2.new(0, 171, 0, 24)
buttonTextButton.Parent = buttonFrame

buttonTextButton.MouseButton1Down:Connect(function()
    TweenService:Create(buttonUIStroke, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(31, 31, 43)}):Play()
end)

buttonTextButton.MouseButton1Up:Connect(function()
    TweenService:Create(buttonUIStroke, TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(31, 31, 43)}):Play()
end)

buttonTextButton.MouseButton1Click:Connect(function()
    task.spawn(Info.Callback)
end)
end

function ItemSection:Input(Info)
Info.Placeholder = Info.Placeholder or "Input"
Info.Callback = Info.Callback or function() end

local input = Instance.new("Frame")
input.Name = "Input"
input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
input.BackgroundTransparency = 1
input.Size = UDim2.new(0, 175, 0, 28)
input.Parent = itemContainer

local inputFrame = Instance.new("Frame")
inputFrame.Name = "InputFrame"
inputFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inputFrame.BackgroundTransparency = 1
inputFrame.Size = UDim2.new(0, 175, 0, 28)
inputFrame.Parent = input

local inputOuter = Instance.new("Frame")
inputOuter.Name = "InputOuter"
inputOuter.AnchorPoint = Vector2.new(0.5, 0.5)
inputOuter.BackgroundColor3 = Color3.fromRGB(31, 31, 43)
inputOuter.BorderSizePixel = 0
inputOuter.ClipsDescendants = true
inputOuter.Position = UDim2.new(0.5, 0, 0.5, 0)
inputOuter.Size = UDim2.new(0, 175, 0, 28)
inputOuter.Parent = inputFrame

local inputUICorner = Instance.new("UICorner")
inputUICorner.Name = "InputUICorner"
inputUICorner.CornerRadius = UDim.new(0, 3)
inputUICorner.Parent = inputOuter

local inputUIStroke = Instance.new("UIStroke")
inputUIStroke.Name = "InputUIStroke"
inputUIStroke.Color = Color3.fromRGB(41, 41, 50)
inputUIStroke.Parent = inputOuter

local inputTextBox = Instance.new("TextBox")
inputTextBox.Name = "InputTextBox"
inputTextBox.CursorPosition = -1
inputTextBox.Font = Enum.Font.GothamBold
inputTextBox.PlaceholderColor3 = Color3.fromRGB(217, 217, 217)
inputTextBox.PlaceholderText = Info.Placeholder
inputTextBox.Text = ""
inputTextBox.TextColor3 = Color3.fromRGB(237, 237, 237)
inputTextBox.TextSize = 12
inputTextBox.TextXAlignment = Enum.TextXAlignment.Left
inputTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inputTextBox.BackgroundTransparency = 1
inputTextBox.Position = UDim2.new(0.0253, 0, 0, 0)
inputTextBox.Size = UDim2.new(0, 175, 0, 28)
inputTextBox.Parent = inputOuter

end

return ItemSection

end
return Library
