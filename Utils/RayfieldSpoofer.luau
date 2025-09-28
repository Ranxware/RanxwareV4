--!optimize 2
--!nocheck

local Spoofer = {}

Spoofer.UI = nil :: ScreenGui?

local CoreGui = cloneref(game.CoreGui)

if gethui() then
	UI = gethui():FindFirstChild("Rayfield")
elseif CoreGui:FindFirstChild("RobloxGui") then
	UI = CoreGui.RobloxGui:FindFirstChild("Rayfield")
else
	UI = CoreGui:FindFirstChild("Rayfield")
end

if not Spoofer.UI then
	warn("Unable to find Rayfield Interface")
	return
end

local UiMain = UI.Main
local UiElements = UiMain.Elements

function Spoofer:SetElementVisible(TabName: string, ElementName: string, Value: boolean)
	local Tab: ScrollingFrame? = UiElements:FindFirstChild(TabName)
	if Tab and Tab:IsA("ScrollingFrame") then
		local Element: Frame? = Tab:FindFirstChild(ElementName)
		if Element and Element:IsA("Frame") and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" then
			Element.Visible = Value
		end
	end
end

function Spoofer:ChangeElement(TabName: string, ElementName: string, Properties: { [string]: any })
	local Tab: ScrollingFrame? = UiElements:FindFirstChild(TabName)
	if Tab and Tab:IsA("ScrollingFrame") then
		local Element: Frame? = Tab:FindFirstChild(ElementName)
		if Element and Element:IsA("Frame") and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" then
			for prop,value in pairs(Properties) do
				if Element[prop] ~= nil then
					Element[prop] = value
				end
			end
		end
	end
end

function Spoofer:ViewElements(TabName: string, Elements: {string}, Value: boolean)
	local Tab: ScrollingFrame? = UiElements:FindFirstChild(TabName)
	if Tab and Tab:IsA("ScrollingFrame") then
		for _,Name in pairs(Elements) do
			local Element: Frame? = Tab:FindFirstChild(Name)
			if Element and Element:IsA("Frame") and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" then
				Element.Visible = Value
			end
		end
	end
end

return Spoofer