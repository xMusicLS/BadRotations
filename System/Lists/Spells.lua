local function flipRace()
    local race = select(2,UnitRace("player"))
    local class = select(3,UnitClass("player"))
    if UnitBuffID("player",193863) then
        if race == "Orc" then
            return "Dwarf"
        elseif race == "Undead" then
            return "Human"
        elseif race == "Troll" then
            if class == 7 then
                return "Draenei" 
            elseif class == 9 then
                return "Human"
            else
                return "NightElf"
            end
        elseif race == "Tauren" then
            if class == 11 then
                return "NightElf"
            else
                return "Draenei"
            end
        elseif race == "BloodElf" then
            if class == 12 then
                return "NightElf"
            else
                return "Human"
            end
        elseif race == "Goblin" then
            if class == 3 or class == 7 then
                return "Dwarf"
            else
                return "Gnome"
            end
        elseif race == "Pandaren" then
            return "Pandaren"
        elseif race == "HighmountainTauren" then
            if class == 11 then
                return "NightElf"
            else
                return "Draenei"
            end
        elseif race == "Nightborne" then
            if class == 9 then
                return "Human"
            else
                return "NightElf"
            end
        elseif race == "MagharOrc" then
            return "DarkIronDwarf"
        end
    elseif UnitBuffID("player", 193864) then
        if race == "Worgen" then
            return "Troll"
        elseif race == "DarkIronDwarf" then
            return "MagharOrc"
        elseif race == "Human" then
            if class == 2 then
                return "BloodElf" 
            else
                return "Undead"
            end
        elseif race == "NightElf" then
            if class == 12 then
                return "BloodElf"
            else
                return "Troll"
            end
        elseif race == "Dwarf" then
            if class == 2 then
                return "Tauren"
            elseif class == 5 then
                return "Undead"
            else
                return "Orc"
            end
        elseif race == "Draenei" then
            if class == 8 then
                return "Orc"
            else
                return "Tauren"
            end
        elseif race == "Pandaren" then
            return "Pandaren"
        elseif race == "Gnome" then
            if class == 10 then
                return "BloodElf"
            else
                return "Goblin"
            end
        elseif race == "VoidElf" then
            if class == 3 or class == 5 or class == 1 then
                return "BloodElf"
            else
                return "Troll"
            end
        elseif race == "LightforgedDraenei" then
            if class == 8 then
                return "Orc"
            else
                return "Tauren"
            end
        end
    end
end

        

        

function getRacial()
    local forTheAlliance = UnitBuffID("player",193863) or false
    local forTheHorde = UnitBuffID("player", 193864) or false
    local race = select(2,UnitRace("player"))
    if forTheAlliance or forTheHorde then
        race = flipRace()
    end
    local BloodElfRacial
    local DraeneiRacial
    local OrcRacial

    if race == "BloodElf" then
        BloodElfRacial = select(7, GetSpellInfo(GetSpellInfo(69179)))
    end
    if race == "Draenei" then
        DraeneiRacial = select(7, GetSpellInfo(GetSpellInfo(28880)))
    end
    if race == "Orc" then
        OrcRacial = select(7, GetSpellInfo(GetSpellInfo(33702)))
    end
    local racialSpells = {
        -- Alliance
        Dwarf    = 20594,           -- Stoneform
        Gnome    = 20589,           -- Escape Artist
        Draenei  = DraeneiRacial,   -- Gift of the Naaru
        Human    = 59752,           -- Every Man for Himself
        NightElf = 58984,           -- Shadowmeld
        Worgen   = 68992,               -- Darkflight
        -- Horde
        BloodElf = BloodElfRacial,  -- Arcane Torrent
        Goblin   = 69041,           -- Rocket Barrage
        Orc      = OrcRacial,       -- Blood Fury
        Tauren   = 20549,           -- War Stomp
        Troll    = 26297,           -- Berserking
        Scourge  = 7744,            -- Will of the Forsaken
        -- Both
        Pandaren = 107079,          -- Quaking Palm
        -- Allied Races
        HighmountainTauren  = 255654, -- Bull Rush
        LightforgedDraenei  = 255647, -- Light's Judgment
        Nightborne          = 260364, -- Arcane Pulse
        VoidElf             = 256948, -- Spatial Rift
        DarkIronDwarf       = 265221, -- Fireblood
        MagharOrc           = 274738, -- Ancestral Call
        ZandalariTroll      = 291944, -- Regeneratin'
        KulTiran            = 287712, -- Haymaker
    }
    return racialSpells[race]
    -- return racialSpells[race]
