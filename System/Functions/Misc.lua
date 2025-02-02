if _brMotherFight == nil then
	_brMotherFight = false
end
-- getLatency()
function getLatency()
	-- local lag = ((select(3,GetNetStats()) + select(4,GetNetStats())) / 1000)
	local lag = select(4, GetNetStats()) / 1000
	if lag < .05 then
		lag = .05
	elseif lag > .4 then
		lag = .4
	end
	return lag
end

--Calculate Agility
function getAgility()
	local AgiBase, AgiStat, AgiPos, AgiNeg = UnitStat("player", 2)
	local Agi = AgiBase + AgiPos + AgiNeg
	return Agi
end

function getFallDistance()
	local zDist
	local _, _, position = GetObjectPosition("player")

	if zCoord == nil then
		zCoord = position
	end
	if not IsFalling() or IsFlying() then
		zCoord = position
	end
	if position - zCoord < 0 then
		zDist = math.sqrt(((position - zCoord) ^ 2))
	else
		zDist = 0
	end

	return zDist
end
--if getFallTime() > 2 then
function getFallTime()
	if fallStarted == nil then
		fallStarted = 0
	end
	if fallTime == nil then
		fallTime = 0
	end
	if IsFalling() and getFallDistance() < 0 then
		if fallStarted == 0 then
			fallStarted = GetTime()
		end
		if fallStarted ~= 0 then
			fallTime = (math.floor((GetTime() - fallStarted) * 1000) / 1000)
		end
	end
	if not IsFalling() then
		fallStarted = 0
		fallTime = 0
	end
	return fallTime
end
-- if getLineOfSight("target"[,"target"]) then
function getLineOfSight(Unit1, Unit2)
	if Unit2 == nil then
		Unit2 = Unit1
		if Unit2 == "player" then
			Unit1 = "target"
		else
			Unit1 = "player"
		end
	end
	local skipLoSTable = br.lists.los
	if skipLoSTable[GetObjectID(Unit1)] or skipLoSTable[GetObjectID(Unit2)] then
		return true
	end
	if GetObjectExists(Unit1) and GetUnitIsVisible(Unit1) and GetObjectExists(Unit2) and GetUnitIsVisible(Unit2) then
		local X1, Y1, Z1 = GetObjectPosition(Unit1)
		local X2, Y2, Z2 = GetObjectPosition(Unit2)
		local pX, pY, pZ = GetObjectPosition("player")
		if TraceLine(X1, Y1, Z1 + 2, X2, Y2, Z2 + 2, 0x10) == nil then
			if _brMotherFight == true then
				if pX < -108 and X2 < -108 then
					return true
				elseif (pX > -108 and pX < -54) and (X2 > -108 and X2 < -54) then
					return true
				elseif pX > -54 and X2 > -54 then
					return true
				else
					return false
				end
			else
				return true
			end
		else
			return false
		end
	else
		return false
	end
end
-- function getLineOfSight(Unit1,Unit2)
-- 	if Unit2 == nil then
-- 		if Unit1 == "player" then
-- 			Unit1 = "target"
-- 		end
-- 		Unit2 = "player"
-- 	end
-- 	local skipLoSTable = br.lists.los
-- 	local obj1ID = GetObjectID(Unit1)
-- 	local obj2ID = GetObjectID(Unit2)
-- 	if skipLoSTable[obj1ID] ~= nil or skipLoSTable[obj2ID] ~= nil then return true end
-- 	if (GetUnitIsUnit(Unit1,"player") or (GetObjectExists(Unit1) and GetUnitIsVisible(Unit1)))
-- 		and (GetUnitIsUnit(Unit2,"player") or (GetObjectExists(Unit2) and GetUnitIsVisible(Unit2)))
-- 	then
-- 		local X1,Y1,Z1 = GetObjectPosition(Unit1)
-- 		local X2,Y2,Z2 = GetObjectPosition(Unit2)
-- 		return TraceLine(X1,Y1,Z1 + 2,X2,Y2,Z2 + 2, 0x10) == nil
-- 	end
-- 	return false
-- end
-- if getGround("target"[,"target"]) then
function getGround(Unit)
	if GetObjectExists(Unit) and GetUnitIsVisible(Unit) then
		local X1, Y1, Z1 = GetObjectPosition(Unit)
		if TraceLine(X1, Y1, Z1, X1, Y1, Z1 - 2, 0x10) == nil and TraceLine(X1, Y1, Z1, X1, Y1, Z1 - 2, 0x100) == nil then
			return false
		else
			return true
		end
	end
