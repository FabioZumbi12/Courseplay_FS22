--[[
	This frame is a page for all global settings in the in game menu.
	All the layout, gui elements are cloned from the general settings page of the in game menu.
]]--

CpGlobalSettingsFrame = {}

---Creates the in game menu page.
function CpGlobalSettingsFrame.init()
	local inGameMenu = g_gui.screenControllers[InGameMenu]
	local page = CpGuiUtil.getNewInGameMenuFrame(inGameMenu,CpGlobalSettingsFrame
												,function () return true end,3)
	inGameMenu.pageCpGlobalSettings = page
end

--- Setup of the gui elements and binds the settings to the gui elements.
function CpGlobalSettingsFrame:initialize()
	self.boxLayout.elements = {}
	local layout = g_currentMission.inGameMenu.pageSettingsGeneral.boxLayout
	local genericSettingElement = CpGuiUtil.getGenericSettingElementFromLayout(layout)
	local genericSubTitleElement = CpGuiUtil.getGenericSubTitleElementFromLayout(layout)
	self.settings = g_Courseplay.globalSettings:getSettings()
	local settingsBySubTitle,pageTitle = g_Courseplay.globalSettings:getSettingSetup()
	CpSettingsUtil.generateGuiElementsFromSettingsTable(settingsBySubTitle,
	self.boxLayout,genericSettingElement, genericSubTitleElement)
	CpGuiUtil.changeTextForElementsWithProfileName(self,"ingameMenuFrameHeaderText",pageTitle)
	CpSettingsUtil.linkGuiElementsAndSettings(self.settings,self.boxLayout)

	self.boxLayout:invalidateLayout()
end

function CpGlobalSettingsFrame:onFrameOpen()
	InGameMenuGeneralSettingsFrame:superClass().onFrameOpen(self)
end
	
function CpGlobalSettingsFrame:onFrameClose()
	InGameMenuGeneralSettingsFrame:superClass().onFrameClose(self)
end