end
if br.lists == nil then br.lists = {} end
br.lists.spells = {
    DEATHKNIGHT = {
        -- Blood
        [250] = {
            abilities                       = {
                asphyxiate                  = 221562,
                bloodBoil                   = 50842,
                bloodMirror                 = 206977,
                bloodTap                    = 221699,
                blooddrinker                = 206931,
                bonestorm                   = 194844,
                consumption                 = 205223,
                dancingRuneWeapon           = 49028,
                deathAndDecay               = 43265,
                deathsCaress                = 195292,
                gorefiendsGrasp             = 108199,
                heartStrike                 = 206930,
                markOfBlood                 = 206940,
                marrowrend                  = 195182,
                runeTap                     = 194679,
                soulgorge                   = 212744,
                tighteningGrasp             = 206970,
                tombstone                   = 219809,
                vampiricBlood               = 55233,
                iceboundFortitude           = 48792,
            },
            artifacts                       = {
                allConsumingRot             = 192464,
                bloodFeast                  = 192548,
                bonebreaker                 = 192538,
                coagulopathy                = 192460,
                consumption                 = 205223,
                danceOfDarkness             = 192514,
                grimPerseverance            = 192447,
                ironHeart                   = 192450,
                meatShield                  = 192453,
                mouthOfHell                 = 192570,
                rattlingBones               = 192557,
                sanguinaryAffinity          = 221775,
                skeletalShattering          = 192558,
                theHungeringMaw             = 214903,
                umbilicusEternus            = 193213,
                unendingThirst              = 192567,
                veinrender                  = 192457,
            },
            buffs                           = {
                boneShield                  = 195181,
                bloodShield                 = 77535,
                crimsonScourge              = 81136,
                dancingRuneWeapon           = 81256,
                runeTap                     = 194679,
                hemostasis                  = 273947,
                tombstone                   = 219809,
                vampiricBlood               = 55233,
            },
            debuffs                         = {
                asphyxiate                  = 221562,
                blooddrinker                = 206931,
                heartStrike                 = 206930,
                markOfBlood                 = 206940,
            },
            glyphs                          = {

            },
            talents                         = {
                antimagicBarrier            = 205727,
                blooddrinker                = 206931,
                bloodworms                  = 195679,
                bonestorm                   = 194844,
                consumption                 = 274156,
                foulBulwark                 = 206974,
                markOfBlood                 = 206940,
                ossuary                     = 219786,
                purgatory                   = 114556,
                rapidDecomposition          = 194662,
                redThirst                   = 205723,
                runeTap                     = 194679,
                runeStrike                  = 210764,
                tighteningGrasp             = 206970,
                tombstone                   = 219809,
                voracious                   = 273953,
                wraithWalk                  = 212552,
                willOfTheNecropolis         = 206967,
            },
        },
        -- Frost
        [251] = {
            abilities                       = {
                chainsOfIce                 = 45524,
                empowerRuneWeapon           = 47568,
                frostStrike                 = 49143,
                howlingBlast                = 49184,
                obliterate                  = 49020,
                pillarOfFrost               = 51271,
                remorselessWinter           = 196770,
            },
            artifacts                       = {

            },
            buffs                           = {
                breathOfSindragosa          = 155166,
                coldHeart                   = 281210,
                darkSuccor                  = 101568,
                empowerRuneWeapon           = 47568,
                frozenPulse                 = 195750,
                icyCitadel                  = 272723,
                icyTalons                   = 194879,
                killingMachine              = 51124,
                pillarOfFrost               = 51271,
                remorselessWinter           = 196770,
                rime                        = 59052,
            },
            debuffs                         = {
                breathOfSindragosa          = 155166,
                chainsOfIce                 = 45524,
                remorselessWinter           = 196771,
            },
            glyphs                          = {

            },
            talents                         = {
                asphyxiate                  = 108194,
                avalanche                   = 207142,
                blindingSleet               = 207167,
                breathOfSindragosa          = 152279,
                coldHeart                   = 152279,
                deathPact                   = 48743,
                deathsReach                 = 276079,
                frostscythe                 = 207230,
                frostwyrmsFury              = 279302,
                frozenPulse                 = 194909,
                gatheringStorm              = 194912,
                glacialAdvance              = 194913,
                hornOfWinter                = 57330,
                icecap                      = 207126,
                icyTalons                   = 194878,
                inexorableAssault           = 253593,
                murderousEffeciency         = 207061,
                obliteration                = 281238,
                permafrost                  = 207200,
                runicAttenuation            = 207104,
            },
            traits                          = {
                frozenTempest               = 278487,
                icyCitadel                  = 272718,
            }
        },
        -- Unholy
        [252] = {
            abilities                       = {
                apocalypse                  = 275699,
                armyOfTheDead               = 42650,
                chainsOfIce                 = 45524,
                darkTransformation          = 63560,
                deathAndDecay               = 43265,
                deathCoil                   = 47541,
                festeringStrike             = 85948,
                outbreak                    = 77575,
                raiseDead                   = 46584,
                scourgeStrike               = 55090,
                -- Pet Abilities
                claw                        = 47468,
                gnaw                        = 47481,
                huddle                      = 47484,
                hook                        = 212468,
                leap                        = 47482,
            },
            artifacts                       = {

            },
            buffs                           = {
                corpseShield                = 207319,
                darkSuccor                  = 101568,
                darkTransformation          = 63560,
                deathAndDecay               = 188290,
                huddle                      = 91838,
                necrosis                    = 207346,
                soulReaper                  = 215711,
                suddenDoom                  = 49530,
                unholyFrenzy                = 207289,
            },
            debuffs                         = {
                chainsOfIce                 = 45524,
                festeringWound              = 194310,
                -- necroticStrike              = 223829,
                -- outbreak                    = 77575,
                -- scourgeOfWorlds             = 191748,
                soulReaper                  = 130736,
                virulentPlague              = 191587,
            },
            glyphs                          = {

            },
            pets                            = {
                activePet                   = activePet,
                gargoyle                    = 27829,
                risenSkulker                = 99541,
            },
            talents                         = {
                allWillServe                = 194916,
                armyOfTheDead               = 276837,
                asphyxiate                  = 108194,
                burstingSores               = 207264,
                clawingShadows              = 207311,
                deathPact                   = 48743,
                deathsReach                 = 276079,
                defile                      = 152280,
                ebonFever                   = 207269,
                epidemic                    = 207317,
                gripOfTheDead               = 273952,
                harbingerOfDoom             = 276023,
                infectedClaws               = 207272,
                pestilence                  = 277234,
                pestilentPustules           = 194917,
                soulReaper                  = 130736,
                spellEater                  = 207321,
                summonGargoyle              = 49206,
                unholyBlight                = 115989,
                unholyFrenzy                = 207289,
            },
            traits                          = {

            },
        },
        -- All
        Shared = {
            abilities                       = {
                antiMagicShell              = 48707,
                controlUndead               = 111673,
                corpseExploder              = 127344,
                darkCommand                 = 56222,
                deathGate                   = 50977,
                deathGrip                   = 49576,
                deathStrike                 = 49998,
                deathsAdvance               = 48265,
                iceboundFortitude           = 48792,
                mindFreeze                  = 47528,
                pathOfFrost                 = 3714,
                raiseAlly                   = 61999,
            },
            artifacts                       = {

            },
            buffs                           = {
                coldHeartItem               = 235599,
                iceboundFortitude           = 48792,
                pathOfFrost                 = 3714,
                unholyStrength              = 53365,
                wraithWalk                  = 212552,
            },
            debuffs                         = {
                bloodPlague                 = 55078,
                controlUndead               = 111673,
                darkCommand                 = 56222,
                frostBreath                 = 190780,
                frostFever                  = 55095,
                razorice                    = 51714,
            },
            glyphs                          = {

            },
            talents                         = {
                wraithWalk                  = 212552,
            },
        },
    },
    DEMONHUNTER = {
        -- Havoc
        [577] = {
            abilities                       = {
                annihilation                = 201427,
                bladeDance                  = 188499,
                blur                        = 198589,
                chaosNova                   = 179057,
                chaosStrike                 = 162794,
                darkness                    = 196718,
                deathSweep                  = 210152,
                demonsBite                  = 162243,
                eyeBeam                     = 198013,
                felRush                     = 195072,
                metamorphosis               = 191427,
                netherwalk                  = 196555,
                torment                     = 281854,
                throwGlaive                 = 185123,
                vengefulRetreat             = 198793,
            },
            artifacts                       = {

            },
            buffs                           = {
                immolationAura              = 258920,
                metamorphosis               = 162264,
                momentum                    = 208628,
                prepared                    = 203650,
            },
            debuffs                         = {
                darkSlash                   = 258860,
                nemesis                     = 206491,
            },
            glyphs                          = {

            },
            talents                         = {
                blindFury                   = 203550,
                cycleOfHatred               = 258887,
                darkSlash                   = 258860,
                demonBlades                 = 203555,
                demonic                     = 213410,
                demonicAppetite             = 206478,
                desperateInstincts          = 205411,
                felBarrage                  = 258925,
                felEruption                 = 211881,
                felMastery                  = 192939,
                firstBlood                  = 206416,
                immolationAura              = 258920,
                insatiableHunger            = 258876,
                masterOfTheGlaive           = 203556,
                momentum                    = 206476,
                nemesis                     = 206491,
                netherwalk                  = 196555,
                soulRending                 = 204909,
                trailOfRuin                 = 258881,
                unleashedPower              = 206477,
            },
            traits                          = {
                chaoticTransformation       = 288754,
                furiousGaze                 = 273231,
                revolvingBlades             = 279581,
                unboundChaos                = 275144,
            },
        },
        -- Vengeance
        [581] = {
            abilities                       = {
                demonSpikes                 = 203720,
                fieryBrand                  = 204021,
                immolationAura              = 178740,
                infernalStrike              = 189110,
                metamorphosis               = 187827,
                shear                       = 203782,
                sigilOfFlame                = 204596,
                sigilOfMisery               = 207684,
                sigilOfSilence              = 202137,
                soulCleave                  = 228477,
                throwGlaive                 = 204157,
                torment                     = 185245,
            },
            artifacts                       = {

            },
            buffs                           = {
                bladeTurning                = 247254,
                demonSpikes                 = 203819,
                empowerWards                = 218256,
                feastofSouls                = 207693,
                immolationAura              = 178740,
                metamorphosis               = 187827,
                soulFragments               = 203981,
                siphonedPower               = 218561,
            },
            debuffs                         = {
                fieryBrand                  = 207744,
                frailty                     = 247456,
                sigilOfFlame                = 204598,
            },
            glyphs                          = {

            },
            talents                         = {
                abyssalStrike               = 207550,
                agonizingFlames             = 207548,
                burningAlive                = 207739,
                charredFlesh                = 264002,
                concentratedSigils          = 207666,
                fallout                     = 227174,
                feastofSouls                = 207697,
                feedTheDemon                = 218612,
                felDevastation              = 212084,
                flameCrash                  = 227322,
                fracture                    = 263642,
                gluttony                    = 264004,
                lastResort                  = 209258,
                quickenedSigils             = 209281,
                razorSpikes                 = 209400,
                sigilOfChains               = 202138,
                soulBarrier                 = 263648,
                soulRending                 = 217996,
                spiritBomb                  = 247454,
                voidReaver                  = 268175,
            },
        },
        -- All
        Shared = {
            abilities                       = {
                consumeMagic                = 278326,
                disrupt                     = 183752,
                glide                       = 131347,
                imprison                    = 217832,
                spectralSight               = 188501,
            },
            artifacts                       = {

            },
            buffs                           = {
                gazeOfTheLegion             = 193456,
                glide                       = 131347,
            },
            debuffs                         = {

            },
            glyphs                          = {
                glyphOfCracklingFlames      = 219831,
                glyphOfFallowWings          = 220083,
                glyphOfFearsomeMetamorphosis= 220831,
                glyphOfFelTouchedSouls      = 219713,
                glyphOfFelWings             = 220228,
                glyphOfFelEnemies           = 220240,
                glyphOfManaTouchedSouls     = 219744,
                glyphOfShadowEnemies        = 220244,
                glyphOfTatteredWings        = 220226,
            },
            talents                         = {
                felblade                    = 232893,
            },
        },
    },
    DRUID = {
        -- Balance
        [102] = {
            abilities                       = {
                barkskin                    = 22812,
                celestialAlignment          = 194223,
                fullMoon                    = 274283,
                furyOfElune                 = 202770,
                halfMoon                    = 274282,
                innervate                   = 29166,
                lunarStrike                 = 194153,
                newMoon                     = 274281,
                removeCorruption            = 2782,
                solarBeam                   = 78675,
                solarWrath                  = 190984,
                starfall                    = 191034,
                starsurge                   = 78674,
                sunfire                     = 93402,
                stellarFlare                = 202347,
            },
            artifacts                       = {

            },
            buffs                           = {
                blessingOfElune             = 202737,
                blessingOfAnshe             = 202739,
                incarnationChoseOfElune     = 102560,
                celestialAlignment          = 194223,
                onethsOverconfidence        = 209407,
                onethsIntuition             = 209406,
                solarEmpowerment            = 164545,
                lunarEmpowerment            = 164547,
                warriorOfElune              = 202425,
                balanceForm                 = 24858,
                stellarDrift                = 202461,
                emeraldDreamcatcher         = 208190,
                barkskin                    = 22812,
                owlkinFrenzy                = 157228,
                powerOfEluneTheMoonGoddness = 208284,
                sephuzSecret                = 208052,
                astralAcceleration          = 242232,
                newMoonController           = -2027671,
                starLord                    = 279709,
                livelySpirit                = 279279,
                arcanicPulsar               = 287790,
            },
            debuffs                         = {
                stellarFlare                = 202347,
                moonfire                    = 164812,
                sunfire                     = 164815,
                stellarEmpowerment          = 197637,
            },
            glyphs                          = {

            },
            talents                         = {
                feralAffinity               = 202157,
                forceOfNature               = 205636,
                furyOfElune                 = 202770,
                guardianAffinity            = 197491,
                incarnationChoseOfElune     = 102560,
                naturesBalance              = 202430,
                newMoon                     = 274281,
                renewal                     = 108238,
                restorationAffinity         = 197492,
                shootingStars               = 202342,
                soulOfTheForest             = 114107,
                starlord                    = 202345,
                stellarDrift                = 202354,
                stellarFlare                = 202347,
                twinMoons                   = 279620,
                warriorOfElune              = 202425,
            },
            traits                          = {
                arcanicPulsar               = 287773,
                dawningSun                  = 276152,
                highNoon                    = 278505,
                lunarShrapnel               = 278507,
                powerOfTheMoon              = 273367,
                streakingStars              = 272871,
                sunblaze                    = 274397,
            }
        },
        -- Feral
        [103] = {
            abilities                       = {
                berserk                     = 106951,
                maim                        = 22570,
                moonfireFeral               = 155625,
                removeCorruption            = 2782,
                skullBash                   = 106839,
                stampedingRoar              = 106898,
                survivalInstincts           = 61336,
                tigersFury                  = 5217,
            },
            artifacts                       = {

            },
            buffs                           = {
                apexPredator                = 255984,
                berserk                     = 106951,
                bloodtalons                 = 145152,
                clearcasting                = 135700,
                elunesGuidance              = 202060,
                fieryRedMaimers             = 236757,
                incarnationKingOfTheJungle  = 102543,
                ironJaws                    = 276021,
                jungleStalker               = 252071,
                predatorySwiftness          = 69369,
                savageRoar                  = 52610,
                scentOfBlood                = 285646,
                stampedingRoar              = 77764,
                survivalInstincts           = 61336,
                tigersFury                  = 5217,
            },
            debuffs                         = {
                feralFrenzy                 = 274838,
                moonfireFeral               = 155625,
            },
            glyphs                          = {

            },
            talents                         = {
                balanceAffinity             = 197488,
                bloodtalons                 = 155672,
                brutalSlash                 = 202028,
                feralFrenzy                 = 274837,
                guardianAffinity            = 217615,
                incarnationKingOfTheJungle  = 102543,
                lunarInspiration            = 155580,
                momentOfClarity             = 236068,
                predator                    = 202021,
                primalWrath                 = 285381,
                renewal                     = 108238,
                restorationAffinity         = 197492,
                sabertooth                  = 202031,
                savageRoar                  = 52610,
                scentOfBlood                = 285564,
                soulOfTheForest             = 158476,
            },
            traits                          = {
                bloodMist                   = 279524,
                ironJaws                    = 276021,
                twistedClaws                = 275906,
                wildFleshrending            = 279527,
            }
        },
        -- Guardian
        [104] = {
            abilities                       = {
                barkskin                    = 22812,
                incapacitatingRoar          = 99,
                incarnationGuardianOfUrsoc  = 102558,
                maul                        = 6807,
                removeCorruption            = 2782,
                skullBash                   = 106839,
                stampedingRoar              = 106898,
                survivalInstincts           = 61336,
            },
            artifacts                       = {

            },
            buffs                           = {
                galacticGuardian            = 213708,
                goryFur                     = 201671,
                incarnationGuardianOfUrsoc  = 102558,
                pulverize                   = 158792,
                survivalInstincts           = 61336,
            },
            debuffs                         = {
                moonfireGuardian            = 164812,
            },
            glyphs                          = {

            },
            talents                         = {
                balanceAffinity             = 197488,
                bloodFrenzy                 = 203962,
                brambles                    = 203953,
                bristlingFur                = 155835,
                earthwarden                 = 203974,
                feralAffinity               = 202155,
                galacticGuardian            = 203964,
                guardianOfElune             = 155578,
                incarnationGuardianOfUrsoc  = 102558,
                lunarBeam                   = 204066,
                pulverize                   = 80313,
                rendAndTear                 = 204053,
                restorationAffinity         = 197492,
                soulOfTheForest             = 158477,
                survivalOfTheFittest        = 203965,
            },
            traits                          = {
                layeredMane                 = 279552,
                twistedClaws                = 275906,
            },
        },
        -- Restoration
        [105] = {
            abilities                       = {
                barkskin                    = 22812,
                efflorescence               = 145205,
                innervate                   = 29166,
                ironbark                    = 102342,
                lifebloom                   = 33763,
                naturesCure                 = 88423,
                revitalize                  = 212040,
                solarWrath                  = 5176,
                sunfire                     = 93402,
                tranquility                 = 740,
                ursolsVortex                = 102793,
                yserasGift                  = 145108,
            },
            artifacts                       = {

            },
            buffs                           = {
                abundance                   = 207640,
                cenarionWard                = 102352,
                clearcasting                = 16870,
                incarnationTreeOfLife       = 33891,
                innervate                   = 29166,
                rejuvenationGermination     = 155777,
                lifebloom                   = 33763,
                lunarEmpowerment            = 164547,
                regrowth                    = 8936,
                solarEmpowerment            = 164545,
                soulOfTheForest             = 114108,
                cultivat                    = 200389,
                tranquility                 = 157982,
                springblossom               = 207386,
                symbolOfHope                = 64901,
                fullbloom                   = 290213,
            },
            debuffs                         = {
                moonfire                    = 164812,
                sunfire                     = 164815,
            },
            glyphs                          = {

            },
            talents                         = {
                abundance                   = 207383,
                balanceAffinity             = 197632,
                cenarionWard                = 102351,
                cultivation                 = 200390,
                feralAffinity               = 197490,
                flourish                    = 197721,
                germination                 = 155675,
                guardianAffinity            = 197491,
                incarnationTreeOfLife       = 33891,
                innerPeace                  = 197073,
                photosynthesis              = 274902,
                prosperity                  = 200383,
                renewal                     = 108238,
                soulOfTheForest             = 158478,
                springBlossoms              = 207385,
                stonebark                   = 197061,
            },
        },
        -- All
        Shared = {
            abilities                       = {
                bearForm                    = 5487,
                catForm                     = 768,
                dash                        = 1850,
                dreamwalk                   = 193753,
                entanglingRoots             = 339,
                ferociousBite               = 22568,
                frenziedRegeneration        = 22842,
                growl                       = 6795,
                hibernate                   = 2637,
                ironfur                     = 192081,
                lunarStrikeAff              = 197628,
                mangle                      = 33917,
                moonfire                    = 8921,
                moonkinForm                 = 197625,
                prowl                       = 5215,
                rake                        = 1822,
                rebirth                     = 20484,
                regrowth                    = 8936,
                rejuvenation                = 774,
                revive                      = 50769,
                rip                         = 1079,
                shadowmeld                  = 58984,
                shred                       = 5221,
                solarWrathMoonkin           = 197629,
                soothe                      = 2908,
                starsurgeAff                = 197626,
                sunfireMoonkin              = 197630,
                swiftmend                   = 18562,
                swipeBear                   = 213771,
                swipeCat                    = 106785,
                thrashBear                  = 77758,
                thrashCat                   = 106830,
                travelForm                  = 783,
                wildGrowth                  = 48438,
            },
            artifacts                       = {

            },
            buffs                           = {
                bearForm                    = 5487,
                burningEssence              = 138927,
                catForm                     = 768,
                dash                        = 1850,
                tigerDash                   = 252216,
                flightForm                  = 165962,
                frenziedRegeneration        = 22842,
                ironfur                     = 192081,
                moonkinForm                 = 197625,
                prowl                       = 5215,
                rejuvenation                = 774,
                shadowmeld                  = 58984,
                stagForm                    = 210053,
                travelForm                  = 783,
                wildGrowth                  = 48438,
            },
            debuffs                         = {
                entanglingRoots             = 339,
                growl                       = 6795,
                hibernate                   = 2637,
                moonfire                    = 8921,
                rake                        = 155722,
                rip                         = 1079,
                thrashBear                  = 192090,
                thrashCat                   = 106830,
            },
            glyphs                          = {
                glyphOfTheCheetah           = 131113,
                glyphOfTheDoe               = 224122,
                glyphOfTheFeralChameleon    = 210333,
                glyphOfTheOrca              = 114333,
                glyphOfTheSentinel          = 219062,
                glyphOfTheUrsolChameleon    = 107059,
            },
            talents                         = {
                massEntanglement            = 102359,
                mightyBash                  = 5211,
                tigerDash                   = 252216,
                typhoon                     = 132469,
                wildCharge                  = 102401,
            },
            traits                          = {
                livelySpirit                = 279642,
            },
        },
    },
    HUNTER = {
        -- BeastMastery
        [253] = {
            abilities                       = {
                aMurderOfCrows              = 131894,
                aspectOfTheWild             = 193530,
                barbedShot                  = 217200,
                barrage                     = 120360,
                bestialWrath                = 19574,
                berserking                  = 26297,
                bindingShot                 = 109248,
                chimaeraShot                = 53209,
                cobraShot                   = 193455,
                concussiveShot              = 5116,
                counterShot                 = 147362,
                direBeast                   = 120679,
                disengage                   = 781,
                intimidation                = 19577,
                killCommand                 = 34026,
                misdirection                = 34477,
                multishot                   = 2643,
                spittingCobra               = 194407,
                stampede                    = 201430,
                titansThunder               = 207068,
                volley                      = 194386
            },
            artifacts                       = {

            },
            buffs                           = {
                aspectOfTheWild             = 193530,
                beastCleave                 = 118455,
                berserking                  = 26297,
                bestialWrath                = 19574,
                danceOfDeath                = 274443,
                direBeast                   = 120694,
                frenzy                      = 272790,
                parselsTongue               = 248084,
                spittingCobra               = 194407,
                volley                      = 194386
            },
            debuffs                         = {
                barbedShot                  = 217200,
            },
            glyphs                          = {

            },
            talents                         = {
                aMurderOfCrows              = 131894,
                aspectOfTheBeast            = 191384,
                barrage                     = 120360,
                chimaeraShot                = 53209,
                direBeast                   = 120679,
                spittingCobra               = 194407,
            },
            traits                          = {
                danceOfDeath                = 274441,
                primalInstincts             = 279806,
                rapidReload                 = 278530,
            },
        },
        -- Marksmanship
        [254] = {
            abilities                       = {
                aimedShot                   = 19434,
                arcaneShot                  = 185358,
                burstingShot                = 186387,
                concussiveShot              = 5116,
                counterShot                 = 147362,
                multishot                   = 257620,
                rapidFire                   = 257044,
                serpentSting                = 271788,
                steadyShot                  = 56641,
                trueshot                    = 193526,
            },
            artifacts                       = {
            },
            buffs                           = {
                doubleTap                   = 260402,
                feignDeath                  = 5384,
                lethalShots                 = 260395,
                lockAndLoad                 = 194594,
                masterMarksman              = 269576,
                preciseShots                = 260242,
                steadyFocus                 = 193534,
                trickShots                  = 257622,
                trueshot                    = 288613,
                unerringVision              = 274447,

            },
            debuffs                         = {
                aMurderOfCrows              = 131894,
                huntersMark                 = 257284,
                serpentSting                = 271788,
            },
            glyphs                          = {

            },
            talents                         = {
                barrage                     = 120360,
                callingTheShots             = 260404,
                carefulAim                  = 260228,
                doubleTap                   = 260402,
                explosiveShot               = 212431,
                huntersMark                 = 257284,
                lethalShots                 = 260393,
                lockAndLoad                 = 194595,
                masterMarksman              = 260309,
                piercingShot                = 198670,
                serpentSting                = 271788,
                steadyFocus                 = 193533,
                streamline                  = 260367,
                volley                      = 260243,
            },
            traits                          = {
                focusedFire                 = 278531,
                inTheRhythm                 = 264198,
                rapidReload                 = 278530,
                steadyAim                   = 277651,
                surgingShots                = 287707,
                unerringVision              = 274444,
            },
        },
        -- Survival
        [255] = {
            abilities                       = {
                aspectOfTheEagle            = 186289,
                butchery                    = 212436,
                carve                       = 187708,
                chakrams                    = 259391,
                coordinatedAssault          = 266779,
                flankingStrike              = 269751,
                harpoon                     = 190925,
                killCommand                 = 259489,
                mongooseBite                = 259387,
                muzzle                      = 187707,
                pheromoneBomb               = 270323,
                raptorStrike                = 186270,
                serpentSting                = 259491,
                shrapnelBomb                = 270335,
                steelTrap                   = 162488,
                volatileBomb                = 271045,
                wildfireBomb                = 259495,
                wingClip                    = 195645,
            },
            artifacts                       = {

            },
            buffs                           = {
                aspectOfTheEagle            = 186289,
                blurOfTalons                = 277969,
                coordinatedAssault          = 266779,
                exposedFlank                = 252094, -- Tier 21
                mongooseFury                = 259388,
                tipOfTheSpear               = 260286,
                vipersVenom                 = 268552,
            },
            debuffs                         = {
                bloodseeker                 = 259277,
                internalBleeding            = 270343,
                latentPoison                = 273286,
                serpentSting                = 259491,
                shrapnelBomb                = 270339,
                wildfireBomb                = 269747,
            },
            glyphs                          = {

            },
            talents                         = {
                alphaPredator               = 269737,
                birdsOfPrey                 = 260331,
                bloodseeker                 = 260248,
                butchery                    = 212436,
                chakrams                    = 259391,
                flankingStrike              = 269751,
                guerrillaTactics            = 264332,
                hydrasBite                  = 260241,
                mongooseBite                = 259387,
                steelTrap                   = 162488,
                termsOfEngagement           = 265895,
                tipOfTheSpear               = 260285,
                vipersVenom                 = 268501,
                wildfireInfusion            = 271014,
            },
            traits                          = {
                blurOfTalons                = 277653,
                latentPoison                = 273283,
                primevalIntuition           = 288570,
                upCloseAndPersonal          = 278533,
                venomousFangs               = 274590,
                wildernessSurvival          = 279589,
            }
        },
        -- All
        Shared = {
            abilities                       = {
                aMurderOfCrows              = 131894,
                aspectOfTheCheetah          = 186257,
                aspectOfTheTurtle           = 186265,
                bindingShot                 = 109248,
                bite                        = 17253,
                callPet1                    = 883,
                callPet2                    = 83242,
                callPet3                    = 83243,
                callPet4                    = 83244,
                callPet5                    = 83245,
                --pet Purges
                spiritShock                 = 264265,
                chiJiTranq                  = 264028,
                naturesGrace                = 264266,
                netherShock                 = 264264,
                sonicBlast                  = 264263,
                soothingWater               = 264262,
                sporeCloud                  = 264056,
                survivalOfTheFittest        = 264735,

                camouflage                  = 199483,
                catlikeReflexes             = 263892,
                claw                        = 16827,
                dash                        = 61684,
                disengage                   = 781,
                dismissPet                  = 2641,
                eagleEye                    = 6197,
                exhilaration                = 109304,
                feignDeath                  = 5384,
                flare                       = 1543,
                freezingTrap                = 187650,
                growl                       = 2649,
                heartOfThePhoenix           = 55709,
                intimidation                = 19577,
                mendPet                     = 136,
                misdirection                = 34477,
                playDead                    = 209997,
                prowl                       = 24450,
                revivePet                   = 982,
                smack                       = 49966,
                spiritmend                  = 90361,
                spiritWalk                  = 90328,
                tarTrap                     = 187698,
                wakeUp                      = 210000,
            },
            artifacts                       = {

            },
            buffs                           = {
                aspectOfTheTurtle           = 186265,
                feignDeath                  = 5384,
                mendPet                     = 136,
                playDead                    = 209997,
                prowl                       = 24450,
                spiritWalk                  = 90328,
            },
            debuffs                         = {
                bestialFerocity             = 191413,
            },
            glyphs                          = {

            },
            pets                            = {
                activePet                   = activePet,
            },
            talents                         = {
                aMurderOfCrows              = 131894,
                bindingShot                 = 109248,
                bornToBeWild                = 266921,
                camouflage                  = 199483,
                naturalMending              = 270581,
                posthaste                   = 109215,
                trailblazer                 = 199921,
            },
        },
    },
    MAGE = {
        -- Arcane
        [62] = {
            abilities                       = {
                arcaneBarrage               = 44425,
                arcaneBlast                 = 30451,
                arcaneExplosion             = 1449,
                arcaneFamiliar              = 205022,
                arcaneMissiles              = 5143,
                arcaneOrb                   = 153626,
                arcanePower                 = 12042,
                chargedUp                   = 205032,
                displacement                = 212801,
                erosion                     = 205039,
                evocation                   = 12051,
                greaterInvisibility         = 110959,
                markOfAluneth               = 224968,
                netherTempest               = 114923,
                presenceOfMind              = 205025,
                prismaticBarrier            = 235450,
                slow                        = 31589,
                supernova                   = 157980,
            },
            artifacts                       = {
                aegwynnsAscendance          = 187680,
                aegwynnsFury                = 187287,
                aegwynnsInperative          = 187264,
                aegwynnsIntensity           = 238054,
                aegwynnsWrath               = 187321,
                alunethsAvarice             = 238090,
                ancientPower                = 214917,
                arcanePurification          = 187313,
                arcaneRebound               = 188006,
                blastingRod                 = 187258,
                cracklingEnergy             = 187310,
                etherealSensitivity         = 187276,
                everywhereAtOnce            = 187301,
                forceBarrier                = 210716,
                intensityOfTheTirisgarde    = 241121,
                markOfAluneth               = 224968,
                mightOfTheGuardians         = 187318,
                ruleOfThrees                = 215463,
                sloooowDown                 = 210730,
                timeAndSpace                = 238126,
                torrentialBarrage           = 187304,
                touchOfTheMagi              = 210725,
            },
            buffs                           = {
              arcaneFamiliar                = 210126,
              arcanePower                   = 12042,
              -- arcaneCharge                  = 36032,
              arcaneMissles                 = 79683,
              presenceOfMind                = 205025,
              rhoninsAssaultingArmwraps     = 208081,
              ruleOfThrees                  = 264774,
              brainStorm                    = 273330,
              clearcasting                  = 263725,
            },
            debuffs                         = {
              arcaneCharge                  = 36032,
              netherTempest                 = 114923,

            },
            glyphs                          = {

            },
            talents                         = {
                amplification               = 236628,
                arcaneFamiliar              = 205022,
                arcaneOrb                   = 153626,
                chargedUp                   = 205032,
                chronoShift                 = 235711,
                --erosion                     = 205039,
                manaShield                  = 235463,
                netherTempest               = 114923,
                overpowered                 = 155147,
                resonance                   = 205028,
                slipstream                  = 236457,
                supernova                   = 157980,
                --temporalFlux                = 234302,
                --wordsOfPower                = 205035,
            },
            traits                         = {
                anomalousImpact             = 279867,
                arcanePressure              = 274594,
                arcanePummeling             = 270669,
                brainStorm                  = 273326,
                explosiveEcho               = 278537,
                galvanizingSpark            = 278536,
            },
        },
        -- Fire
        [63] = {
            abilities                       = {
                blazingBarrier              = 235313,
                blastWave                   = 157981,
                cinderstorm                 = 198929,
                combustion                  = 190319,
                dragonsBreath               = 31661,
                fireball                    = 133,
                fireBlast                   = 108853,
                flameOn                     = 205029,
                flamestrike                 = 2120,
                livingBomb                  = 44457,
                meteor                      = 153561,
                phoenixsFlames              = 257541,
                pyroblast                   = 11366,
                scorch                      = 2948,
            },
            artifacts                       = {
                aftershocks                 = 194431,
                phoenixReborn               = 215773,
            },
            buffs                           = {
                blazingBarrier              = 235313,
                blasterMaster               = 274598,
                combustion                  = 190319,
                heatingUp                   = 48107,
                hotStreak                   = 48108,
                iceFloes                    = 108839,
                kaelthasUltimateAbility     = 209455,
                preheat                     = 273333,
                pyroclasm                   = 269651,
            },
            debuffs                         = {
                meteorBurn                  = 155158,

            },
            glyphs                          = {

            },
            talents                         = {
                alexstraszasFury            = 235870,
                blastWave                   = 157981,
                --cinderstorm                 = 198929,
                conflagration               = 205023,
                --controlledBurn              = 205033,
                firestarter                 = 205026,
                flameOn                     = 205029,
                flamePatch                  = 205037,
                kindling                    = 155148,
                livingBomb                  = 44457,
                meteor                      = 153561,
                mirrorImage                 = 55342,
                phoenixsFlames              = 257541,
                pyromaniac                  = 205020,
                pyroclasm                   = 269650,
                searingTouch                = 269644,
            },
            traits                          = {
                preheat                     = 273332,
                blasterMaster               = 274596,
            }
        },
        -- Frost
        [64] = {
            abilities                       = {
                blizzard                    = 190356,
                coldSnap                    = 235219,
                coneOfCold                  = 120,
                fireBlast                   = 108853,
                flurry                      = 44614,
                freeze                      = 231596,
                frostbolt                   = 116,
                frostBomb                   = 112948,
                frozenOrb                   = 84714,
                frozenTouch                 = 205030,
                iceBarrier                  = 11426,
                iceFloes                    = 108839,
                iceLance                    = 30455,
                iceNova                     = 157997,
                icyVeins                    = 12472,
                petFreeze                   = 33395,
                rayOfFrost                  = 205021,
                removeCurse                 = 475,
                summonWaterElemental        = 31687,
                waterbolt                   = 31707,
            },
            artifacts                       = {
               -- icyHand                     = 220817,
            },
            buffs                           = {
                brainFreeze                 = 190446,
                freezingRain                = 270232,
                frostBomb                   = 112948,
                fingersOfFrost              = 44544,
                icyVeins                    = 12472,
                chainReaction               = 195418,
                zannesuJourney              = 226852,
                timeWarp                    = 80353,
                iceFloes                    = 108839,
                iceBarrier                  = 11426,
                icicles                     = 205473,
                frozenMass                  = 242253,
            },
            debuffs                         = {
                chainsOfIce                 = 65173,
                chilled                     = 205708,
                frostBomb                   = 112948,
                frostNova                   = 122,
                iceNova                     = 157997,
                wintersChill                = 228358,
            },
            glyphs                          = {

            },
            talents                         = {
                --articGale                   = 205038,
                boneChilling                = 205027,
                cometStorm                  = 153595,
                ebonbolt                    = 257537,
                --frostBomb                   = 112948,
                frozenTouch                 = 205030,
                glacialSpike                = 199786,
                iceNova                     = 157997,
                iceFloes                    = 108839,
                lonelyWinter                = 205024,
                rayOfFrost                  = 205021,
                splittingIce                = 56377,
                thermalVoid                 = 155149,
            },
        },
        -- All
        Shared = {
            abilities                       = {
                arcaneIntellect             = 1459,
                blink                       = 1953,
                counterspell                = 2139,
                frostNova                   = 122,
                iceBlock                    = 45438,
                invisibility                = 66,
                mirrorImage                 = 55342,
                polymorph                   = 118,
                ringOfFrost                 = 113724,
                runeOfPower                 = 116011,
                --shimmer                     = 212653,
                slowFall                    = 130,
                spellsteal                  = 30449,
                timeWarp                    = 80353,
                waterJet                    = 135029,
            },
            artifacts                       = {

            },
            buffs                           = {
                arcaneIntellect             = 1459,
                incantersFlow               = 1463,
                runeOfPower                 = 116014,
            },
            debuffs                         = {

            },
            glyphs                          = {

            },
            talents                         = {
                incantersFlow               = 1463,
                iceWard                     = 205036,
                mirrorImage                 = 55342,
                ringOfFrost                 = 113724,
                runeOfPower                 = 116011,
                shimmer                     = 212653,
                --unstableMagic               = 157976,
            },
        },
    },
    MONK = {
        -- Brewmaster
        [268] = {
            abilities                       = {
                blackoxBrew                 = 115399,
                blackOxStatue               = 115315,
                blackoutStrike              = 205523,
                breathOfFire                = 115181,
                chiBurst                    = 123986,
                chiWave                     = 115098,
                detox                       = 218164,
                effuse                      = 116694,
                expelHarm                   = 115072,
                explodingKeg                = 214326,
                fortifyingBrew              = 115203,
                guard                       = 115295,
                healingElixir               = 122281,
                ironskinBrew                = 115308,
                kegSmash                    = 121253,
                purifyingBrew               = 119582,
                rushingJadeWind             = 116847,
                spearHandStrike             = 116705,
                provoke                     = 115546,
                invokeNiuzao                = 132578,
                zenMeditation               = 115176,
            },
            artifacts                       = {

            },
            buffs                           = {
                ironskinBrew                = 215479,
                blackoutCombo               = 228563,
                rushingJadeWind             = 116847,
                zenMeditation               = 115176,
            },
            debuffs                         = {
                breathOfFire                = 146222,
                moderateStagger             = 124274,
                heavyStagger                = 124273,
                kegSmash                    = 121253,

            },
            glyphs                          = {

            },
            talents                         = {
                blackoutCombo               = 196736,
                blackoxBrew                 = 115399,
                guard                       = 115295,
                rushingJadeWind             = 116847,
            },
        },
        -- Mistweaver
        [270] = {
            abilities                       = {
                blackoutKick                = 100784,
                chiBurst                    = 123986,
                zenPulse                    = 124081,
                mistwalk                    = 197945,
                chiTorpedo                  = 115008,
                tigersLust                  = 116841,
                cracklingJadeLightning      = 117952,
                detox                       = 115450,
                effuse                      = 116694,
                envelopingMist              = 124682,
                essenceFont                 = 191837,
                healingElixir               = 122281,
                diffuseMagic                = 122783,
                dampenHarm                  = 122278,
                invokeChiJi                 = 198664,
                refreshingJadeWind          = 196725,
                summonJadeSerpentStatue     = 115313,
                legSweep                    = 119381,
                ringOfPeace                 = 116844,
                songOfChiJi                 = 198898,
                lifeCocoon                  = 116849,
                paralysis                   = 115078,
                provoke                     = 115546,
                reawaken                    = 212051,
                renewingMist                = 115151,
                resuscitate                 = 115178,
                revival                     = 115310,
                risingSunKick               = 107428,
                roll                        = 109132,
                sheilunsGift                = 205406,
                spinningCraneKick           = 101546,
                thunderFocusTea             = 116680,
                tigerPalm                   = 100780,
                manaTea                     = 197908,
                transcendence               = 101643,
                transcendenceTransfer       = 119996,
                soothingMist                = 115175,
                chiWave                     = 115098,
                fortifyingBrew              = 243435,
                surgingMist                 = 227344,
            },
            artifacts                       = {
            },
            buffs                           = {
                soothingMist                = 115175,
                renewingMist                = 119611,
                envelopingMist              = 124682,
                thunderFocusTea             = 116680,
                lifeCyclesEnvelopingMist    = 197919,
                lifeCyclesVivify            = 197916,
                surgeOfMist                 = 246328,
                danceOfMist                 = 247891,
                upliftTrance                = 197206,
                refreshingJadeWind          = 196725,
                lifeCocoon                  = 116849,
                transcendence               = 101643,
                tigersLust                  = 116841,
                teachingsOfTheMonastery     = 202090,
                diffuseMagic                = 122783,
                dempenHarm                  = 122278,
                innervate                   = 29166,
                symbolOfHope                = 64901,
                essenceFont                 = 191837,
                manaTea                     = 197908,
                wayOfTheCrane               = 216113,
            },
            debuffs                         = {
            },
            glyphs                          = {
            },
            talents                         = {
                chiBurst                    = 123986,
                chiWave                     = 115098,
                chiTorpedo                  = 115008,
                tigersLust                  = 116841,
                mistWrap                    = 197900,
                spiritOfTheCrane            = 210802,
                ringOfPeace                 = 116844,
                songOfChiJi                 = 198898,
                healingElixir               = 122281,
                diffuseMagic                = 122783,
                dampenHarm                  = 122278,
                refreshingJadeWind          = 196725,
                invokeChiJiTheRedCrane      = 198664,
                summonJadeSerpentStatue     = 115313,
                manaTea                     = 197908,
                diffuseMagic                = 122783,
                upwelling                   = 274963,
                lifecycles                  = 197915,
            },
        },
        -- Windwalker
        [269] = {
            abilities                       = {
                chiWave                     = 115098,
                detox                       = 218164,
                disable                     = 116095,
                fistsOfFury                 = 113656,
                flyingSerpentKick           = 101545,
                flyingSerpentKickEnd        = 115057,
                risingSunKick               = 107428,
                spearHandStrike             = 116705,
                spinningCraneKick           = 101546,
                stormEarthAndFire           = 137639,
                stormEarthAndFireFixate     = 221771,
                touchOfDeath                = 115080,
                touchOfKarma                = 122470,
                transcendence               = 101643,
                transcendenceTransfer       = 119996,
            },
            artifacts                       = {

            },
            buffs                           = {
                hitCombo                    = 196741,
                pressurePoint               = 247255,
                rushingJadeWind             = 116847,
                serenity                    = 152173,
                stormEarthAndFire           = 137639,
                swiftRoundhouse             = 278710,
                theEmperorsCapacitor        = 235054,
                touchOfKarma                = 122470,
                transcendence               = 101643,
                transferThePower            = 195321,
            },
            debuffs                         = {
                markOfTheCrane              = 228287,
                risingFist                  = 242259,
                touchOfDeath                = 115080,
            },
            glyphs                          = {
                glyphOfRisingTigerKick      = 125151,
            },
            talents                         = {
                ascension                   = 115396,
                diffuseMagic                = 122783,
                energizingElixir            = 115288,
                eyeOfTheTiger               = 196607,
                fistOfTheWhiteTiger         = 261947,
                goodKarma                   = 280195,
                hitCombo                    = 196740,
                innerStrength               = 261767,
                invokeXuenTheWhiteTiger     = 123904,
                rushingJadeWind             = 116847,
                serenity                    = 152173,
                spiritualFocus              = 280197,
                whirlingDragonPunch         = 152175,
            },
            traits                          = {
                swiftRoundhouse             = 277669,
            }
        },
        -- All
        Shared = {
            abilities                       = {
                blackoutKick                = 100784,
                chiBurst                    = 123986,
                chiTorpedo                  = 115008,
                cracklingJadeLightning      = 117952,
                dampenHarm                  = 122278,
                diffuseMagic                = 122783,
                legSweep                    = 119381,
                paralysis                   = 115078,
                provoke                     = 115546,
                resuscitate                 = 115178,
                ringOfPeace                 = 116844,
                roll                        = 109132,
                tigersLust                  = 116841,
                tigerPalm                   = 100780,
                vivify                      = 116670,
            },
            artifacts                       = {

            },
            buffs                           = {
                blackoutKick                = 116768,
                danceOfChiJi                = 286587,
                dampenHarm                  = 122278,
                diffuseMagic                = 122783,
            },
            debuffs                         = {

            },
            glyphs                          = {

            },
            talents                         = {
                celerity                    = 115173,
                chiBurst                    = 123986,
                chiTorpedo                  = 115008,
                chiWave                     = 115098,
                dampenHarm                  = 122278,
                ringOfPeace                 = 116844,
                tigerTailSweep              = 264348,
                tigersLust                  = 116841,
            },
        },
    },
    PALADIN = {
        -- Holy
        [65] = {
            abilities                       = {
                absolution                  = 212056,
                auraMastery                 = 31821,
                beaconOfLight               = 53563,
                blessingOfSacrifice         = 6940,
                cleanse                     = 4987,
                consecration                = 26573,
                divineProtection            = 498,
                holyLight                   = 82326,
                holyShock                   = 20473,
                judgment                    = 275773,
                lightOfDawn                 = 85222,
                lightOfTheMartyr            = 183998,
            },
            artifacts                       = {

            },
            buffs                           = {
                auraOfMercy                 = 183415,
                auraMastery                 = 31821,
                avengingWrath               = 31884,
                beaconOfLight               = 53563,
                beaconOfFaith               = 156910,
                blessingOfSacrifice         = 6940,
                beaconOfVirtue              = 200025,
                bestowFaith                 = 223306,
                glimmerOfLight              = 287280,
                divineProtection            = 498,
                divinePurpose               = 216411,
                ferventMartyr               = 223316,
                infusionOfLight             = 54149,
                holyAvenger                 = 105809,
                ruleOfLaw                   = 214202,
                theLightSaves               = 200423,
                vindicator                  = 200376,
                avengingCrusader            = 216331,
                symbolOfHope                = 64901,
            },
            debuffs                         = {
                judgement                   = 214222,
                judgmentoflight             = 196941,
                glimmerOfLight              = 287280,

            },
            glyphs                          = {

            },
            talents                         = {
                auraOfMercy                 = 183415,
                auraOfSacrifice             = 183416,
                avengingCrusader            = 216331,
                awakening                   = 248033,
                beaconOfFaith               = 156910,
                beaconOfVirtue              = 200025,
                bestowFaith                 = 223306,
                crusadersMight              = 196926,
                devotionAura                = 183425,
                divinePurpose               = 197646,
                fistOfJustice               = 198054,
                holyAvenger                 = 105809,
                holyPrism                   = 114165,
                judgmentOfLight             = 183778,
                lightsHammer                = 114158,
                ruleOfLaw                   = 214202,
                sanctifiedWrath             = 53376,
            },
            traits                          = {
                breakingDawn                = 278594,
                graceoftheJusticar          = 278593,
            },
        },
        -- Protection
        [66] = {
            abilities                       = {
                ardentDefender              = 31850,
                avengersShield              = 31935,
                blessingOfSacrifice         = 6940,
                cleanseToxins               = 213644,
                consecration                = 26573,
                divineProtection            = 498,
                guardianOfAncientKings      = 86659,
                hammerOfTheRighteous        = 53595,
                judgment                    = 275779,
                lightOfTheProtector         = 184092,
                rebuke                      = 96231,
                righteousFury               = 25780,
                shieldOfTheRighteous        = 53600,
            },
            artifacts                       = {

            },
            buffs                           = {
                ardentDefender              = 31850,
                avengingWrath               = 31884,
                bulwarkOfOrder              = 209388,
                consecration                = 188370,
                divineShield                = 642,
                guardianOfAncientKings      = 86659,
                seraphim                    = 152262,
                shieldOfTheRighteous        = 132403,
                avengersValor               = 197561,
            },
            debuffs                         = {
                blessedHammer               = 204301,
                judgmentOfLight             = 196941,
            },
            glyphs                          = {

            },
            talents                         = {
                aegisOfLight                = 204150,
                bastionOfLight              = 204035,
                blessedHammer               = 204019,
                blessingOfSpellwarding      = 204018,
                consecratedGround           = 204054,
                crusadersJudgment           = 204023,
                finalStand                  = 204077,
                firstAvenger                = 203776,
                fistOfJustice               = 198054,
                handOfTheProtector          = 213652,
                holyShield                  = 152261,
                judgmentOfLight             = 183778,
                lastDefender                = 203791,
                redoubt                     = 280373,
                retributionAura             = 203797,
                righteousProtector          = 204074,
                seraphim                    = 152262,
            },
            traits                          = {
                bulwarkOfLight              = 272976,
            },
        },
        -- Retribution
        [70] = {
            abilities                       = {
                bladeOfJustice              = 184575,
                cleanseToxins               = 213644,
                divineStorm                 = 53385,
                greaterBlessingOfKings      = 203538,
                greaterBlessingOfWisdom     = 203539,
                handOfHinderance            = 183218,
                judgment                    = 20271,
                rebuke                      = 96231,
                shieldOfVengeance           = 184662,
                templarsVerdict             = 85256,
            },
            artifacts                       = {

            },
            buffs                           = {
                avengingWrath               = 31884,
                crusade                     = 231895,
                divinePurpose               = 223819,
                divineRight                 = 278523,
                divineSteed                 = 221886,
                empyreanPower               = 286393,
                greaterBlessingOfKings      = 203538,
                greaterBlessingOfWisdom     = 203539,
                inquisition                 = 84963,
                selflessHealer              = 114250,
                theFiresOfJustice           = 209785,
            },
            debuffs                         = {
                executionSentence           = 267798,
                judgment                    = 197277,
            },
            glyphs                          = {
                glyphOfWingedVengeance      = 57979,
            },
            talents                         = {
                bladeOfWrath                = 231832,
                consecration                = 205228,
                crusade                     = 231895,
                divineJudgment              = 271580,
                divinePurpose               = 223817,
                executionSentence           = 267798,
                eyeForAnEye                 = 205191,
                firesOfJustice              = 203316,
                fistOfJustice               = 234299,
                hammerOfWrath               = 24275,
                inquisition                 = 84963,
                justicarsVengeance          = 215661,
                righteousVerdict            = 267610,
                selflessHealer              = 85804,
                wakeOfAshes                 = 255937,
                wordOfGlory                 = 210191,
                zeal                        = 269569,
            },
            traits                          = {
                divineRight                 = 278523,
            },
        },
        -- All
        Shared = {
            abilities                       = {
                avengingWrath               = 31884,
                blessingOfFreedom           = 1044,
                blessingOfProtection        = 1022,
                contemplation               = 121183,
                crusaderStrike              = 35395,
                divineShield                = 642,
                divineSteed                 = 190784,
                flashOfLight                = 19750,
                hammerOfJustice             = 853,
                handOfReckoning             = 62124,
                layOnHands                  = 633,
                redemption                  = 7328,
            },
            artifacts                       = {

            },
            buffs                           = {
                divineShield                = 642,
                divineSteed                 = 190784,
                blessingOfProtection        = 1022,
            },
            debuffs                         = {
                forbearance                 = 25771,
            },
            glyphs                          = {
                glyphOfFireFromHeavens      = 57954,
                glyphOfPillarOfLight        = 146959,
                glyphOfTheLuminousCharger   = 89401,
                glyphOfTheQueen             = 212642,
            },
            talents                         = {
                blindingLight               = 115750,
                cavalier                    = 230332,
                repentance                  = 20066,
                unbreakableSpirit           = 114154,
            },
        },
    },
    PRIEST = {
        -- Discipline
        [256] = {
            abilities                       = {
                angelicFeather              = 121536,
              --clarityOfWill               = 152118,
                divineStar                  = 110744,
                desperatePrayer             = 19236,
                evangelism                  = 246287,
                halo                        = 120517,
                leapOfFaith                 = 73325,
                luminousBarrier             = 271466,
                mindbender                  = 123040,
                mindControl                 = 205364,
                mindVision                  = 2096,
                painSuppression             = 33206,
                penance                     = 47540,
              --plea                        = 200829,
              --powerInfusion               = 10060,
                powerWordBarrier            = 62618,
                powerWordRadiance           = 194509,
                powerWordShield             = 17,
                powerWordSolace             = 129250,
                psychicScream               = 8122,
                purgeTheWicked              = 204197,
                purify                      = 527,
                rapture                     = 47536,
                schism                      = 214621,
                shadowCovenant              = 204065,
                shadowfiend                 = 34433,
                shadowMend                  = 186263,
                shadowWordPain              = 589,
                shiningForce                = 204263,
                sinsOfTheMany               = 198076,
                smite                       = 585,
            },
            artifacts                       = {
              --sinsOfTheMany               = 198074,
            },
            buffs                           = {
                angelicFeather              = 121557,
                atonement                   = 194384,
                bodyAndSoul                 = 65081,
                borrowedTime                = 197763,
              --clarityOfWill               = 152118,
                innervate                   = 29166,
                overloadedWithLight         = 223166,
                penitent                    = 246519,
              --powerInfusion               = 10060,
                powerOfTheDarkSide          = 198069,
                powerWordShield             = 17,
                rapture                     = 47536,
                speedOfThePious             = 197767,
                symbolOfHope                = 64901,
            },
            debuffs                         = {
                purgeTheWicked              = 204213,
                schism                      = 214621,
                shadowWordPain              = 589,
                smite                       = 585,
            },
            glyphs                          = {

            },
            talents                         = {
                angelicFeather              = 121536,
                bodyAndSoul                 = 64129,
                castigation                 = 193134,
              --clarityOfWill               = 152118,
                contrition                  = 197419,
                divineStar                  = 110744,
                dominantMind                = 205367,
                evangelism                  = 246287,
              --grace                       = 200309,
                halo                        = 120517,
                masochism                   = 193063,
                mindbender                  = 123040,
                luminousBarrier             = 271466,
                --powerInfusion               = 10060,
                powerWordSolace             = 129250,
                purgeTheWicked              = 204197,
                psychicVoice                = 196704,
                schism                      = 214621,
                shadowCovenant              = 204065,
                shieldDiscipline            = 197045,
                sinsOfTheMany               = 280391,
                shiningForce                = 204263,
              --thePenitent                 = 200347,
                twistOfFate                 = 265259,
            },
            traits                          = {
                giftOfForgiveness           = 277680,
            },
        },
        -- Holy
        [257] = {
            abilities                       = {
                angelicFeather              = 121536,
                bodyAndMind                 = 214121,
                desperatePrayer             = 19236,
                divineHymn                  = 64843,
                divineStar                  = 110744,
                flashHeal                   = 2061,
                guardianSpirit              = 47788,
                holyFire                    = 14914,
                holyNova                    = 132157,
                holyWordChastise            = 88625,
                holyWordSanctify            = 34861,
                holyWordSerenity            = 2050,
                holyWordSalvation           = 265202,
                heal                        = 2060,
                leapOfFaith                 = 73325,
                lightOfTuure                = 33076,
                prayerOfHealing             = 596,
                prayerOfMending             = 33076,
                purify                      = 527,
                renew                       = 139,
                smite                       = 585,
                symbolOfHope                = 64901,
            },
            artifacts                       = {
--                lightOfTuure                = 208065,
            },
            buffs                           = {
                angelicFeather              = 121557,
                blessingOfTuure             = 196578,
                divinity                    = 197031,
                echoOfLight                 = 77489,
                powerOfTheNaaru             = 196489,
                prayerOfMending             = 41635,
                renew                       = 139,
                surgeOfLight                = 109186,
                spiritOfRedemption          = 27827,
            },
            debuffs                         = {

            },
            glyphs                          = {

            },
            talents                         = {
                angelicFeather              = 121536,
                apotheosis                  = 200183,
                bindingHeal                 = 32546,
                --bodyAndMind                 = 214121,
                circleOfHealing             = 204883,
                divineStar                  = 110744,
                --divinity                    = 197031,
                halo                        = 120517,
                --piety                       = 197034,
                shiningForce                = 204263,
                surgeOfLight                = 109186,
                --symbolOfHope                = 64901,
            },
        },
        -- Shadow
        [258] = {
            abilities                       = {
                darkAscension               = 280711,
                dispersion                  = 47585,
                mindBlast                   = 8092,
                mindBomb                    = 205369,
                mindbender                  = 200174,
                mindFlay                    = 15407,
                mindSear                    = 48045,
                mindVision                  = 2096,
                powerInfusion               = 10060,
                powerWordShield             = 17,
                psychicHorror               = 64044,
                psychicScream               = 8122,
                purifyDisease               = 213634,
                shadowCrash                 = 205385,
                shadowMend                  = 186263,
                shadowWordDeath             = 32379,
                shadowWordPain              = 589,
                shadowWordVoid              = 205351,
                shadowfiend                 = 34433,
                shadowform                  = 232698,
                silence                     = 15487,
                surrenderToMadness          = 193223,
                vampiricEmbrace             = 15286,
                vampiricTouch               = 34914,
                voidBolt                    = 205448,
                voidEruption                = 228260,
                voidForm                    = 228264,
            },
            artifacts                       = {
                lashOfInsanity              = 238137,
                massHysteria                = 194378,
                sphereOfInsanity            = 194179,
                toThePain                   = 193644,
                touchOfDarkness             = 194007,
                unleashTheShadows           = 194093,
                voidCorruption              = 194016,
                voidTorrent                 = 205065,
            },
            buffs                           = {
                dispersion                  = 47585,
                harvestedThoughts           = 288343,
                powerWordShield             = 17,
                powerInfusion               = 10060,
                shadowyInsight              = 124430,
                shadowform                  = 232698,
                surrenderedSoul             = 212570,
                surrenderToMadness          = 193223,
                thoughtsHarvester           = 288340,
                void                        = 211657,
                voidForm                    = 194249,
                voidTorrent                 = 205065,
                zeksExterminatus            = 236546, -- Legendary Cloak proc
            },
            debuffs                         = {
                mindFlay                    = 15407,
                shadowWordPain              = 589,
                vampiricTouch               = 34914,
                weakenedSoul                = 6788,

            },
            glyphs                          = {

            },
            talents                         = {
                auspiciousSpirits           = 155271,
                bodyAndSoul                 = 64129,
                darkVoid                    = 263346,
                darkAscension               = 280711,
                --dominantMind                = 205367,
                fortressOfTheMind           = 193195,
                legacyOfTheVoid             = 193225,
                lingeringInsanty            = 199849,
                --mania                       = 193173,
                --masochism                   = 193063,
                mindBomb                    = 205369,
                mindbender                  = 200174,
                misery                      = 238558,
                --powerInfusion               = 10060,
                psychicHorror               = 64044,
                --psychicVoice                = 196704,
                --reaperOfSouls               = 199853,
                sanlayn                     = 199855,
                shadowCrash                 = 205385,
                shadowWordDeath             = 32379,
                shadowWordVoid              = 205351,
                shadowyInsight              = 162452,
                surrenderToMadness          = 193223,
                twistOfFate                 = 109142,
                --voidRay                     = 205371,
                voidTorrent                 = 263165,
            },
            traits                          = {
                chorusOfInsanity            = 278661,
                deathThroes                 = 278659,
                searingDialogue             = 272788,
                spitefulApparitions         = 277682,
                thoughtHarvester            = 288340,
                whispersOfTheDamned         = 275722,
            },
        },
        -- All
        Shared = {
            abilities                       = {
                dispelMagic                 = 528,
                fade                        = 586,
                levitate                    = 1706,
                massDispel                  = 32375,
                massResurrection            = 212036,
                mindControl                 = 605,
                powerWordFortitude          = 21562,
                resurrection                = 2006,
                shackleUndead               = 9484,
            },
            artifacts                       = {

            },
            buffs                           = {
                classHallSpeed              = 224098,
                powerWordFortitude          = 21562,
                
            },
            debuffs                         = {

            },
            glyphs                          = {

            },
            talents                         = {

            },
        },
    },
    ROGUE = {
        -- Assassination
        [259] = {
            abilities                       = {
                blindside                   = 111240,
                crimsonTempest              = 121411,
                cripplingPoison             = 3408,
                deadlyPoison                = 2823,
                envenom                     = 32645,
                evasion                     = 5277,
                eviscerate                  = 196819,
                exsanguinate                = 200806,
                fanOfKnives                 = 51723,
                garrote                     = 703,
                kidneyShot                  = 408,
                mutilate                    = 1329,
                poisonedKnife               = 185565,
                rupture                     = 1943,
                shadowstep                  = 36554,
                sinisterStrike              = 1752,
                toxicBlade                  = 245388,
                vendetta                    = 79140,
                woundPoison                 = 8679,
            },
            artifacts                       = {

            },
            buffs                           = {
                blindside                   = 111240,
                cripplingPoison             = 3408,
                deadlyPoison                = 2823,
                elaboratePlanning           = 193641,
                envenom                     = 32645,
                hiddenBlades                = 270070,
                leechingPoison              = 108211,
                sharpenedBlades             = 272916,
                masterAssassin              = 256735,
                stealth                     = 1784 or 115191,
                subterfuge                  = 115192,
                theDreadlordsDeceit         = 208692,
                woundPoison                 = 8679,
            },
            debuffs                         = {
                crimsonTempest              = 121411,
                cripplingPoison             = 3409,
                deadlyPoison                = 2818,
                garrote                     = 703,
                internalBleeding            = 154953,
                kidneyShot                  = 408,
                rupture                     = 1943,
                surgeOfToxins               = 192425,
                toxicBlade                  = 245389,
                vendetta                    = 79140,
                woundPoison                 = 8680,
            },
            glyphs                          = {

            },
            talents                         = {
                blindside                   = 111240,
                crimsonTempest              = 121411,
                elaboratePlanning           = 193640,
                elusiveness                 = 79008,
                exsanguinate                = 200806,
                hiddenBlades                = 270061,
                internalBleeding            = 154904,
                ironWire                    = 196861,
                leechingPoison              = 280716,
                masterAssassin              = 255989,
                masterPoisoner              = 196864,
                nightstalker                = 14062,
                poisonBomb                  = 255544,
                subterfuge                  = 108208,
                toxicBlade                  = 245388,
                venomRush                   = 152152,
            },
            traits                          = {
                doubleDose                  = 273007,
                echoingBlades               = 287649,
                sharpenedBlades             = 272911,
                shroudedSuffocation         = 278666,
            }
        },
        -- Outlaw
        [260] = {
            abilities                       = {
                adrenalineRush              = 13750,
                ambush                      = 8676,
                betweenTheEyes              = 199804,
                bladeFlurry                 = 13877,
                bladeRush                   = 271877,
                blind                       = 2094,
                curseOfTheDreadblades       = 202665,
                dispatch                    = 2098,
                ghostlyStrike               = 196937,
                gouge                       = 1776,
                grapplingHook               = 195457,
                killingSpree                = 51690,
                masteryMainGauche           = 76806,
                pistolShot                  = 185763,
                riposte                     = 199754,
                rollTheBones                = 193316,
                sinisterStrike              = 193315,
                stealth                     = 1784,
            },
            artifacts                       = {
                blackPowder                 = 216230,
                bladeDancer                 = 202507,
                bladeMaster                 = 202628,
                blunderbuss                 = 202897,
                blurredTime                 = 202769,
                cannonballBarrage           = 185767,
                curseOfTheDreadblades       = 202665,
                cursedEdge                  = 202463,
                cursedSteel                 = 214929,
                deception                   = 202755,
                fatesThirst                 = 202514,
                fatebringer                 = 202524,
                fortuneStrikes              = 202530,
                fortunesBoon                = 202907,
                fortunesStrike              = 202521,
                ghostlyShell                = 202533,
                greed                       = 202820,
                gunslinger                  = 202522,
                hiddenBlade                 = 202573,
                killingSpree                = 51690,
                loadedDice                  = 238139,
            },
            buffs                           = {
                adrenalineRush              = 13750,
                alacrity                    = 193538,
                bladeFlurry                 = 13877,
                blunderbuss                 = 202895,
                broadside                   = 193356,
                buriedTreasure              = 199600,
                deadShot                    = 272940,
                grandMelee                  = 193358,
                greenskinsWaterloggedWristcuffs = 209420,
                hiddenBlade                 = 202754,
                jollyRoger                  = 199603,
                loadedDice                  = 256171,
                opportunity                 = 195627,
                ruthlessPrecision           = 193357,
                rollTheBones                = {
                    broadside                   = 193356,
                    buriedTreasure              = 199600,
                    grandMelee                  = 193358,
                    ruthlessPrecision           = 193357,
                    skullAndCrossbones          = 199603,
                    trueBearing                 = 193359,
                },
                sharkInfestedWaters         = 193357,
                skullAndCrossbones          = 199603,
                sliceAndDice                = 5171,
                snakeeeyes                  = 275863,
                stealth                     = 1784,
                swordplay                   = 211669,
                trueBearing                 = 193359,
                wits                        = 288988,
            },
            debuffs                         = {
                ghostlyStrike               = 196937,
            },
            glyphs                          = {

            },
            talents                         = {
                acrobaticStikes             = 196924,
                dirtyTricks                 = 108216,
                bladeRush                   = 271877,
                ghostlyStrike               = 196937,
                grapplingHook               = 256188,
                hitAndRun                   = 196922,
                ironStomach                 = 193546,
                killingSpree                = 51690,
                sliceAndDice                = 5171,
                weaponmaster                = 200733,
                quickDraw                   = 196938,
            },
             traits                          = {
                deadshot                    = 272935,
                aceupyoursleeve             = 278676,
                snakeeyes                   = 275846,
            },
        },
        -- Subtlety
        [261] = {
            abilities                       = {
                backstab                    = 53,
                evasion                     = 5277,
                eviscerate                  = 196819,
                gloomblade                  = 200758,
                kidneyShot                  = 408,
                nightblade                  = 195452,
                shadowBlades                = 121471,
                shadowDance                 = 185313,
                shadowstep                  = 36554,
                shadowstrike                = 185438,
                shurikenStorm               = 197835,
                shurikenToss                = 114014,
                symbolsOfDeath              = 212283,
            },
            artifacts                       = {

            },
            buffs                           = {
                masterOfShadows             = 196980,
                nightsVengeance             = 273424,
                shadowBlades                = 121471,
                shadowDance                 = 185422,
                sharpenedBlades             = 272916,
                shurikenCombo               = 245640,
                shurikenTornado             = 277925,
                subterfuge                  = 115192,
                symbolsOfDeath              = 212283,
                theDreadlordsDeceit         = 228224,
            },
            debuffs                         = {
                findWeakness                = 91021,
                nightblade                  = 195452,
                shadowsGrasp                = 206760,
            },
            glyphs                          = {

            },
            talents                         = {
                alacrity                    = 193539,
                darkShadow                  = 245687,
                envelopingShadows           = 238104,
                findWeakness                = 91023,
                gloomblade                  = 200758,
                masterOfShadows             = 196976,
                nightTerrors                = 277953,
                nightstalker                = 14062,
                secretTechnique             = 280719,
                shadowFocus                 = 108209,
                shotInTheDark               = 257505,
                shurikenTornado             = 277925,
                soothingDarkness            = 200759,
                subterfuge                  = 108208,
                weaponmaster                = 193537,
            },
            traits                          = {
                bladeInTheShadows           = 275896,
                nightsVengeance             = 273418,
                replicatingShadows          = 286121,
                sharpenedBlades             = 272911,
                theFirstDance               = 278681
            }
        },
        -- All
        Shared = {
            abilities                       = {
                blind                       = 2094,
                cheapShot                   = 1833,
                cloakOfShadows              = 31224,
                crimsonVial                 = 185311,
                detection                   = 56814 or 210108,
                distract                    = 1725,
                feint                       = 1966,
                kick                        = 1766,
                markedForDeath              = 137619,
                pickLock                    = 1804,
                pickPocket                  = 921,
                sap                         = 6770,
                shadowmeld                  = 58984,
                sprint                      = 2983,
                stealth                     = 115191,
                tricksOfTheTrade            = 57934,
                vanish                      = 1856,
            },
            artifacts                       = {

            },
            buffs                           = {
                cloakOfShadows              = 31224,
                deathFromAbove              = 152150,
                feint                       = 1966,
                masterAssassinsInitiative   = 235027, --235022
                sprint                      = 2983,
                stealth                     = 115191,
                vanish                      = 11327 or 115193,
            },
            debuffs                         = {
                cheapShot                   = 1833,
                markedForDeath              = 137619,
                sap                         = 6770,
            },
            glyphs                          = {
                glyphOfBlackout             = 219693,
                glyphOfBurnout              = 220279,
                glyphOfDisguise             = 63268,
                glyphOfFlashBang            = 219678,
            },
            talents                         = {
                cheatDeath                  = 31230,
                deeperStratagem             = 193531,
                elusiveness                 = 79008,
                markedForDeath              = 137619,
                preyOnTheWeak               = 131511,
                vigor                       = 14983,
            },
        },
    },
    SHAMAN = {
        -- Elemental
        [262] = {
            abilities                       = {
                ancestralGuidance           = 108281,
                ascendance                  = 114050,
                chainLightning              = 188443,
                cleanseSpirit               = 51886,
                earthElemental              = 198103,
                earthquake                  = 61882,
                earthShield                 = 974,
                earthShock                  = 8042,
                elementalBlast              = 117014,
                --elementalMastery            = 16166,
                eyeOfTheStorm               = 157375,
                fireBlast                   = 57984,
                fireElemental               = 198067,
                flameShock                  = 188389,
                frostShock                  = 196840,
                --gustOfWind                  = 192063,
                hardenSkin                  = 118337,
                healingSurge                = 8004,
                iceFury                     = 210714,
                immolate                    = 118297,
                lavaBeam                    = 114074,
                lavaBurst                   = 51505,
                lightningBolt               = 188196,
                liquidMagmaTotem            = 192222,
                meteor                      = 117588,
                pulverize                   = 118345,
                stormElemental              = 192249,
                stormKeeper                 = 191634,
                thunderstorm                = 51490,
                totemMastery                = 210643,
                windGust                    = 157331,
            },
            artifacts                       = {
                seismicStorm                = 238141,
                stormkeeper                 = 205495,
                swellingMaelstrom           = 238105,
            },
            buffs                           = {
                ascendance                  = 114050,
                bloodlust                   = 2825,
                earthShield                 = 974,
                echoesOfTheGreatSundering   = 208722,
                elementalFocus              = 16164,
                elementalMastery            = 16166,
                emberTotem                  = 210658,
                hardenSkin                  = 118337,
                heroism                     = 32182,
                iceFury                     = 210714,
                lavaSurge                   = 77762,
                masterOfTheElements         = 260734,
                powerOfTheMaelstrom         = 191877,
                resonanceTotem              = 202192,
                stormKeeper                 = 191634,
                stormTotem                  = 210652,
                surgeOfPower                = 285514,
                tailwindTotem               = 210659,
                tectonicThunder             = 286949,
                windGust                    = 263806,
            },
            debuffs                         = {
                flameShock                  = 188389,
                frostShock                  = 196840,
                immolate                    = 118297,
                lightningRod                = 197209,
            },
            glyphs                          = {

            },
            talents                         = {
                aftershock                  = 273221,
                ancestralGuidance           = 108281,
                --ancestralSwiftness          = 192087,
                ascendance                  = 114050,
                callTheThunder              = 260897,
                earthenRage                 = 170374,
                echoOfTheElements           = 108283,
                elementalBlast              = 117014,
                --elementalFusion             = 192235,
                --elementalMastery            = 16166,
                --gustOfWind                  = 192063,
                iceFury                     = 210714,
                --lightningRod                = 210689,
                liquidMagmaTotem            = 192222,
                masterOfTheElements         = 16166,
                --pathOfFlame                 = 201909,
                primalElementalist          = 117013,
                stormElemental              = 192249,
                stormKeeper                 = 191634,
                surgeOfPower                = 262303,
                totemMastery                = 210643,
            },
            traits                          = {
                naturalHarmony              = 278697,
                tectonicThunder             = 286949,
            },
        },
        -- Enhancement
        [263] = {
            abilities                       = {
                ascendance                  = 114051,
                cleanseSpirit               = 51886,
                crashLightning              = 187874,
                earthShield                 = 974,
                earthenSpike                = 188089,
                feralLunge                  = 196884,
                feralSpirit                 = 51533,
                flametongue                 = 193796,
                frostbrand                  = 196834,
                furyOfAir                   = 197211,
                healingSurge                = 188070,
                lavaLash                    = 60103,
                lightningBolt               = 187837,
                lightningShield             = 192106,
                rockbiter                   = 193786,
                spiritWalk                  = 58875,
                stormstrike                 = 17364,
                sundering                   = 197214,
                totemMastery                = 262395,
                windstrike                  = 115356, --17364,
            },
            artifacts                       = {

            },
            buffs                           = {
                ascendance                  = 114051,
                cracklingSurge              = 224127,
                crashLightning              = 187878,
                earthShield                 = 974,
                flametongue                 = 194084,
                forcefulWinds               = 262652,
                frostbrand                  = 196834,
                furyOfAir                   = 197211,
                gatheringStorms             = 198300,
                hailstorm                   = 210853,
                hotHand                     = 215785,
                icyEdge                     = 224126,
                landslide                   = 202004,
                lightningCrash              = 242284, -- T20 - 2 piece buff
                lightningShield             = 192106,
                lightningShieldOvercharge   = 273323,
                naturalHarmonyFire          = 279028,
                naturalHarmonyFrost         = 279029,
                naturalHarmonyNature        = 279033,
                moltenWeapon                = 272664,
                oldWar                      = 188028,
                prolongedPower              = 229206,
                resonanceTotem              = 262417,
                stormbringer                = 201846,
                strengthOfTheEarth          = 273465,
            },
            debuffs                         = {
                earthenSpike                = 188089,
                frostbrand                  = 147732,
                lightningConduit            = 275391,
                primalPrimer                = 273006,
                searingAssault              = 268429,
                stormTempests               = 214265,
            },
            glyphs                          = {

            },
            talents                         = {
                ascendance                  = 114051,
                boulderfist                 = 246035, -- 201897, Changed to Passive in Patch 7.2.5
                crashingStorm               = 192246,
                earthenSpike                = 188089,
                elementalSpirits            = 262624,
                feralLunge                  = 196884,
                forcefulWinds               = 262647,
                furyOfAir                   = 197211,
                hailstorm                   = 210853,
                hotHand                     = 201900,
                landslide                   = 197992,
                lightningShield             = 192106,
                overcharge                  = 210727,
                searingAssault              = 192087,
                sundering                   = 197214,
                totemMastery                = 262395,
            },
            traits                          = {
                lightningConduit            = 275389,
                naturalHarmony              = 278697,
                primalPrimer                = 272992,
                strengthOfTheEarth          = 273461,
            },
        },
        -- Restoration
        [264] = {
            abilities                       = {
             --   ancestralGuidance           = 108281,
                ancestralProtectionTotem    = 207399,
                ascendance                  = 114052,
                chainHeal                   = 1064,
                chainLightning              = 421,
                cloudburstTotem             = 157153,
                downpour                    = 207778,
                earthShield                 = 974,
                earthenWallTotem            = 198838,
                flameShock                  = 188838,
              --  giftOfTheQueen              = 207778,
                healingRain                 = 73920,
                healingSurge                = 8004,
                healingStreamTotem          = 5394,
                healingTideTotem            = 108280,
                healingWave                 = 77472,
                heroism                     = 32182,
                lavaBurst                   = 51505,
                lightningBolt               = 403,
                purifySpirit                = 77130,
                riptide                     = 61295,
                spiritLinkTotem             = 98008,
                spiritwalkersGrace          = 79206,
                wellspring                  = 197995,
            },
            artifacts                       = {
             --   giftOfTheQueen              = 207778,
            },
            buffs                           = {
                ascendance                  = 114052,
                cloudburstTotem             = 157504,
                earthShield                 = 974,
                healingRain                 = 73920,
                jonatsFocus                 = 210607,
                lavaSurge                   = 77762,
                riptide                     = 61295,
                tidalWaves                  = 53390,
                unleashLife                 = 73685,
                spiritwalkersGrace          = 79206,
            },
            debuffs                         = {
                flameShock                  = 188838,
            },
            glyphs                          = {
            },
            talents                         = {
                --ancestralGuidance           = 108281,
                ancestralProtectionTotem    = 207399,
                ascendance                  = 114052,
                cloudburstTotem             = 157153,
                downpour                    = 207778,
                earthenWallTotem          = 198838,
                earthShield                 = 974,
                echoOfTheElements           = 108283,
               -- gustOfWind                  = 192063,
                highTide                    = 157154,
                unleashLife                 = 73685,
                wellspring                  = 197995,
                windRushTotem               = 192077,
            },
        },
        -- All
        Shared = {
            abilities                       = {
                ancestralSpirit             = 2008,
                astralShift                 = 108271,
                capacitorTotem              = 192058,
                earthElemental              = 198103,
                earthbindTotem              = 2484,
                ghostWolf                   = 2645,
                hex                         = 51514,
                purge                       = 370,
                tremorTotem                 = 8143,
                waterWalking                = 546,
                windRushTotem               = 192077,
                windShear                   = 57994,
            },
            artifacts                       = {

            },
            buffs                           = {
                astralShift                 = 108271,
                ghostWolf                   = 2645,
                waterWalking                = 546,
            },
            debuffs                         = {
                hex                         = 51514,
            },
            glyphs                          = {

            },
            talents                         = {
                earthShield                 = 974,
                naturesGuardian             = 30884,
                spiritWolf                  = 260878,
                staticCharge                = 265046,
                windRushTotem               = 192077,
            },
        },
    },
    WARLOCK = {
        -- Affliction
        [265] = {
            abilities                       = {
                agony                       = 980,
                commanddemon                = 119898,
                corruption                  = 172,
                darkSoul                    = 113860,
                deathbolt                   = 264106,
                drainLife                   = 234153,
                drainSoul                   = 198590,
                grimoireOfSacrifice         = 108503,
                haunt                       = 48181,
                howlOfTerror                = 5484,
                phantomSingularity          = 205179,
                reapSouls                   = 216698,
                seedOfCorruption            = 27243,
                shadowBolt                  = 232670,
                shadowLock                  = 171138,
                siphonLife                  = 63106,
                spellLock                   = 19647,
                spellLockgrimoire           = 132409,
                soulEffigy                  = 205178,
                summonDarkglare             = 205180,
                unstableAffliction          = 30108,
                vileTaint                   = 278350,
            },
            artifacts                       = {
                compoundingHorror           = 199282,
                crystallineShadows          = 221862,
                drainedToAHusk              = 199120,
                fatalEchoes                 = 199257,
                harvesterOfSouls            = 201424,
                hideousCorruption           = 199112,
                inherentlyUnstable          = 199152,
                inimitableAgony             = 199111,
                longDarkNightOfTheSoul      = 199214,
                perdition                   = 199158,
                reapSouls                   = 216698,
                seedsOfDoom                 = 199153,
                shadowsOfTheFlesh           = 199212,
                shadowyIncantations         = 199163,
                soulFlame                   = 199471,
                soulstealer                 = 214934,
                sweetSouls                  = 199220,
                wrathOfConsumption          = 199472,
            },
            buffs                           = {
                cascadingCalamity           = 275378,
                compoundingHorror           = 199281,
                deadwindHarvester           = 216708,
                demonicPower                = 196099,
                empoweredLifeTap            = 235156,
                nightfall                   = 264571,
                tormentedSouls              = 216695,
                wrathOfConsumption          = 199646,
                inevitableDemise            = 273525,
            },
            debuffs                         = {
                agony                       = 980,
                corruption                  = 146739,
                haunt                       = 48181,
                phantomSingularity          = 205179,
                seedOfCorruption            = 27243,
                shadowEmbrace               = 32388,
                siphonLife                  = 63106,
                unstableAffliction1         = 233490,
                unstableAffliction2         = 233496,
                unstableAffliction3         = 233497,
                unstableAffliction4         = 233498,
                unstableAffliction5         = 233499,
            },
            glyphs                          = {

            },
            talents                         = {
                absoluteCorruption          = 196103,
                creepingDeath               = 264000,
                darkSoul                    = 113860,
                deathbolt                   = 264106,
                drainSoul                   = 198590,
                grimoireOfSacrifice         = 108503,
                haunt                       = 48181,
                phantomSingularity          = 205179,
                shadowEmbrace               = 32388,
                siphonLife                  = 63106,
                soulConduit                 = 215941,
                sowTheSeeds                 = 196226,
                vileTaint                   = 278350,
                writheInAgony               = 196102,
            },
            traits                          = {
                cascadingCalamity           = 275372,
                pandemicInvocation          = 289364,
            }
        },
        -- Demonology
        [266] = {
            abilities                       = {
                bilescourgeBombers          = 267211,
                callDreadstalkers           = 104316,
                commandDemon                = 119898,
                demonbolt                   = 264178,
                demonicEmpowerment          = 193396,
                demonicStrength             = 267171,
                demonwrath                  = 193440,
                doom                        = 603,
                drainLife                   = 234153,
                felFirebolt                 = 104318,
                felstorm                    = 89751,
                grimoireFelguard            = 111898,
                handOfGuldan                = 105174,
                implosion                   = 196277,
                netherPortal                = 267217,
                powerSiphon                 = 264130,
                shadowBolt                  = 686,
                shadowflame                 = 205181,
                shadowLock                  = 171138,
                soulStrike                  = 264057,
                spellLock                   = 19647,
                summonDarkglare             = 205180,
                summonDemonicTyrant         = 265187,
                summonVilefiend             = 264119,
                thalkielsConsumption        = 211714,
            },
            artifacts                       = {
                thalkielsAscendance         = 238145,
                thalkielsConsumption        = 211714,
            },
            buffs                           = {
                demonicCalling              = 205146,
                demonicCore                 = 267102,
                demonicEmpowerment          = 193396,
                demonicPower                = 265273,
                demonwrath                  = 193440,
                explosivePotential          = 275398,
                forbiddenKnowledge          = 278738,
                netherPortal                = 267218,
                shadowsBite                 = 272945,
                shadowyInspiration          = 196269,
            },
            debuffs                         = {
                doom                        = 603,
                shadowflame                 = 205181,
            },
            glyphs                          = {

            },
            talents                         = {
                bilescourgeBombers          = 267211,
                demonicConsumption          = 267215,
                demonicStrength             = 267171,
                doom                        = 265412,
                netherPortal                = 267217,
                powerSiphon                 = 264130,
                soulStrike                  = 264057,
                summonVilefiend             = 264119,

            },
            traits                          = {
                balefulInvocation           = 287059,
                explosivePotential          = 275395,
                shadowsBite                 = 272944,
            }
        },
        -- Destruction
        [267] = {
            abilities                       = {
                cataclysm                   = 152108,
                channelDemonfire            = 196447,
                chaosBolt                   = 116858,
                conflagrate                 = 17962,
                darkSoul                    = 113858,
                devourMagic                 = 19505,
                dimensionalRift             = 196586,
                drainLife                   = 234153,
                grimoireOfSacrifice         = 108503,
                havoc                       = 80240,
                immolate                    = 348,
                incinerate                  = 29722,
                rainOfFire                  = 5740,
                shadowBolt                  = 686,
                shadowburn                  = 17877,
                shadowLock                  = 171138,
                singeMagic                  = 119905,
                singeMagicGrimoire          = 132411,
                soulFire                    = 6353,
                spellLock                   = 19647,
                spellLockgrimoire           = 132409,
            },
            artifacts                       = {

            },
            buffs                           = {
                backdraft                   = 117828, --196406,
                darkSoul                    = 113858,
                demonicPower                = 196099,
                empoweredLifeTap            = 235156,
                lessonsOfSpaceTime          = 236174,
                lordOfFlames                = 224103,
            },
            debuffs                         = {
                conflagrate                 = 265931,
                eradication                 = 196414,
                immolate                    = 157736,
                havoc                       = 80240,
            },
            glyphs                          = {

            },
            talents                         = {
                cataclysm                   = 152108,
                channelDemonfire            = 196447,
                darkSoul                    = 113858,
                eradication                 = 196412,
                flashover                   = 267115,
                fireAndBrimstone            = 196408,
                grimoireOfSacrifice         = 108503,
                inferno                     = 270545,
                internalCombustion          = 266134,
                eradication                 = 196412,
                reverseEntropy              = 205148,
                roaringBlaze                = 205184,
                shadowburn                  = 17877,
                soulFire                    = 6353,
            },
        },
        -- All
        Shared = {
            abilities                       = {
                darkPact                    = 108416,
                demonicCircle               = 48018,
                fear                        = 5782,
                grimoireFelhunter           = 111897,
                grimoireImp                 = 111859,
                grimoireOfService           = 108501,
                grimoireSuccubus            = 111896,
                grimoireVoidwalker          = 111895,
                healthFunnel                = 755,
                lifeTap                     = 1454,
                mortalCoil                  = 6789,
                shadowfury                  = 30283,
                soulHarvest                 = 196098,
                soulstone                   = 20707,
                --summonDoomguard             = 18540,
                summonFelguard              = 30146,
                summonFelhunter             = 691,
                summonFelImp                = 688,
                summonImp                   = 688,
                summonInfernal              = 1122,
                summonSuccubus              = 712,
                summonVoidwalker            = 697,
                summonWrathguard            = 112870,
                unendingResolve             = 104773,
            },
            artifacts                       = {

            },
            buffs                           = {
                demonicSynergy              = 171982,
                sindoreiSpite               = 208871,
                soulHarvest                 = 196098,
                soulstone                   = 20707,
            },
            debuffs                         = {

            },
            glyphs                          = {
                glyphOfTheFelImp            = 219424,
            },
            pets                            = {
                darkglare                   = 103673,
                demonicTyrant               = 135002,
                doomguard                   = 78158,
                dreadstlaker                = 98035,
                felguard                    = 17252,
                felhunter                   = 417,
                imp                         = 416,
                infernal                    = 78217,
                succubus                    = 1863,
                voidwalker                  = 1860,
                wildImp                     = 55659,
                wrathguard                  = 58965,
            },
            talents                         = {
                burningRush                 = 111400,
                darkPact                    = 108416,
                demonSkin                   = 219272,
                mortalCoil                  = 6789,
            },
        },
    },
    WARRIOR = {
        -- Arms
        [71] = {
            abilities                       = {
                bladestorm                  = 227847,
                cleave                      = 845,
                colossusSmash               = 167105,
                commandingShout             = 97462,
                deadlyCalm                  = 262228,
                defensiveStance             = 197690,
                dieByTheSword               = 118038,
                execute                     = 163201,
                hamstring                   = 1715,
                mortalStrike                = 12294,
                overpower                   = 7384,
                ravager                     = 152277,
                rend                        = 772,
                slam                        = 1464,
                sweepingStrikes             = 260708,
                warbreaker                  = 262161,
                whirlwind                   = 1680,
            },
            artifacts                       = {

            },
            buffs                           = {
                crushingAssasult            = 278826,
                deadlyCalm                  = 262228,
                defensiveStance             = 197690,
                inForTheKill                = 215550,
                overpower                   = 60503,
                stoneHeart                  = 225947,
                suddenDeath                 = 52437,
                sweepingStrikes             = 260708,
                testOfMight                 = 275540,
            },
            debuffs                         = {
                colossusSmash               = 208086,
                deepWounds                  = 262115,
                executionersPrecision       = 272870,
                rend                        = 772,
            },
            glyphs                          = {
                glyphOfThunderStrike        = 68164,
            },
            talents                         = {
                avatar                      = 107574,
                cleave                      = 845,
                collateralDamage            = 268243,
                deadlyCalm                  = 262228,
                defensiveStance             = 197690,
                doubleTime                  = 103827,
                dreadnaught                 = 262150,
                fervorOfBattle              = 202316,
                inForTheKill                = 248621,
                massacre                    = 281001,
                ravager                     = 152277,
                rend                        = 772,
                secondWind                  = 29838,
                skullsplitter               = 260643,
                suddenDeath                 = 29725,
                warMachine                  = 262231,
                warbreaker                  = 262161,
            },
            traits                          = {
                seismicWave                 = 277639,
                testOfMight                 = 275529,
            }
        },
        -- Fury
        [72] = {
            abilities                       = {
                bladestorm                  = 46924,
                bloodthirst                 = 23881,
                dragonRoar                  = 118000,
                deathWish                   = 199261,
                enragedRegeneration         = 184364,
                execute                     = 5308,
                furiousSlash                = 100130,
                piercingHowl                = 12323,
                ragingBlow                  = 85288,
                rampage                     = 184367,
                recklessness                = 1719,
                siegebreaker                = 280772,
                whirlwind                   = 190411,
            },
            artifacts                       = {

            },
            buffs                           = {
                deathWish                   = 199261,
                enrage                      = 184362,
                furiousSlash                = 202539,
                meatCleaver                 = 85739,
                recklessness                = 1719,
                suddenDeath                 = 280776,
                whirlwind                   = 85739,
            },
            debuffs                         = {
                siegebreaker                = 280773,
            },
            glyphs                          = {

            },
            talents                         = {
                bladestorm                  = 46924,
                carnage                     = 202922,
                doubleTime                  = 103827,
                dragonRoar                  = 118000,
                endlessRage                 = 202296,
                freshMeat                   = 215568,
                frothingBerserker           = 215571,
                furiousCharge               = 202224,
                furiousSlash                = 100130,
                innerRage                   = 215573,
                massacre                    = 206315,
                meatCleaver                 = 280392,
                recklessAbandon             = 202751,
                siegebreaker                = 280772,
                suddenDeath                 = 280721,
                warMachine                  = 262231,
                warpaint                    = 208154,
            },
            traits                          = {
                coldSteelHotBlood           = 288080
            }
        },
        -- Protection
        [73] = {
            abilities                       = {
                demoralizingShout           = 1160,
                devastate                   = 20243,
                focusedRage                 = 204488,
                ignorePain                  = 190456,
                impendingVictory            = 202168,
                intercept                   = 198304,
                lastStand                   = 12975,
                ravager                     = 228920,
                revenge                     = 6572,
                shieldBlock                 = 2565,
                shieldSlam                  = 23922,
                shieldWall                  = 871,
                shockwave                   = 46968,
                spellReflection             = 23920,
                thunderClap                 = 6343,
            },
            artifacts                       = {

            },
            buffs                           = {
                avatar                      = 107574,
                defensiveStance             = 71,
                ignorePain                  = 190456,
                lastStand                   = 12975,
                revenge                     = 5302,
                shieldBlock                 = 132404,
                shieldWall                  = 871,
                spellReflection             = 23920,
                vengeanceFocusedRage        = 202573,
                vengeanceIgnorePain         = 202574,
                vengeanceRevenge            = 202573,
                victorious                  = 32216,
            },
            debuffs                         = {
                deepwoundsProt              = 115767,
                demoralizingShout           = 1160,
                thunderClap                 = 6343,
            },
            glyphs                          = {

            },
            talents                         = {
                bestServedCold              = 202560,
                bolster                     = 280001,
                boomingVoice                = 202743,
                cracklingThunder            = 203201,
                devastator                  = 236279,
                dragonRoar                  = 118000,
                heavyRepercussions          = 203177,
                indomitable                 = 202095,
                intoTheFray                 = 202603,
                menace                      = 275338,
                neverSurrender              = 202561,
                punish                      = 275334,
                ravager                     = 228920,
                rumblingEarth               = 275339,
                safeguard                   = 223657,
                unstoppableForce            = 275336,
                vengeance                   = 202572,
            },
        },
        -- All
        Shared = {
            abilities                       = {
                avatar                      = 107574,
                battleShout                 = 6673,
                berserkerRage               = 18499,
                charge                      = 100,
                heroicLeap                  = 6544,
                heroicThrow                 = 57755,
                intimidatingShout           = 5246,
                pummel                      = 6552,
                rallyingCry                 = 97462,
                stormBolt                   = 107570,
                taunt                       = 355,
                victoryRush                 = 34428,
            },
            artifacts                       = {

            },
            buffs                           = {
                battleShout                 = 6673,
                berserkerRage               = 18499,
                fujiedasFury                = 207776,
                victorious                  = 32216,
            },
            debuffs                         = {

            },
            glyphs                          = {

            },
            talents                         = {
                angerManagement             = 152278,
                boundingStride              = 202163,
                impendingVictory            = 202168,
                stormBolt                   = 107570,
            },
        },
    },
    -- Global
    Shared = {
        Shared = {
            abilities                           = {
                giftOfTheNaaru                  = 28880,
                global                          = 61304,
                lightsJudgment                  = 247427,
                quakingPalm                     = 107079,
                racial                          = getRacial(),
                shadowmeld                      = 58984,
            },
            artifacts                           = {
                artificialDamage                = 226829,
                artificialStamina               = 211309,
                concordanceOfTheLegionfall      = 239042,
            },
            buffs                               = {
                ancientHysteria                 = 90355,
                battlePotionOfAgility           = 279152,
                battlePotionOfIntellect         = 279151,
                battlePotionOfStrength          = 279153,
                blessingOfSacrifice 	        = 6940,
                greaterBlessingOfKings 	        = 203538,
                greaterBlessingOfWisdom	        = 203539,
                blessingOfFreedom     	        = 1044,
                blessingOfProtection            = 1022,
                bloodLust                       = {
                    ancientHysteria             = 90355,
		            bloodlust                   = 2825,
		            drumsOfRage                 = 146555,
                    drumsOfTheMaelstrom         = 256740,
                    drumsOfTheMountain          = 230935,
		            heroism                     = 32182,
		            netherwinds                 = 160452,
		            primalRage                  = 264667,
                    timewarp                    = 80353,
                },
                concordanceOfTheLegionfall      = 239042,
                defiledAugmentation             = 224001, -- Lightforged Augment Rune buff
                felFocus                        = 242551,
                flaskOfTenThousandScars         = 188035,
                flaskOfTheCountlessArmies       = 188034,
                flaskOfTheSeventhDemon          = 188033,
                flaskOfTheWhisperedPact         = 188031,
                flaskOfTheCurrents              = 251836,
                flaskOfEndlessFathoms           = 251837,
                flaskOfTheVastHorizon           = 251838,
                flaskOfTheUndertow              = 251839,
                fruitfulMachinatins             = 242623, -- Absorb Shield from Deceiver's Grand Design
                greaterFlaskOfTheCurrents       = 298836,
                greaterFlaskOfTheUndertow       = 298841,
                guidingHand                     = 242622, -- from The Deceiver's Grand Design
                heroism                         = 32182,
                netherwinds                     = 160452,
                norgannonsForesight             = 236373,
                potionOfBurstingBlood           = 265514,
                potionOfFocusedResolve          = 298317,
                prolongedPower                  = 229206,
                racial                          = getRacial(),
                razorCoral                      = 303570, -- Crit Buff from Ashvane's Razor Coral
                sephuz1                         = 208051, -- the fulltime 10% movement, 2% haste buff
                sephuz2                         = 208052, -- the proc, 70% movement, 25% haste buff
                sephuzCooldown                  = 226262, -- CD (30 seconds) for the proc
                shadowmeld                      = 58984,
                symbolOfHope                    = 64901,
                timeWarp                        = 80353,
                whispersOfInsanity              = 176151,
                cracklingTourmaline             = 290372,
                saphireofBrilliance             = 290365,
                vigorEngaged                    = 287916,
                -- Essences
                guardianOfAzeroth               = 295855,
                lifeblood                       = 295137,
                memoryOfLucidDreams             = 298357,
                recklessForce                   = 302932,
                recklessForceCounter            = 298452,
                seethingRage                    = 297126,
            },
            debuffs                             = {
                concentratedFlame               = 295368,
                dampening                       = 110310,
                eyeOfLeotheras                  = 206649,
                razorCoral                      = 303568, --304877,
                repeatPerformance               = 304409,
                temptation                      = 234143,
            },
            essences                            = {
                aegisOfTheDeep                  = 298168,
                animaOfDeath                    = 294926,
                azerothsUndyingGift             = 298081,
                bloodOfTheEnemy                 = 297108,
                concentratedFlame               = 295373,
                condensedLifeForce              = 299357,
                empoweredNullBarrier            = 295746,
                focusedAzeriteBeam              = 295258,
                guardianOfAzeroth               = 299355,
                heartEssence                    = 296208,
                lifeBindersInvocation           = 299943,
                memoryOfLucidDreams             = 298357,
                overchargeMana                  = 296072,
                purifyingBlast                  = 299345,
                refreshment                     = 296197,
                rippleInSpace                   = 302731,
                standstill                      = 299882,
                suppressingPulse                = 300009,
                theUnboundForce                 = 299376,
                vitalityConduit                 = 299958,
                worldveinResonance              = 295186
            },
        },
    },
    ClassTemplate = {
        SpecTemplate = {
            abilities                       = {

            },
            artifacts                       = {

            },
            buffs                           = {

            },
            debuffs                         = {

            },
            glyphs                          = {

            },
            talents                         = {

            },
        },
        SpecTemplate = {
            abilities                       = {

            },
            artifacts                       = {

            },
            buffs                           = {

            },
            debuffs                         = {

            },
            glyphs                          = {

            },
            talents                         = {

            },
        },
        SpecTemplate = {
            abilities                       = {

            },
            artifacts                       = {

            },
            buffs                           = {

            },
            debuffs                         = {

            },
            glyphs                          = {

            },
            talents                         = {

            },
        },
        Shared = {
            abilities                       = {

            },
            artifacts                       = {

            },
            buffs                           = {

            },
            debuffs                         = {

            },
            glyphs                          = {

            },
            talents                         = {

            },
        },
    },
}