end
function getGroundDistance(Unit)
	if GetObjectExists(Unit) and GetUnitIsVisible(Unit) then
		local X1, Y1, Z1 = GetObjectPosition(Unit)
		for i = 1, 100 do
			if TraceLine(X1, Y1, Z1, X1, Y1, Z1 - i / 10, 0x10) ~= nil or TraceLine(X1, Y1, Z1, X1, Y1, Z1 - i / 10, 0x100) ~= nil then
				return i / 10
			end
		end
	else
		return 0
	end
end
-- if getPetLineOfSight("target"[,"target"]) then
function getPetLineOfSight(Unit)
	if GetObjectExists(Unit) and GetUnitIsVisible("pet") and GetUnitIsVisible(Unit) then
		local X1, Y1, Z1 = GetObjectPosition("pet")
		local X2, Y2, Z2 = GetObjectPosition(Unit)
		if TraceLine(X1, Y1, Z1 + 2, X2, Y2, Z2 + 2, 0x10) == nil then
			return true
		else
			return false
		end
	else
		return true
	end
end

--- Round
function round2(num, idp)
	mult = 10 ^ (idp or 0)
	return math.floor(num * mult + 0.5) / mult
end
-- if getTalent(8) == true then
function getTalent(Row, Column, specGroup)
	if specGroup == nil then
		specGroup = GetActiveSpecGroup()
	end
	local _, _, _, selected = GetTalentInfo(Row, Column, specGroup)
	return selected or false
end

-- if hasEmptySlots() then
function hasEmptySlots()
	local openSlots = 0
	for i = 0, 4 do --Let's look at each bag
		local numBagSlots = GetContainerNumSlots(i)
		if numBagSlots > 0 then -- Only look for slots if bag present
			openSlots = openSlots + select(1, GetContainerNumFreeSlots(i))
		end
	end
	if openSlots > 0 then
		return true
	else
		return false
	end
end
-- if hasGlyph(1234) == true then
function hasGlyph(glyphid)
	for i = 1, 6 do
		if select(4, GetGlyphSocketInfo(i)) == glyphid or select(6, GetGlyphSocketInfo(i)) == glyphid then
			return true
		end
	end
	return false
end

-- UnitGUID("target"):sub(-15,-10)

--if isGarrMCd() then
function isGarrMCd(Unit)
	if Unit == nil then
		Unit = "target"
	end
	if GetUnitExists(Unit) and (UnitDebuffID(Unit, 145832) or UnitDebuffID(Unit, 145171) or UnitDebuffID(Unit, 145065) or UnitDebuffID(Unit, 145071)) then
		return true
	else
		return false
	end
end
-- if isInCombat("target") then
function isInCombat(Unit)
	if UnitAffectingCombat(Unit) or isChecked("Ignore Combat") then
		return true
	else
		return false
	end
end
-- if isInDraenor() then
function isInDraenor()
	local tContains = tContains
	local currentMapID = C_Map.GetBestMapForUnit("player")
	local draenorMapIDs = br.lists.maps.Draenor
	return tContains(draenorMapIDs, currentMapID)
end
function isInLegion()
	local tContains = tContains
	local currentMapID = C_Map.GetBestMapForUnit("player")
	local legionMapIDs = br.lists.maps.Legion
	return tContains(legionMapIDs, currentMapID)
end
function isInProvingGround()
	local currentMapID = C_Map.GetBestMapForUnit("player")
	return currentMapID == 480
end

