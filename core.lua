-- Create the main frame
local myFrame = CreateFrame("Frame", "MyFrame", UIParent)
myFrame:SetPoint("CENTER")
myFrame:SetWidth(200)
myFrame:SetHeight(280) -- Adjusted height to accommodate the label
myFrame:SetMovable(true)
myFrame:EnableMouse(true)
myFrame:RegisterForDrag("LeftButton")
myFrame:SetScript("OnDragStart", myFrame.StartMoving)
myFrame:SetScript("OnDragStop", myFrame.StopMovingOrSizing)

-- Create a label for the addon information
local addonLabel = myFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
addonLabel:SetPoint("TOP", 0, -10) -- Adjusted position for the label
addonLabel:SetText("Addon made by a WoW Player")

-- Define the button actions
local buttonActions = {
    {name = "General (/4)", command = "/4"},
    {name = "Trade (/5)", command = "/5"},
    {name = "LFG (/6)", command = "/6"},
    {name = "Guild (/7)", command = "/7"},
    {name = "Officer (/8)", command = "/8"},
    {name = "Party (/p)", command = "/p"},
    {name = "Raid (/ra)", command = "/ra"},
    {name = "Raid Warning (/rw)", command = "/rw"},
    {name = "Battleground (/bg)", command = "/bg"},
}

-- Create the buttons and add them to the frame
local buttons = {}
for i, action in ipairs(buttonActions) do
    local button = CreateFrame("Button", "MyButton"..i, myFrame, "UIPanelButtonTemplate")
    button:SetPoint("TOPLEFT", myFrame, "TOPLEFT", 20, -(i-1)*30 - 50) -- Adjusted position for the buttons
    button:SetWidth(150)
    button:SetHeight(25)
    button:SetText(action.name)

    -- Set button functionality
    button:SetScript("OnClick", function()
        ChatFrame_OpenChat(action.command, SELECTED_DOCK_FRAME)
    end)

    -- Add button to the buttons array
    buttons[i] = button
end
