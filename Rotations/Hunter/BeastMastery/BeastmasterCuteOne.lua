local rotationName = "CuteOne"

---------------
--- Toggles ---
---------------
local function createToggles()
    -- Rotation Button
    RotationModes = {
        [1] = { mode = "Auto", value = 1 , overlay = "Automatic Rotation", tip = "Swaps between Single and Multiple based on number of targets in range.", highlight = 1, icon = br.player.spell.cobraShot },
        [2] = { mode = "Mult", value = 2 , overlay = "Multiple Target Rotation", tip = "Multiple target rotation used.", highlight = 0, icon = br.player.spell.multishot },
        [3] = { mode = "Sing", value = 3 , overlay = "Single Target Rotation", tip = "Single target rotation used.", highlight = 0, icon = br.player.spell.killCommand },
        [4] = { mode = "Off", value = 4 , overlay = "DPS Rotation Disabled", tip = "Disable DPS Rotation", highlight = 0, icon = br.player.spell.exhilaration}
    };
    CreateButton("Rotation",1,0)
    -- Cooldown Button
    CooldownModes = {
        [1] = { mode = "Auto", value = 1 , overlay = "Cooldowns Automated", tip = "Automatic Cooldowns - Boss Detection.", highlight = 1, icon = br.player.spell.aspectOfTheWild },
        [2] = { mode = "On", value = 2 , overlay = "Cooldowns Enabled", tip = "Cooldowns used regardless of target.", highlight = 0, icon = br.player.spell.aspectOfTheWild },
        [3] = { mode = "Off", value = 3 , overlay = "Cooldowns Disabled", tip = "No Cooldowns will be used.", highlight = 0, icon = br.player.spell.aspectOfTheWild }
    };
    CreateButton("Cooldown",2,0)
    -- BW Button
    BestialWrathModes = {
        [1] = { mode = "On", value = 1 , overlay = "Will use BW", tip = "Will use BW according to rotation", highlight = 1, icon = br.player.spell.bestialWrath },
        [2] = { mode = "Off", value = 2 , overlay = "Will hold BW", tip = "Will hold BW until toggled again", highlight = 0, icon = br.player.spell.bestialWrath }
    };
    CreateButton("BestialWrath",3,0)
    -- Defensive Button
    DefensiveModes = {
        [1] = { mode = "On", value = 1 , overlay = "Defensive Enabled", tip = "Includes Defensive Cooldowns.", highlight = 1, icon = br.player.spell.aspectOfTheTurtle },
        [2] = { mode = "Off", value = 2 , overlay = "Defensive Disabled", tip = "No Defensives will be used.", highlight = 0, icon = br.player.spell.aspectOfTheTurtle }
    };
    CreateButton("Defensive",4,0)
    -- Interrupt Button
    InterruptModes = {
        [1] = { mode = "On", value = 1 , overlay = "Interrupts Enabled", tip = "Includes Basic Interrupts.", highlight = 1, icon = br.player.spell.counterShot },
        [2] = { mode = "Off", value = 2 , overlay = "Interrupts Disabled", tip = "No Interrupts will be used.", highlight = 0, icon = br.player.spell.counterShot }
    };
    CreateButton("Interrupt",5,0)
    -- MD Button
    MisdirectionModes = {
        [1] = { mode = "On", value = 1 , overlay = "Misdirection Enabled", tip = "Misdirection Enabled", highlight = 1, icon = br.player.spell.misdirection },
        [2] = { mode = "Off", value = 2 , overlay = "Misdirection Disabled", tip = "Misdirection Disabled", highlight = 0, icon = br.player.spell.misdirection }
    };
    CreateButton("Misdirection",6,0)
    -- Murder of crows
    MurderOfCrowsModes = {
        [1] = { mode = "On", value = 1 , overlay = "Always use MoC", tip = "Will Use Murder of Crows At All Times", highlight = 1, icon = br.player.spell.aMurderOfCrows },
        [2] = { mode = "CD", value = 2 , overlay = "Use MoC only on Cooldowns", tip = "Will Use Murder of Crows Only on Cooldowns", highlight = 0, icon = br.player.spell.aMurderOfCrows }
    };
    CreateButton("MurderOfCrows",7,0)
    --Pet summon
    PetSummonModes = {
        [1] = { mode = "1", value = 1 , overlay = "Summon Pet 1", tip = "Summon Pet 1", highlight = 1, icon = br.player.spell.callPet1 },
        [2] = { mode = "2", value = 2 , overlay = "Summon Pet 2", tip = "Summon Pet 2", highlight = 1, icon = br.player.spell.callPet2 },
        [3] = { mode = "3", value = 3 , overlay = "Summon Pet 3", tip = "Summon Pet 3", highlight = 1, icon = br.player.spell.callPet3 },
        [4] = { mode = "4", value = 4 , overlay = "Summon Pet 4", tip = "Summon Pet 4", highlight = 1, icon = br.player.spell.callPet4 },
        [5] = { mode = "5", value = 5 , overlay = "Summon Pet 5", tip = "Summon Pet 5", highlight = 1, icon = br.player.spell.callPet5 },
        [6] = { mode = "None", value = 6 , overlay = "No pet", tip = "Dont Summon any Pet", highlight = 0, icon = br.player.spell.callPet }
    };
    CreateButton("PetSummon",8,0)
end