-- if IsInPvP() then
function isInPvP()
	local inpvp = GetPVPTimer()
	if (inpvp ~= 301000 and inpvp ~= -1) or (UnitIsPVP("player") and UnitIsPVP("target")) then
		return true
	else
		return false
	end
end

--if isLongTimeCCed("target") then
-- CCs with >=20 seconds
function isLongTimeCCed(Unit)
	if Unit == nil then
		return false
	end
	local longTimeCC = br.lists.longCC
	for i = 1, 40 do
		local debuffSpellID = select(10, UnitDebuff(Unit, i))
		if debuffSpellID == nil then
			return false
		end
		if longTimeCC[tonumber(debuffSpellID)] == true then
			return true
		end
	end
	return false
end
-- if isLooting() then
function isLooting()
	return GetNumLootItems() > 0
end
-- if not isMoving("target") then
function isMoving(Unit)
	if Unit == nil then
		return false
	end
	return GetUnitSpeed(Unit) > 0
end
-- if IsMovingTime(5) then
function IsMovingTime(time)
	if time == nil then
		time = 1
	end
	if GetUnitSpeed("player") > 0 then
		if IsRunning == nil then
			IsRunning = GetTime()
			IsStanding = nil
		end
		if GetTime() - IsRunning > time then
			return true
		end
	else
		if IsStanding == nil then
			IsStanding = GetTime()
			IsRunning = nil
		end
		if GetTime() - IsStanding > time then
			return false
		end
	end
end
function isPlayer(Unit)
	if GetUnitExists(Unit) ~= true then
		return false
	end
	if UnitIsPlayer(Unit) == true then
		return true
	elseif UnitIsPlayer(Unit) ~= true then
		local playerNPC = {
			[72218] = "Oto the Protector",
			[72219] = "Ki the Asssassin",
			[72220] = "Sooli the Survivalist",
			[72221] = "Kavan the Arcanist"
		}
		if playerNPC[tonumber(string.match(UnitGUID(Unit), "-(%d+)-%x+$"))] ~= nil then
			return true
		end
	else
		return false
	end
end
function getStandingTime()
	return DontMoveStartTime and GetTime() - DontMoveStartTime or nil
end
--
function isStanding(Seconds)
	return IsFalling() == false and DontMoveStartTime and getStandingTime() >= Seconds or false
end
-- if IsStandingTime(5) then
function IsStandingTime(time, unit)
	if time == nil then
		time = 1
	end
	if unit == nil then
		unit = "player"
	end
	if not IsFalling() and GetUnitSpeed(unit) == 0 then
		if IsStanding == nil then
			IsStanding = GetTime()
			IsRunning = nil
		end
		if GetTime() - IsStanding > time then
			return true
		end
	else
		if IsRunning == nil then
			IsRunning = GetTime()
			IsStanding = nil
		end
		if GetTime() - IsRunning > time then
			return false
		end
	end
end

-- if isValidTarget("target") then
function isValidTarget(Unit)
	if UnitIsEnemy("player", Unit) or isDummy(Unit) then
		if GetUnitExists(Unit) and not UnitIsDeadOrGhost(Unit) then
			return true
		else
			return false
		end
	else
		if GetUnitExists(Unit) then
			return true
		else
			return false
		end
	end
end

function isTargeting(Unit, MatchUnit)
	if GetUnit(Unit) == nil then
		return false
	end
	if UnitTarget(GetUnit(Unit)) == nil then
		return false
	end
	if MatchUnit == nil then
		MatchUnit = "player"
	end
	return UnitTarget(GetUnit(Unit)) == ObjectPointer(MatchUnit)
end

function enemyListCheck(Unit)
	local distance = getDistance(Unit, "player")
	local mcCheck =	(isChecked("Attack MC Targets") and (not GetUnitIsFriend(Unit, "player") or UnitIsCharmed(Unit))) or not GetUnitIsFriend(Unit, "player")
	--local playerObj = GetObjectWithGUID(UnitGUID("player"))
	return GetObjectExists(Unit) and not UnitIsDeadOrGhost(Unit) and UnitInPhase(Unit) and UnitCanAttack("player", Unit) and
		distance < 50 and
		not isCritter(Unit) and
		mcCheck and
		not GetUnitIsUnit(Unit, "pet") and
		UnitCreator(Unit) ~= ObjectPointer("player") and
		GetObjectID(Unit) ~= 11492 and
		getLineOfSight("player", Unit)
		and ((Unit ~= 131824 and Unit ~=  131823 and Unit ~= 131825) or ((UnitBuffID(Unit,260805) or GetUnitIsUnit(Unit,"target")) and (Unit == 131824 or Unit ==  131823 or Unit == 131825)))  
end

function isValidUnit(Unit)
	local hostileOnly = isChecked("Hostiles Only")
	local playerTarget = GetUnitIsUnit(Unit, "target")
	local reaction = GetUnitReaction(Unit, "player") or 10
	local targeting = isTargeting(Unit)
	local dummy = isDummy(Unit)
	local threatBypassUnit = br.lists.threatBypass[GetObjectID(Unit)] ~= nil
	local burnUnit = getOptionCheck("Forced Burn") and isBurnTarget(Unit) > 0
	local isCC = getOptionCheck("Don't break CCs") and isLongTimeCCed(Unit) or false
	local mcCheck = (isChecked("Attack MC Targets") and	(not GetUnitIsFriend(Unit, "player") or (UnitIsCharmed(Unit) and UnitCanAttack("player", Unit)))) or not GetUnitIsFriend(Unit, "player")
	if playerTarget and br.units[UnitTarget("player")] == nil and not enemyListCheck("target") then
		return false
	end
	if not pause(true) and Unit ~= nil and
		(br.units[Unit] ~= nil or Unit == "target" or threatBypassUnit or burnUnit) and
		mcCheck and not isCC and (dummy or burnUnit or (not UnitIsTapDenied(Unit) and isSafeToAttack(Unit) and		
			((not hostileOnly and reaction < 5) or (hostileOnly and (reaction < 4 or playerTarget or targeting)))))
	 then
		local instance = IsInInstance()
		local distanceToTarget = getDistance("target",Unit)
		local distanceToPlayer = getDistance("player",Unit)
		local inCombat = UnitAffectingCombat("player") or (GetObjectExists("pet") and UnitAffectingCombat("pet"))
		local unitThreat = hasThreat(Unit) or targeting or isInProvingGround() or burnUnit or threatBypassUnit
		return unitThreat or ((not instance and (playerTarget or distanceToTarget < 8)) or (instance and (#br.friend == 1 or (UnitAffectingCombat(Unit) and distanceToPlayer < 40)))) -- (not hasThreat and (
			-- Not In Instance
			-- (not instance and (playerTarget or distanceToTarget < 8)) or
			-- In Instance 
			-- (instance and playerTarget and ((distanceToPlayer < 20 or (UnitAffectingCombat(Unit) and distanceToPlayer < 40)) or #br.friend == 1))))
	end
	return false
end

function SpecificToggle(toggle)
	if customToggle then
		return false
	elseif getOptionValue(toggle) == 1 then
		return IsLeftControlKeyDown()
	elseif getOptionValue(toggle) == 2 then
		return IsLeftShiftKeyDown()
	elseif getOptionValue(toggle) == 3 then
		return IsRightControlKeyDown()
	elseif getOptionValue(toggle) == 4 then
		return IsRightShiftKeyDown()
	elseif getOptionValue(toggle) == 5 then
		return IsRightAltKeyDown()
	elseif getOptionValue(toggle) == 6 then
		return false
	elseif getOptionValue(toggle) == 7 then
		return GetKeyState(0x04)
	elseif getOptionValue(toggle) == 8 then
		return GetKeyState(0x05)
	elseif getOptionValue(toggle) == 9 then
		return GetKeyState(0x06)
	end
end

function UpdateToggle(toggle, delay)
	--if toggle == nil then toggle = "toggle" end
	if customToggle then
		toggle = toggleKey
	end
	if _G[toggle .. "Timer"] == nil then
		_G[toggle .. "Timer"] = 0
	end
	if
		(SpecificToggle(toggle .. " Mode") or customToggle) and not GetCurrentKeyBoardFocus() and
			GetTime() - _G[toggle .. "Timer"] > delay
	 then
		_G[toggle .. "Timer"] = GetTime()
		UpdateButton(tostring(toggle))
	end
end
function BurstToggle(toggle, delay)
	if burstKey == nil then
		burstKey = false
	end
	if _G[toggle .. "Timer"] == nil then
		_G[toggle .. "Timer"] = 0
	end
	if burst and not GetCurrentKeyBoardFocus() and GetTime() - _G[toggle .. "Timer"] > delay then
		if not burstKey then
			_G[toggle .. "Timer"] = GetTime()
			burstKey = true
		else
			_G[toggle .. "Timer"] = GetTime()
			burstKey = false
		end
	end
end
function SlashCommandHelp(cmd, msg)
	if cmd == nil then
		cmd = ""
	end
	if msg == nil then
		msg = ""
	end
	if cmd == "Print Help" then
		Print(tostring(commandHelp))
		return
	end
	if commandHelp == nil then
		commandHelp = "BadRotations Slash Commands\n        /" .. cmd .. " - " .. msg
	else
		commandHelp = commandHelp .. "\n        /" .. cmd .. " - " .. msg
	end
end
-- if pause() then
-- set skipCastingCheck to true, to not check if player is casting
-- (useful if you want to use off-cd stuff, or spells which can be cast while other is casting)
function pause(skipCastingCheck)
	-- local button = CreateFrame("Button", "DismountButton")
	-- if button == "RightButton" then
	-- 	Print("Right Clicked")
	-- end
	if disableControl == true then
		return true
	end
	if SpecificToggle("Pause Mode") == nil or getValue("Pause Mode") == 6 then
		pausekey = IsLeftAltKeyDown()
	else
		pausekey = SpecificToggle("Pause Mode")
	end
	-- Focused Azerite Beam / Cyclotronic Blast
	local lastCast = br.lastCast.tracker[1]
	if br.pauseCast - GetTime() <= 0 then
		local hasted = (1-UnitSpellHaste("player")/100)
		if lastCast == 295258 and getSpellCD(295258) == 0 then br.pauseCast = GetTime() + getCastTime(295258) + (getCastTime(295261) * hasted) end
		if lastCast == 293491 and GetItemCooldown(167555) == 0 then br.pauseCast = GetTime() + getCastTime(293491) + (2.5 * hasted) end
	end
	if GetTime() < br.pauseCast then
		return true
	elseif GetTime() >= br.pauseCast then 
		br.pauseCast = GetTime()
	end
	-- DPS Testing
	if isChecked("DPS Testing") then
		if GetObjectExists("target") and isInCombat("player") then
			if getCombatTime() >= (tonumber(getOptionValue("DPS Testing")) * 60) and isDummy() then
				StopAttack()
				ClearTarget()
				Print(tonumber(getOptionValue("DPS Testing")) .. " Minute Dummy Test Concluded - Profile Stopped")
				profileStop = true
			else
				profileStop = false
			end
		elseif not isInCombat("player") and profileStop == true then
			if GetObjectExists("target") then
				StopAttack()
				ClearTarget()
				profileStop = false
			end
		end
	end
	-- Pause Toggle
	if br.data.settings[br.selectedSpec].toggles["Pause"] == 1 then
		ChatOverlay("\124cFFED0000 -- Paused -- ")
		return true
	end
	-- Pause Hold/Auto
	if	(pausekey and GetCurrentKeyBoardFocus() == nil and isChecked("Pause Mode")) or profileStop or
		((IsMounted() or IsFlying()) and --and (GetObjectExists("target") and GetObjectID("target") ~= 56877)
		not (UnitBuffID("player", 190784) or UnitBuffID("player", 164222) or UnitBuffID("player", 165803) or
		UnitBuffID("player", 157059) or
		UnitBuffID("player", 157060))) or
		SpellIsTargeting() or
		-- or (not UnitCanAttack("player","target") and not UnitIsPlayer("target") and GetUnitExists("target"))
		(UnitCastingInfo("player") and not skipCastingCheck) or
		(UnitChannelInfo("player") and not skipCastingCheck) or
		UnitIsDeadOrGhost("player") or
		-- or (UnitIsDeadOrGhost("target") and not UnitIsPlayer("target"))
		UnitBuffID("player", 257427) or -- Eating
		UnitBuffID("player", 274914) or -- Drinking
		UnitDebuffID("player", 252753) -- Potion of Replenishment (BFA Mana channel) Apparently a debuff
		-- or UnitBuffID("target",117961) --Impervious Shield - Qiang the Merciless
		-- or UnitDebuffID("player",135147) --Dead Zone - Iron Qon: Dam'ren
		-- or (((UnitHealth("target")/UnitHealthMax("target"))*100) > 10 and UnitBuffID("target",143593)) --Defensive Stance - General Nagrazim
		-- or UnitBuffID("target",140296) --Conductive Shield - Thunder Lord / Lightning Guardian
	then
		if (UnitCastingInfo("player") and not skipCastingCheck) or (UnitChannelInfo("player") and not skipCastingCheck) then
			return true
		else
			ChatOverlay("Profile Paused")
			if GetUnitExists("pet") and UnitAffectingCombat("pet") then
				PetFollow()
			end
			return true
		end
	else
		return false
	end
end
-- feed a var
function toggleTrueNil(var)
	if _G[var] ~= true then
		_G[var] = true
	else
		_G[var] = nil
	end
end

function spellDebug(Message)
	if imDebugging == true and getOptionCheck("Debugging Mode") then
		ChatOverlay(Message)
	end
end
-- if isChecked("Debug") then
function isChecked(Value)
	if br.data ~= nil and br.data.settings ~= nil then
		--Print(br.data.settings[br.selectedSpec]["profile"..Value.."Check"])
		if br.data.settings[br.selectedSpec] == nil or br.data.settings[br.selectedSpec][br.selectedProfile] == nil then
			return false
		end

		if br.data.settings[br.selectedSpec] and (br.data.settings[br.selectedSpec][br.selectedProfile][Value .. "Check"] == 1 or
			br.data.settings[br.selectedSpec][br.selectedProfile][Value .. "Check"] == true)
		 then
			return true
		end
	end
	return false
end
-- if isSelected("Stormlash Totem") then
function isSelected(Value)
	if br.data.settings ~= nil and (br.data.settings[br.selectedSpec].toggles["Cooldowns"] == 3 or (isChecked(Value) and
		(getValue(Value) == 3 or (getValue(Value) == 2 and br.data.settings[br.selectedSpec].toggles["Cooldowns"] == 2))))
	 then
		return true
	end
	return false
end
-- if getValue("player") <= getValue("Eternal Flame") then
-- function getValue(Value)
-- 	if br.data~=nil then
-- 		if br.data.settings[br.selectedSpec][br.selectedProfile]~=nil then
-- 	        if br.data.settings[br.selectedSpec][br.selectedProfile][Value.."Status"] ~= nil then
-- 	            return br.data.settings[br.selectedSpec][br.selectedProfile][Value.."Status"]
-- 	        elseif br.data.settings[br.selectedSpec][br.selectedProfile][Value.."Drop"] ~= nil then
-- 	            return br.data.settings[br.selectedSpec][br.selectedProfile][Value.."Drop"]
-- 	        else
-- 	            return 0
-- 	        end
-- 		end
-- 	else
-- 		return 0
-- 	end
-- end
function getValue(Value)
	if br.data ~= nil and br.data.settings ~= nil then
		local selectedProfile = br.data.settings[br.selectedSpec][br.selectedProfile]
		if selectedProfile ~= nil then
			if selectedProfile[Value .. "Status"] ~= nil then
				return selectedProfile[Value .. "Status"]
			elseif selectedProfile[Value .. "Drop"] ~= nil then
				return selectedProfile[Value .. "Drop"]
			elseif selectedProfile[Value .. "EditBox"] ~= nil then
				return selectedProfile[Value .. "EditBox"]
			else
				return 0
			end
		end
	else
		return 0
	end
end
-- used to gather informations from the bot options frame
function getOptionCheck(Value)
	return isChecked(Value)
end
function getOptionValue(Value)
	return getValue(Value)
end
function getOptionText(Value)
	if br.data ~= nil and br.data.settings ~= nil then
		local selectedProfile = br.data.settings[br.selectedSpec][br.selectedProfile]
		if selectedProfile ~= nil then
			if selectedProfile[Value .. "Data"] ~= nil then
				if selectedProfile[Value .. "Drop"] ~= nil then
					if selectedProfile[Value .. "Data"][selectedProfile[Value .. "Drop"]] ~= nil then
						return selectedProfile[Value .. "Data"][selectedProfile[Value .. "Drop"]]
					end
				end
			end
		end
	end
	return ""
end

function convertName(name)
	local function titleCase(first, rest)
		return first:upper() .. rest:lower()
	end
	if name ~= nil then
		-- Cap All First Letters of Words
		name = name:gsub("(%a)([%w_']*)", titleCase)
		-- Lower first character of name
		name = name:gsub("%a", string.lower, 1)
		-- Remove all non alphanumeric in string
		name = name:gsub("%W", "")
		return name
	end
	return "None"
end

function bossHPLimit(unit, hp)
	-- Boss Active/Health Max
	local bossHPMax = bossHPMax or 0
	local inBossFight = inBossFight or false
	local enemyList = getEnemies("player", 40)
	for i = 1, #enemyList do
		local thisUnit = enemyList[i]
		if isBoss(thisUnit) then
			bossHPMax = UnitHealthMax(thisUnit)
			inBossFight = true
			break
		end
	end
	return (not inBossFight or (inBossFight and UnitHealthMax(unit) > bossHPMax * (hp / 100)))
end

function talentAnywhere()
	local removeTalent = RemoveTalent
	local learnTalent = LearnTalent
	-- Load Talent UI if not opened before
	if not IsAddOnLoaded("Blizzard_TalentUI") and not UnitAffectingCombat("player") then
		LoadAddOn("Blizzard_TalentUI")
	end

	local function talentSelection(row)
		selectedTalent = nil
		for column = 1, 3 do
			if IsMouseButtonDown(1) and newTalent == nil and
				MouseIsOver(_G["PlayerTalentFrameTalentsTalentRow" .. row .. "Talent" .. column]) and
				not select(4, GetTalentInfoByID(GetTalentInfo(row, column, 1), 1))
			 then
				selectedTalent = nil
				newTalent = select(1, GetTalentInfo(row, column, 1))
				newTalentRow = row
			end
			if newTalentRow ~= nil then
				if select(4, GetTalentInfoByID(GetTalentInfo(newTalentRow, column, 1), 1)) then
					selectedTalent = select(1, GetTalentInfo(newTalentRow, column, 1))
				end
			end
		end
		return selectedTalent, newTalent -- selectedNew
	end

	if PlayerTalentFrame and PlayerTalentFrame:IsVisible() and not IsResting() then
		for row = 1, 7 do
			selectedTalent, newTalent, selectedNew = talentSelection(row)
		end
		--ChatOverlay(tostring(selectedTalent).." | "..tostring(newTalent).." | "..tostring(selectedNew))
		if newTalent ~= nil then
			if selectedTalent ~= nil and selectedTalent ~= newTalent and not selectedNew and br.timer:useTimer("RemoveTalent", 0.1)	then
				removeTalent(selectedTalent)
			end
			if selectedTalent == nil and selectedTalent ~= newTalent and not selectedNew then
				learnTalent(newTalent)
				selectedNew = true
			end
			if selectedTalent == newTalent then
				selectedNew = false
				newTalent = nil
			end
		end
	end
end

function br.addonDebug(msg)
	if msg == nil then
		return
	end
	if isChecked("Addon Debug Messages") then
		print(br.classColor .. "[BadRotations] Debug: |cffFFFFFF" .. msg)
	end
end