---------------
--- OPTIONS ---
---------------
local function createOptions()
    local optionTable

    local function rotationOptions()
        local section
        -- General Options
        section = br.ui:createSection(br.ui.window.profile, "General")
            -- APL
            br.ui:createDropdownWithout(section, "APL Mode", {"|cffFFFFFFSimC"}, 1, "|cffFFFFFFSet APL Mode to use.")
            -- Dummy DPS Test
            br.ui:createSpinner(section, "DPS Testing",  5,  5,  60,  5,  "|cffFFFFFFSet to desired time for test in minuts. Min: 5 / Max: 60 / Interval: 5")
            -- Beast Mode
            br.ui:createCheckbox(section, "Beast Mode", "|cffFFFFFFWARNING! Selecting this will attack everything!")
            -- AoE Units
            br.ui:createSpinnerWithout(section, "Units To AoE", 2, 1, 10, 1, "|cffFFFFFFSet to desired units to start AoE at.")
            -- Misdirection
            br.ui:createDropdownWithout(section,"Misdirection", {"|cff00FF00Tank","|cffFFFF00Focus","|cffFF0000Pet"}, 1, "|cffFFFFFFSelect target to Misdirect to.")
            -- Heart Essence
            br.ui:createCheckbox(section,"Use Essence")
            -- Opener
            br.ui:createCheckbox(section, "Opener")
        br.ui:checkSectionState(section)
        -- Pet Options
        section = br.ui:createSection(br.ui.window.profile, "Pet")
            -- Auto Summon
            -- br.ui:createDropdown(section, "Auto Summon", {"Pet 1","Pet 2","Pet 3","Pet 4","Pet 5","No Pet"}, 1, "Select the pet you want to use")
            br.ui:createDropdownWithout(section, "Pet Target", {"Dynamic Unit", "Only Target", "Any Unit"},1,"Select how you want pet to acquire targets.")
            -- Auto Attack/Passive
            br.ui:createCheckbox(section, "Auto Attack/Passive")
            -- Auto Growl
            br.ui:createCheckbox(section, "Auto Growl")
            -- Bite/Claw
            br.ui:createCheckbox(section, "Bite / Claw")
            -- Cat-like Reflexes
            br.ui:createSpinner(section, "Cat-like Reflexes", 30, 0, 100, 5, "|cffFFFFFFPet Health Percent to Cast At")
            -- Dash
            br.ui:createCheckbox(section, "Dash")
            -- Play Dead / Wake Up
            br.ui:createSpinner(section, "Play Dead / Wake Up", 25,  0,  100,  5,  "|cffFFFFFFHealth Percent to Cast At")
            -- Prowl/Spirit Walk
            br.ui:createCheckbox(section, "Prowl / Spirit Walk")
            -- Mend Pet
            br.ui:createSpinner(section, "Mend Pet",  50,  0,  100,  5,  "|cffFFFFFFHealth Percent to Cast At")
            -- Purge
            br.ui:createDropdown(section, "Purge", {"Every Unit","Only Target"}, 2, "Select if you want Purge only Target or every Unit arround the Pet")
            -- Spirit Mend
            br.ui:createSpinner(section, "Spirit Mend", 70, 0, 100, 5, "|cffFFFFFFHealth Percent to Cast At")
            -- Survival of the Fittest
            br.ui:createSpinner(section, "Survival of the Fittest", 40, 0, 100, 5, "|cffFFFFFFHealth Percent to Cast At")
        br.ui:checkSectionState(section)
        -- Cooldown Options
        section = br.ui:createSection(br.ui.window.profile, "Cooldowns")
            -- Agi Pot
            br.ui:createCheckbox(section,"Potion")
            -- Elixir
            br.ui:createDropdownWithout(section,"Elixir", {"Flask of Seventh Demon","Repurposed Fel Focuser","Oralius' Whispering Crystal","None"}, 1, "|cffFFFFFFSet Elixir to use.")
            -- Racial
            br.ui:createCheckbox(section,"Racial")
            -- Trinkets
            br.ui:createDropdownWithout(section, "Trinkets", {"|cff00FF001st Only","|cff00FF002nd Only","|cffFFFF00Both","|cffFF0000None"}, 1, "|cffFFFFFFSelect Trinket Usage.")
            br.ui:createCheckbox(section,"Power Reactor")
            br.ui:createCheckbox(section,"Ashvane's Razor Coral")
            br.ui:createCheckbox(section,"Pocket Sized Computation Device")
            -- Bestial Wrath
            br.ui:createDropdownWithout(section,"Bestial Wrath", {"|cff00FF00Boss","|cffFFFF00Always"}, 1, "|cffFFFFFFSelect Bestial Wrath Usage.")
            -- Trueshot
            br.ui:createCheckbox(section,"Aspect of the Wild")
            -- Stampede
            br.ui:createCheckbox(section,"Stampede")
            -- A Murder of Crows / Barrage
            br.ui:createCheckbox(section,"A Murder Of Crows / Barrage")
            -- Spitting Cobra
            br.ui:createCheckbox(section,"Spitting Cobra")
        br.ui:checkSectionState(section)
        -- Defensive Options
        section = br.ui:createSection(br.ui.window.profile, "Defensive")
            -- Healthstone
            br.ui:createSpinner(section, "Pot/Stoned",  60,  0,  100,  5,  "|cffFFFFFFHealth Percent to Cast At")
            -- Heirloom Neck
            br.ui:createSpinner(section, "Heirloom Neck",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.");
            -- Aspect of the Turtle
            br.ui:createSpinner(section, "Aspect Of The Turtle",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.");
            -- Concussive Shot
            br.ui:createSpinner(section, "Concussive Shot", 10, 5, 40, 5, "|cffFFBB00Minmal range to use at.")
            -- Disengage
            br.ui:createSpinner(section, "Disengage", 5, 5, 40, 5, "|cffFFBB00Minmal range to use at.")
            -- Exhilaration
            br.ui:createSpinner(section, "Exhilaration",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.");
            -- Feign Death
            br.ui:createSpinner(section, "Feign Death", 30, 0, 100, 5, "|cffFFBB00Health Percentage to use at.")
        br.ui:checkSectionState(section)
        -- Interrupt Options
        section = br.ui:createSection(br.ui.window.profile, "Interrupts")
            -- Counter Shot
            br.ui:createCheckbox(section,"Counter Shot")
            -- Intimidation
            br.ui:createCheckbox(section,"Intimidation")
            -- Interrupt Percentage
            br.ui:createSpinner(section, "Interrupt At",  0,  0,  95,  5,  "|cffFFFFFFCast Percent to Cast At")
        br.ui:checkSectionState(section)
        -- Toggle Key Options
        section = br.ui:createSection(br.ui.window.profile, "Toggle Keys")
            -- Single/Multi Toggle
            br.ui:createDropdown(section, "Rotation Mode", br.dropOptions.Toggle,  6)
            -- Cooldown Key Toggle
            br.ui:createDropdown(section, "Cooldown Mode", br.dropOptions.Toggle,  6)
            -- Defensive Key Toggle
            br.ui:createDropdown(section, "Defensive Mode", br.dropOptions.Toggle,  6)
            -- Interrupts Key Toggle
            br.ui:createDropdown(section, "Interrupt Mode", br.dropOptions.Toggle,  6)
            -- Pause Toggle
            br.ui:createDropdown(section, "Pause Mode", br.dropOptions.Toggle,  6)
        br.ui:checkSectionState(section)
    end
    optionTable = {{
        [1] = "Rotation Options",
        [2] = rotationOptions,
    }}
    return optionTable
end

--------------
--- Locals ---
--------------
-- BR API Locals
local buff
local cast
local cd
local charges
local debuff
local enemies
local equiped
local focus
local focusMax
local focusRegen
local gcd
local gcdMax
local has
local inCombat
local inInstance
local inRaid
local item
local level
local lowestHP
local mode
local opener
local php
local potion
local race
local solo
local spell
local talent
local traits
local ttm
local units
local use
-- General Locals
local actionList = {}
local critChance
local focusedTime = GetTime()
local flying
local haltProfile
local healPot
local leftCombat
local lootDelay
local petCombat
local profileStop
local pullTimer
local thp
local ttd
-- Profile Specific Locals
local lowestBarbedShot

-----------------
--- Functions ---
-----------------
local function isTankInRange()
    if isChecked("Auto Growl") then
        if #br.friend > 1 then
            for i = 1, #br.friend do
                local friend = br.friend[i]
                if friend.GetRole()== "TANK" and not UnitIsDeadOrGhost(friend.unit) and getDistance(friend.unit) < 100 then
                return true
                end
            end
        end
    end
    return false
end

--------------------
--- Action Lists ---
--------------------
-- Action List - Extras
actionList.Extras = function()
    -- Dummy Test
    if isChecked("DPS Testing") then
        if GetObjectExists("target") then
            if getCombatTime() >= (tonumber(getOptionValue("DPS Testing"))*60) and isDummy() then
                StopAttack()
                ClearTarget()
                Print(tonumber(getOptionValue("DPS Testing")) .." Minute Dummy Test Concluded - Profile Stopped")
                profileStop = true
            end
        end
    end -- End Dummy Test
    -- Misdirection
    if mode.misdirection == 1 then
        if isValidUnit("target") and getDistance("target") < 40 then
            local misdirectUnit = "pet"
            if getOptionValue("Misdirection") == 1 and (inInstance or inRaid) then
                for i = 1, #br.friend do
                    local thisFriend = br.friend[i].unit
                    if (br.friend[i].role == "TANK" or UnitGroupRolesAssigned(thisFriend) == "TANK")
                        and not UnitIsDeadOrGhost(thisFriend)
                    then
                        misdirectUnit = thisFriend
                        break
                    end
                end
            end
            if getOptionValue("Misdirection") == 2 and not UnitIsDeadOrGhost("focus")
                and GetUnitIsFriend("focus","player")
            then
                misdirectUnit = "focus"
            end
            if GetUnitExists(misdirectUnit) then
                if cast.misdirection(misdirectUnit) then return end
            end
        end
    end
end -- End Action List - Extras

-- Action List - Defensive
actionList.Defensive = function()
    if useDefensive() then
        -- Pot/Stoned
        if isChecked("Pot/Stoned") and (use.able.healthstone() or canUseItem(healPot))
            and php <= getOptionValue("Pot/Stoned") and inCombat and (hasHealthPot() or has.healthstone())
        then
            if use.able.healthstone() then
                use.healthstone()
            elseif canUseItem(healPot) then
                useItem(healPot)
            end
        end
        -- Heirloom Neck
        if isChecked("Heirloom Neck") and php <= getOptionValue("Heirloom Neck") then
            if use.able.heirloomNeck() and item.heirloomNeck ~= 0 and item.heirloomNeck ~= item.manariTrainingAmulet then
                if use.heirloomNeck() then return true end
            end
        end
        -- Aspect of the Turtle
        if isChecked("Aspect Of The Turtle") and php <= getOptionValue("Aspect Of The Turtle") then
            if cast.aspectOfTheTurtle("player") then return end
        end
        -- Concussive Shot
        if isChecked("Concussive Shot") and getDistance("target") < getOptionValue("Concussive Shot") and isValidUnit("target") then
            if cast.concussiveShot("target") then return end
        end
        -- Disengage
        if isChecked("Disengage") and getDistance("target") < getOptionValue("Disengage") and isValidUnit("target") then
            if cast.disengage("player") then return end
        end
        -- Exhilaration
        if isChecked("Exhilaration") and php <= getOptionValue("Exhilaration") then
            if cast.exhilaration("player") then return end
        end
        -- Feign Death
        if isChecked("Feign Death") and php <= getOptionValue("Feign Death") then
            if cast.feignDeath("player") then return end
        end
    end -- End Defensive Toggle
end -- End Action List - Defensive

-- Action List - Interrupts
actionList.Interrupts = function()
    if useInterrupts() then
        local thisUnit
        -- Counter Shot
        if isChecked("Counter Shot") then
            for i=1, #enemies.yards40f do
            thisUnit = enemies.yards40f[i]
                if canInterrupt(thisUnit,getOptionValue("Interrupt At")) then
                    if cast.counterShot(thisUnit) then return end
                end
            end
        end
        -- Freezing Trap
        if isChecked("Freezing Trap") and cast.able.freezingTrap() then
            for i = 1, #enemies.yards40f do
                thisUnit = enemies.yards40f[i]
                if getDistance(thisUnit) > 8 and getCastTimeRemain(thisUnit) > 3 then
                    if cast.freezingTrap(thisUnit,"ground") then return true end
                end
            end
        end
        -- Intimidation
        if isChecked("Intimidation") and not UnitIsDeadOrGhost("pet") and UnitExists("pet") then
            for i=1, #enemies.yards40f do
                thisUnit = enemies.yards40f[i]
                if canInterrupt(thisUnit,getOptionValue("Interrupt At")) then
                    if cast.intimidation(thisUnit) then return end
                end
            end
        end
    end -- End useInterrupts check
end -- End Action List - Interrupts

-- Action List - Cooldowns
actionList.Cooldowns = function()
    if useCDs() then
        -- Trinkets
        if useCDs() and #enemies.yards40f >= 1 then
            if isChecked("Power Reactor") and equiped.vigorTrinket() and use.able.vigorTrinket() then
                if buff.vigorEngaged.exists() and buff.vigorEngaged.stack() == 6
                    and br.timer:useTimer("Vigor Engaged Delay", 6)
                then
                    use.vigorTrinket()
                end
            end
        end
        -- Pocket Sized Computation Device
        -- use_item,effect_name=cyclotronic_blast,if=!buff.bestial_wrath.up
        if isChecked("Pocket Sized Computation Device") and equiped.pocketSizedComputationDevice() 
            and use.able.pocketSizedComputationDevice() and not buff.bestialWrath.exists()
        then
            use.pocketSizedComputationDevice()
        end
        -- Ashvane's Razor Coral
        -- ashvanes_razor_coral,if=buff.aspect_of_the_wild.remains>15|debuff.razor_coral_debuff.down|target.time_to_die<20
        if isChecked("Ashvane's Razor Coral") and equiped.ashvanesRazorCoral() and use.able.ashvanesRazorCoral()
            and (not equiped.pocketSizedComputationDevice() or (equiped.pocketSizedComputationDevice() and cd.pocketSizedComputationDevice.remain() > 0))
            and (buff.aspectOfTheWild.remain() > 15 or not debuff.razorCoral.exists(units.dyn40) or ttd(units.dyn40) < 20)
        then
            use.ashvanesRazorCoral()
        end

        if (getOptionValue("Trinkets") == 1 or getOptionValue("Trinkets") == 3)
            and use.able.slot(13) and not equiped.vigorTrinket(13)
            and not equiped.pocketSizedComputationDevice(13) and not equiped.ashvanesRazorCoral(13)
        then
            use.slot(13)
        end
        if (getOptionValue("Trinkets") == 2 or getOptionValue("Trinkets") == 3)
            and use.able.slot(14) and not equiped.vigorTrinket(14)
            and not equiped.pocketSizedComputationDevice(14) and not equiped.ashvanesRazorCoral(14)
        then
            use.slot(14)
        end
        -- Racial: Orc Blood Fury | Troll Berserking | Blood Elf Arcane Torrent
        if isChecked("Racial") and cast.able.racial() then --and cd.racial.remain() == 0 then
            -- ancestral_call,if=cooldown.bestial_wrath.remains>30
            -- fireblood,if=cooldown.bestial_wrath.remains>30
            if cd.bestialWrath.remain() > 30 and (race == "MagharOrc" or race == "DarkIronDwarf") then
                if cast.racial() then return end
            end
            -- berserking,if=buff.aspect_of_the_wild.up&(target.time_to_die>cooldown.berserking.duration+duration|(target.health.pct<35|!talent.killer_instinct.enabled))|target.time_to_die<13
            -- blood_fury,if=buff.aspect_of_the_wild.up&(target.time_to_die>cooldown.blood_fury.duration+duration|(target.health.pct<35|!talent.killer_instinct.enabled))|target.time_to_die<16
            if (buff.aspectOfTheWild.exists()
                and ((race == "Troll" and ttd(units.dyn40) < 13) or (race == "Orc" and ttd(units.dyn40) < 16))
                and (ttd(units.dyn40) > cd.racial.remain() + buff.racial.remain()
                    or (thp(units.dyn40) < 35 or not talent.killerInstinct)))
            then
                if cast.racial() then return end
            end
            -- lights_judgment,if=pet.cat.buff.frenzy.up&pet.cat.buff.frenzy.remains>gcd.max|!pet.cat.buff.frenzy.up
            if (buff.frenzy.exists("pet") and buff.frenzy.remains("pet") > gcdMax or not buff.frenzy.exists("pet") and race == "LightforgedDraenei") then
                if cast.racial() then return end
            end
        end
        -- Potion
        --potion,if=buff.bestial_wrath.up&buff.aspect_of_the_wild.up&(target.health.pct<35|!talent.killer_instinct.enabled)|target.time_to_die<25
        -- if cast.able.potion() and (buff.bestialWrath.exists() and buff.aspectOfTheWild.exists() and (thp(units.dyn40) < 35 or not talent.killerInstinct) or ttd(units.dyn40) < 25) then
        --     if cast.potion() then return end
        -- end
        -- Heart Essence
        if isChecked("Use Essence") then
            -- worldvein_resonance
            if cast.able.worldveinResonance() then
                if cast.worldveinResonance() then return end
            end
            -- guardian_of_azeroth,if=cooldown.aspect_of_the_wild.remains<10|target.time_to_die>cooldown+duration|target.time_to_die<30
            if cast.able.guardianOfAzeroth() and (cd.aspectOfTheWild.remain() < 10
                or ttd(units.dyn40) > cd.guardianOfAzeroth.remian() + 180 or (ttd(units.dyn40) < 30 and useCDs()))
            then
                if cast.guardianOfAzeroth() then return end
            end
            -- ripple_in_space
            if cast.able.rippleInSpace() then
                if cast.rippleInSpace() then return end
            end
            -- memory_of_lucid_dreams
            if cast.able.memoryOfLucidDreams() then
                if cast.memoryOfLucidDreams() then return end
            end
        end
        -- Aspect of the Wild
        -- aspect_of_the_wild,precast_time=1.1,if=!azerite.primal_instincts.enabled
        if isChecked("Aspect of the Wild") and cast.able.aspectOfTheWild()
            and (not traits.primalInstincts.active) and ttd(units.dyn40) > 15
        then
            if cast.aspectOfTheWild() then return end
        end
    end -- End useCooldowns check
    -- Bestial Wrath
    -- bestial_wrath,precast_time=1.5,if=azerite.primal_instincts.enabled&(!essence.essence_of_the_focusing_iris.major)&(!equipped.pocketsized_computation_device|!cooldown.cyclotronic_blast.duration)
    if mode.bestialWrath == 1 and (getOptionValue("Bestial Wrath") == 2 or (getOptionValue("Bestial Wrath") == 1 and useCDs()))
        and cast.able.bestialWrath() and (traits.primalInstincts.active) and ttd(units.dyn40) > 15
        -- and (not equiped.pocketSizedComputationDevice() or cd.pocketSizedComputationDevice.remain() > 0)
    then
        if cast.bestialWrath() then return end
    end
end -- End Action List - Cooldowns

-- Action List - Opener
actionList.Opener = function()
    -- Start Attack
    -- auto_attack
    if isChecked("Opener") and useCDs() and not opener.complete then
        if isValidUnit("target") and getDistance("target") < 40
            and getFacing("player","target") and getSpellCD(61304) == 0
        then
            -- Begin
            if not opener.OPN1 then
                Print("Starting Opener")
                opener.count = opener.count + 1
                opener.OPN1 = true
                StartAttack()
                return
            -- Aspect of the Wild - No Primal Instincts
            elseif opener.OPN1 and not opener.AOW1 then
                if traits.primalInstincts.active then
                    opener.AOW1 = true
                    opener.count = opener.count - 1
                elseif cd.aspectOfTheWild.remain() > gcd then
                    castOpenerFail("aspectOfTheWild","AOW1",opener.count)
                elseif cast.able.aspectOfTheWild() then
                    castOpener("aspectOfTheWild","AOW1",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Bestial Wrath
            elseif opener.AOW1 and not opener.BW1 then
                if cd.bestialWrath.remain() > gcd then
                    castOpenerFail("bestialWrath","BW1",opener.count)
                elseif cast.able.bestialWrath() then
                    castOpener("bestialWrath","BW1",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Barbed Shot
            elseif opener.BW1 and not opener.BS1 then
                if charges.barbedShot.count() == 0 then
                    castOpenerFail("barbedShot","BS1",opener.count)
                elseif cast.able.barbedShot() then
                    castOpener("barbedShot","BS1",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Barbed Shot 2 - Primal Instincts
            elseif opener.BS1 and not opener.BS2 then
                if not traits.primalInstincts.active then
                    opener.BS2 = true
                    opener.count = opener.count - 1
                elseif charges.barbedShot.count() == 0 then
                    castOpenerFail("barbedShot","BS2",opener.count)
                elseif cast.able.barbedShot() then
                    castOpener("barbedShot","BS2",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Kill Command - No Primal Instincts
            elseif opener.BS2 and not opener.KC1 then
                if traits.primalInstincts.active then
                    opener.KC1 = true
                    opener.count = opener.count - 1
                elseif cd.killCommand.remain() > gcd then
                    castOpenerFail("killCommand","KC1",opener.count)
                elseif cast.able.killCommand() then
                    castOpener("killCommand","KC1",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Aspect of the Wild - Primal Instincts
            elseif opener.KC1 and not opener.AOW2 then
                if not traits.primalInstincts.active then
                    opener.AOW2 = true
                    opener.count = opener.count - 1
                elseif cd.aspectOfTheWild.remain() > gcd then
                    castOpenerFail("aspectOfTheWild","AOW2",opener.count)
                elseif cast.able.aspectOfTheWild() then
                    castOpener("aspectOfTheWild","AOW2",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- A Murder of Crows
            elseif opener.AOW2 and not opener.MOC1 then
                if not talent.aMurderOfCrows or cd.aMurderOfCrows.remain() > gcd then
                    castOpenerFail("aMurderOfCrows","MOC1",opener.count)
                elseif cast.able.aMurderOfCrows() then
                    castOpener("aMurderOfCrows","MOC1",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Kill Command 2 - Primal Instincts
            elseif opener.MOC1 and not opener.KC2 then
                if not traits.primalInstincts.active then
                    opener.KC2 = true
                    opener.count = opener.count - 1
                elseif cd.killCommand.remain() > gcd then
                    castOpenerFail("killCommand","KC2",opener.count)
                elseif cast.able.killCommand() then
                    castOpener("killCommand","KC2",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Chimaera Shot
            elseif opener.KC2 and not opener.CHS1 then
                if not talent.chimaeraShot or cd.chimaeraShot.remain() > gcd then
                    castOpenerFail("chimaeraShot","CHS1",opener.count)
                elseif cast.able.chimaeraShot() then
                    castOpener("chimaeraShot","CHS1",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Cobra Shot
            elseif opener.CHS1 and not opener.COS1 then
                if not cast.able.cobraShot() then
                    castOpenerFail("cobraShot","COS1",opener.count)
                elseif cast.able.cobraShot() then
                    castOpener("cobraShot","COS1",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Kill Command 3
            elseif opener.COS1 and not opener.KC3 then
                if cd.killCommand.remain() > gcd then
                    castOpenerFail("killCommand","KC3",opener.count)
                elseif cast.able.killCommand() then
                    castOpener("killCommand","KC3",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Barbed Shot 3
            elseif opener.KC3 and not opener.BS3 then
                if charges.barbedShot.count() == 0 then
                    castOpenerFail("barbedShot","BS3",opener.count)
                elseif cast.able.barbedShot() then
                    castOpener("barbedShot","BS3",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Cobra Shot 2 - No Primal Instincts
            elseif opener.BS3 and not opener.COS2 then
                if traits.primalInstincts.active then
                    opener.COS2 = true;
                    opener.count = opener.count - 1
                elseif not cast.able.cobraShot() then
                    castOpenerFail("cobraShot","COS2",opener.count)
                elseif cast.able.cobraShot() then
                    castOpener("cobraShot","COS2",opener.count)
                end
                opener.count = opener.count + 1
                return
            -- Kill Command 4 - No Primal Instincts
            elseif opener.COS2 and not opener.KC4 then
                if traits.primalInstincts.active then
                    opener.KC4 = true;
                    opener.count = opener.count - 1
                elseif cd.killCommand.remain() > gcd then
                    castOpenerFail("killCommand","KC4",opener.count)
                elseif cast.able.killCommand() then
                    castOpener("killCommand","KC4",opener.count)
                end
                opener.count = opener.count + 1
                return
            elseif opener.KC4 and opener.OPN1 then
                Print("Opener Complete")
                opener.count = 0
                opener.complete = true
            end
        end
    elseif (UnitExists("target") and not useCDs()) or not isChecked("Opener") then
        opener.complete = true
    end
end -- End Action List - Opener

-- Action List - Single Target
actionList.St = function()
    -- Barbed Shot
    -- barbed_shot,if=pet.cat.buff.frenzy.up&pet.cat.buff.frenzy.remains<gcd|cooldown.bestial_wrath.remains&(full_recharge_time<gcd|azerite.primal_instincts.enabled&cooldown.aspect_of_the_wild.remains<gcd)
    if cast.able.barbedShot() and ((buff.frenzy.exists("pet") and buff.frenzy.remains("pet") <= gcdMax + 0.1)
        or (cd.bestialWrath.remain() > gcdMax and (charges.barbedShot.timeTillFull() < gcdMax
        or (traits.primalInstincts.active and isChecked("Aspect of the Wild") and useCDs() and cd.aspectOfTheWild.remain() < gcdMax))))
    then
        if cast.barbedShot() then return end
    end
    -- Concentrated Flame
    -- concentrated_flame,if=focus+focus.regen*gcd<focus.max&buff.bestial_wrath.down&(!dot.concentrated_flame_burn.remains&!action.concentrated_flame.in_flight)|full_recharge_time<gcd|target.time_to_die<5
    if isChecked("Use Essence") and cast.able.concentratedFlame() and (focus + focusRegen * gcdMax < focusMax and not buff.bestialWrath.exists()
        and (not debuff.concentratedFlame.exists(units.dyn40) or charges.concentratedFlame.timeTillFull() < gcdMax or (ttd(units.dyn40) < 5 and useCDs())))
    then
        if cast.concentratedFlame() then return end
    end
    -- Aspect of the Wild
    -- aspect_of_the_wild,if=cooldown.barbed_shot.charges<2|pet.cat.buff.frenzy.stack>2|!azerite.primal_instincts.enabled
    if isChecked("Aspect of the Wild") and useCDs() and cast.able.aspectOfTheWild() and (ttd(units.dyn40) > 15 or useCDs())
        and (charges.barbedShot.count() < 2 or buff.frenzy.stack("pet") > 2 or not traits.primalInstincts.active)
    then
        if cast.aspectOfTheWild() then return end
    end
    -- Stampede
    -- stampede,if=buff.aspect_of_the_wild.up&buff.bestial_wrath.up|target.time_to_die<15
    if isChecked("Stampede") and talent.stampede and cast.able.stampede()
    and (buff.aspectOfTheWild.exists() and buff.bestialWrath.exists()) and (ttd(units.dyn40) > 15 or useCDs())
    then
        if cast.stampede() then return end
    end
    -- A Murder of Crows
    -- a_murder_of_crows,if=cooldown.bestial_wrath.remains
    if isChecked("A Murder Of Crows / Barrage") and mode.murderOfCrows == 1 and cast.able.aMurderOfCrows()
        and (cd.bestialWrath.remain() > 0 or (getOptionValue("Bestial Wrath") == 1 and not useCDs()) or getOptionValue("Bestial Wrath") == 3)
    then
        if cast.aMurderOfCrows() then return end
    end
    -- Focused Azerite Beam
    -- focused_azerite_beam,if=buff.bestial_wrath.down|target.time_to_die<5
    if isChecked("Use Essence") and cast.able.focusedAzeriteBeam()
        and not (buff.bestialWrath.exists() or (ttd(units.dyn40) < 5 and useCDs()))
        and (#enemies.yards8f >= 3 or useCDs())
    then
        local minCount = useCDs() and 1 or 3
        if cast.focusedAzeriteBeam(nil,"cone",minCount, 8) then
            focusedTime = GetTime() + cast.time.focusedAzeriteBeam() + gcdMax
            return
        end
    end
    -- The Unbound Force
    -- the_unbound_force,if=buff.reckless_force.up|buff.reckless_force_counter.stack<10|target.time_to_die<5
    if isChecked("Use Essence") and cast.able.theUnboundForce() and (buff.recklessForce.exists()
        or buff.recklessForceCounter.stack() < 10 or (ttd(units.dyn40) < 5 and useCDs()))
    then
        if cast.theUnboundForce() then return end
    end
    -- Bestial Wrath
    -- bestial_wrath
    if mode.bestialWrath == 1 and cast.able.bestialWrath()
    and (getOptionValue("Bestial Wrath") == 2 or (getOptionValue("Bestial Wrath") == 1 and useCDs()))
    and (ttd(units.dyn40) > 15 or useCDs())
    then
        if cast.bestialWrath() then return end
    end
    -- Kill Command
    -- kill_command
    if cast.able.killCommand() then
        if cast.killCommand() then return end
    end
    -- Chimaera Shot
    -- chimaera_shot
    if cast.able.chimaeraShot() then
        if cast.chimaeraShot() then return end
    end
    -- Dire Beast
    -- dire_beast
    if cast.able.direBeast() then
        if cast.direBeast() then return end
    end
    -- Barbed Shot
    -- barbed_shot,if=pet.cat.buff.frenzy.down&(charges_fractional>1.8|buff.bestial_wrath.up)|cooldown.aspect_of_the_wild.remains<pet.cat.buff.frenzy.duration-gcd&azerite.primal_instincts.enabled|azerite.dance_of_death.rank>1&buff.dance_of_death.down&crit_pct_current>40|target.time_to_die<9
    if cast.able.barbedShot() and ((not buff.frenzy.exists("pet") and (charges.barbedShot.frac() > 1.8 or buff.bestialWrath.exists()))
    or (traits.primalInstincts.active and isChecked("Aspect of the Wild") and useCDs() and cd.aspectOfTheWild.remain() < (buff.frenzy.remain("pet") - gcdMax))
    or (traits.danceOfDeath.rank > 1 and not buff.danceOfDeath.exists() and critChance > 40)
    or (useCDs() and ttd(units.dyn40) < 9))
    then
        if cast.barbedShot() then return end
    end
    -- Purifying Blast
    -- purifying_blast,if=buff.bestial_wrath.down|target.time_to_die<8
    if isChecked("Use Essence") and cast.able.purifyingBlast() and (not buff.bestialWrath.exists() or (ttd(units.dyn40) < 8 and useCDs())) then
        if cast.purifyingBlast("best", nil, 1, 8) then return true end
    end
    -- Blood of the Enemy
    -- blood_of_the_enemy
    if isChecked("Use Essence") and cast.able.bloodOfTheEnemy() then
        if cast.bloodOfTheEnemy() then return end
    end
    -- Barrage
    -- barrage
    if isChecked("A Murder Of Crows / Barrage") and cast.able.barrage() then
        if cast.barrage() then return end
    end
        -- Cobra Shot
        -- cobra_shot,if=(focus-cost+focus.regen*(cooldown.kill_command.remains-1)>action.kill_command.cost|cooldown.kill_command.remains>1+gcd|buff.memory_of_lucid_dreams.up)&cooldown.kill_command.remains>1
    if cast.able.cobraShot() and ((focus - cast.cost.cobraShot() + focusRegen * (cd.killCommand.remain() - 1) > cast.cost.killCommand()
        or cd.killCommand.remain() > 1 + gcdMax or buff.memoryOfLucidDreams.exists()) and cd.killCommand.remain() > 1)
    then
        if cast.cobraShot() then return end
    end
    -- Spitting Cobra
    -- spitting_cobra
    if isChecked("Spitting Cobra") and talent.spittingCobra and cast.able.spittingCobra() then
        if cast.spittingCobra() then return end
    end
    -- Barbed Shot
    -- barbed_shot,if=charges_fractional>1.4
    if cast.able.barbedShot() and charges.barbedShot.frac() > 1.4 then
        if cast.barbedShot() then return end
    end
end -- End Action List - Single Target

-- Action List - Cleave
actionList.Cleave = function()
    -- Barbed Shot
    -- barbed_shot,target_if=min:dot.barbed_shot.remains,if=pet.cat.buff.frenzy.up&pet.cat.buff.frenzy.remains<=gcd.max
    if cast.able.barbedShot(lowestBarbedShot) and (buff.frenzy.exists("pet") and buff.frenzy.remain("pet") <= gcdMax) then
        if cast.barbedShot(lowestBarbedShot) then return end
    end
    -- Multishot
    -- multishot,if=gcd.max-pet.cat.buff.beast_cleave.remains>0.25
    if cast.able.multishot() and (gcdMax - buff.beastCleave.remain("pet") > 0.25)
         and not isExplosive("target")
    then
        if cast.multishot() then return end
    end
    -- Barbeb Shot
    -- barbed_shot,target_if=min:dot.barbed_shot.remains,if=full_recharge_time<gcd.max&cooldown.bestial_wrath.remains
    if cast.able.barbedShot(lowestBarbedShot) and (charges.barbedShot.timeTillFull() < gcdMax and cd.bestialWrath.remain() > gcdMax) then
        if cast.barbedShot(lowestBarbedShot) then return end
    end
    -- Aspect of the Wild
    -- aspect_of_the_wild
    if isChecked("Aspect of the Wild") and useCDs() and cast.able.aspectOfTheWild() and (ttd(units.dyn40) > 15 or useCDs()) then
        if cast.aspectOfTheWild() then return end
    end
    -- Stampede
    -- stampede,if=buff.aspect_of_the_wild.up&buff.bestial_wrath.up|target.time_to_die<15
    if isChecked("Stampede") and talent.stampede and cast.able.stampede()
        and (buff.aspectOfTheWild.exists() and buff.bestialWrath.exists()) and (ttd(units.dyn40) > 15 or useCDs())
    then
        if cast.stampede() then return end
    end
    -- Bestial Wrath
    -- bestial_wrath,if=cooldown.aspect_of_the_wild.remains_guess>20|talent.one_with_the_pack.enabled|target.time_to_die<15
    if mode.bestialWrath == 1 and cast.able.bestialWrath()
        and (getOptionValue("Bestial Wrath") == 2 or (getOptionValue("Bestial Wrath") == 1 and useCDs()))
        and (not isChecked("Aspect of the Wild") or (getOptionValue("Bestial Wrath") == 2 and not useCDs()) or cd.aspectOfTheWild.remains() > 20 or talent.oneWithThePack)
        and (ttd(units.dyn40) > 15 or useCDs())
    then
        if cast.bestialWrath() then return end
    end
    -- Chimaera Shot
    -- chimaera_shot
    if cast.able.chimaeraShot() then
        if cast.chimaeraShot() then return end
    end
    -- A Murder of Crows
    -- a_murder_of_crows
    if isChecked("A Murder Of Crows / Barrage") and mode.murderOfCrows == 1 and cast.able.aMurderOfCrows() then
        if cast.aMurderOfCrows() then return end
    end
    -- Barrage
    -- barrage
    if isChecked("A Murder Of Crows / Barrage") and cast.able.barrage() then
        if cast.barrage() then return end
    end
    -- Kill Command
    -- kill_command,if=active_enemies<4|!azerite.rapid_reload.enabled
    if cast.able.killCommand() and (#enemies.yards8p < 4 or not traits.rapidReload.active) then
        if cast.killCommand() then return end
    end
    -- Dire Beast
    -- dire_beast
    if cast.able.direBeast() then
        if cast.direBeast() then return end
    end
    -- Barbed Shot
    -- barbed_shot,target_if=min:dot.barbed_shot.remains,if=pet.cat.buff.frenzy.down&(charges_fractional>1.8|buff.bestial_wrath.up)|cooldown.aspect_of_the_wild.remains<pet.cat.buff.frenzy.duration-gcd&azerite.primal_instincts.enabled|charges_fractional>1.4|target.time_to_die<9
    if cast.able.barbedShot(lowestBarbedShot) and (not buff.frenzy.exists("pet") and (charges.barbedShot.frac() > 1.8 or buff.bestialWrath.exists())
        or (traits.primalInstincts.active and isChecked("Aspect of the Wild") and useCDs() and cd.aspectOfTheWild.remain() < (buff.frenzy.remain("pet") - gcdMax))
        or (useCDs() and ttd(units.dyn40) < 9))
    then
        if cast.barbedShot(lowestBarbedShot) then return end
    end
    -- Heart Essence
    if isChecked("Use Essence") then
        -- focused_azerite_beam
        if isChecked("Use Essence") and cast.able.focusedAzeriteBeam() and not buff.bestialWrath.exists()
            and (#enemies.yards8f >= 3 or useCDs())
        then
            local minCount = useCDs() and 1 or 3
            if cast.focusedAzeriteBeam(nil,"cone",minCount, 8) then
                focusedTime = GetTime() + cast.time.focusedAzeriteBeam() + gcdMax
                return
            end
        end
        -- purifying_blast
        if cast.able.purifyingBlast() then
            if cast.purifyingBlast("best", nil, 1, 8) then return true end
        end
        -- concentrated_flame
        if cast.able.concentratedFlame() then
            if cast.concentratedFlame() then return end
        end
        -- blood_of_the_enemy
        if cast.able.bloodOfTheEnemy() then
            if cast.bloodOfTheEnemy() then return end
        end
        -- the_unbound_force
        if cast.able.theUnboundForce() then
            if cast.theUnboundForce() then return end
        end
    end
    -- Multishot
    -- multishot,if=azerite.rapid_reload.enabled&active_enemies>2
    if cast.able.multishot() and traits.rapidReload.active and not isExplosive("target") then
        if cast.multishot() then return end
    end
    -- Cobra Shot
    -- cobra_shot,if=cooldown.kill_command.remains>focus.time_to_max&(active_enemies<3|!azerite.rapid_reload.enabled)
    if cast.able.cobraShot() and (cd.killCommand.remain() > ttm and (#enemies.yards8t < 3 or not traits.rapidReload.active)) then
        if cast.cobraShot() then return end
    end
    -- Spitting Cobra
    -- spitting_cobra
    if isChecked("Spitting Cobra") and talent.spittingCobra and cast.able.spittingCobra() then
        if cast.spittingCobra() then return end
    end
end -- End Action List - Cleave

-- Action List - PreCombat
actionList.PreCombat = function()
    if not inCombat and not (IsFlying() or IsMounted()) then
        -- Flask / Crystal
        -- flask,type=flask_of_the_seventh_demon
        if getOptionValue("Elixir") == 1 and inRaid and not buff.flaskOfTheSeventhDemon.exists() and canUseItem(item.flaskOfTheSeventhDemon) then
            if buff.whispersOfInsanity.exists() then buff.whispersOfInsanity.cancel() end
            if buff.felFocus.exists() then buff.felFocus.cancel() end
            if use.flaskOfTheSeventhDemon() then return true end
        end
        if getOptionValue("Elixir") == 2 and not buff.felFocus.exists() and canUseItem(item.repurposedFelFocuser) then
            if buff.flaskOfTheSeventhDemon.exists() then buff.flaskOfTheSeventhDemon.cancel() end
            if buff.whispersOfInsanity.exists() then buff.whispersOfInsanity.cancel() end
            if use.repurposedFelFocuser() then return true end
        end
        if getOptionValue("Elixir") == 3 and not buff.whispersOfInsanity.exists() and canUseItem(item.oraliusWhisperingCrystal) then
            if buff.flaskOfTheSeventhDemon.exists() then buff.flaskOfTheSeventhDemon.cancel() end
            if buff.felFocus.exists() then buff.felFocus.cancel() end
            if use.oraliusWhisperingCrystal() then return true end
        end
        -- Beast Mode
        if (isChecked("Beast Mode")) then
            for k,v in pairs(enemies.yards40nc) do
                TargetUnit(v)
            end
        end
        -- Init Combat
        if getDistance("target") < 40 and isValidUnit("target") and opener.complete then
            -- Auto Shot
            StartAttack()
        end
    end -- End No Combat
    -- Opener
    if actionList.Opener() then return true end
end -- End Action List - PreCombat

----------------
--- ROTATION ---
----------------
local function runRotation()
    --------------------------------------
    --- Load Additional Rotation Files ---
    --------------------------------------
    if actionList.PetManagement == nil then
        loadSupport("PetCuteOne")
        actionList.PetManagement = br.rotations.support["PetCuteOne"]
    end
    --------------
    --- Locals ---
    --------------
    -- BR API
    buff                               = br.player.buff
    cast                               = br.player.cast
    cd                                 = br.player.cd
    charges                            = br.player.charges
    debuff                             = br.player.debuff
    enemies                            = br.player.enemies
    equiped                            = br.player.equiped
    focus                              = br.player.power.focus.amount()
    focusMax                           = br.player.power.focus.max()
    focusRegen                         = br.player.power.focus.regen()
    gcd                                = br.player.gcd
    gcdMax                             = br.player.gcdMax
    has                                = br.player.has
    inCombat                           = br.player.inCombat
    inInstance                         = br.player.instance=="party"
    inRaid                             = br.player.instance=="raid"
    item                               = br.player.items
    level                              = br.player.level
    lowestHP                           = br.friend[1].hp
    mode                               = br.player.mode
    opener                             = br.player.opener
    php                                = br.player.health
    potion                             = br.player.potion
    race                               = br.player.race
    solo                               = #br.friend < 2
    spell                              = br.player.spell
    talent                             = br.player.talent
    traits                             = br.player.traits
    ttm                                = br.player.power.focus.ttm()
    units                              = br.player.units
    use                                = br.player.use

    -- Global Functions
    critChance                         = GetCritChance()
    flying                             = IsFlying()
    healPot                            = getHealthPot()
    lootDelay                          = getOptionValue("LootDelay")
    petCombat                          = UnitAffectingCombat("pet")
    pullTimer                          = PullTimerRemain()
    thp                                = getHP
    ttd                                = getTTD
    haltProfile                        = ((inCombat and profileStop) or (IsMounted() or IsFlying()) or pause() or buff.feignDeath.exists()
                                            or mode.rotation==4 or (cast.current.focusedAzeriteBeam() and GetTime() < focusedTime) or isCastingSpell(293491))

    -- Get Best Unit for Range
    -- units.get(range, aoe)
    units.get(40)

    -- Get List of Enemies for Range
    -- enemies.get(range, from unit, no combat, variable)
    enemies.get(40)
    enemies.get(40,"player",false,true)
    enemies.get(40,"player",true)
    enemies.get(30,"pet")
    enemies.get(20,"pet")
    enemies.get(8,"pet")
    enemies.get(8,"player",false,true)
    enemies.get(8,"target")
    enemies.get(5,"pet")

    -- General Vars
    if isChecked("Spirit Mend") then br.friend:Update() end
    if leftCombat == nil then leftCombat = GetTime() end
    if profileStop == nil or (not inCombat and not UnitExists("target") and profileStop == true) then
        profileStop = false
    end

    -- Profile Specific Vars
    lowestBarbedShot = debuff.barbedShot.lowest(40,"remain")

    -- Opener Reset
    if (not inCombat and not GetObjectExists("target")) or opener.complete == nil then
        opener.count = 0
        opener.OPN1 = false
        opener.AOW1 = false
        opener.BW1 = false
        opener.BS1 = false
        opener.BS2 = false
        opener.KC1 = false
        opener.AOW2 = false
        opener.MOC1 = false
        opener.KC2 = false
        opener.CHS1 = false
        opener.COS1 = false
        opener.KC3 = false
        opener.BS3 = false
        opener.COS2 = false
        opener.KC4 = false
        opener.complete = false
    end

    ---------------------
    --- Begin Profile ---
    ---------------------
    -- Profile Stop | Pause
    if not inCombat and not UnitExists("target") and profileStop then
        profileStop = false
    elseif haltProfile then
        -----------------
        --- Pet Logic ---
        -----------------
        if actionList.PetManagement() then return true end
        if cast.able.playDead() and cast.last.feignDeath() and not buff.playDead.exists("pet") then
            if cast.playDead() then return end
        end
        return true
    else
        -----------------
        --- Pet Logic ---
        -----------------
        if actionList.PetManagement() then return true end
        -----------------------
        --- Extras Rotation ---
        -----------------------
        if actionList.Extras() then return true end
        --------------------------
        --- Defensive Rotation ---
        --------------------------
        if actionList.Defensive() then return true end
        ------------------------------
        --- Out of Combat Rotation ---
        ------------------------------
        if actionList.PreCombat() then return true end
        --------------------------
        --- In Combat Rotation ---
        --------------------------
        if inCombat and isValidUnit("target") and opener.complete then
            ------------------------------
            --- In Combat - Interrupts ---
            ------------------------------
            if actionList.Interrupts() then return true end
            ---------------------------
            --- SimulationCraft APL ---
            ---------------------------
            if getOptionValue("APL Mode") == 1 then
                -- auto_shot
                StartAttack()
                -- call_action_list,name=cds
                if actionList.Cooldowns() then return end
                -- call_action_list,name=st,if=active_enemies<2
                if (mode.rotation == 1 and #enemies.yards8t < getOptionValue("Units To AoE")) or mode.rotation == 3 then
                    if actionList.St() then return end
                end
                -- call_action_list,name=cleave,if=active_enemies>1
                if (mode.rotation == 1 and #enemies.yards8t >= getOptionValue("Units To AoE")) or mode.rotation == 2 then
                    if actionList.Cleave() then return end
                end
            end -- End SimC APL
        end --End In Combat
    end --End Rotation Logic
end -- End runRotation
local id = 253
if br.rotations[id] == nil then br.rotations[id] = {} end
tinsert(br.rotations[id],{
    name = rotationName,
    toggles = createToggles,
    options = createOptions,
    run = runRotation,
})
