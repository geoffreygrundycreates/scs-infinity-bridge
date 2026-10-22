-- Bridge for SCS #4115. SCS owns the skill arithmetic and spells.
-- This file is loaded ONLY by the independent thief compatibility component.
local bridge_owner = nil
local bridge_active = false
local bridge_initialized = false
local function owner()
    local id = currentID or 'chargen'
    local mode = dwIsChargen and 'chargen' or (dwIsDualclassing and 'dual' or 'levelup')
    return tostring(id)..':'..mode
end
local function reset()
    bridge_owner = nil
    bridge_active = false
    bridge_initialized = false
    dw_thief_skill = nil
    dw_thief_extra = nil
    dw_first_level_profs = nil
    portrait_slot = nil
end
function iscbThiefBegin()
    if type(dw_thiefskill_initialize) ~= 'function' or not chargen or
       type(chargen.thief_skill) ~= 'table' or #chargen.thief_skill == 0 then
        return
    end
    local who = owner()
    if bridge_initialized and bridge_owner == who then return end
    reset()
    bridge_owner = who
    dw_thiefskill_initialize()
    bridge_initialized = true
    bridge_active = type(dw_thief_skill) == 'table'
end
local function ready()
    return bridge_active and bridge_owner == owner()
end
function iscbThiefClickable()
    if ready() then return dw_can_press_thief_button() end
    return createCharScreen:IsThiefSkillPlusMinusButtonClickable()
end
function iscbThiefChange(add)
    if ready() then
        if add then dw_thiefskill_add() else dw_thiefskill_subtract() end
        return
    end
    if chargen and chargen.thief_skill and currentChargenThiefSkill and
       chargen.thief_skill[currentChargenThiefSkill] then
        createCharScreen:OnThiefSkillPlusMinusButtonClick(
            chargen.thief_skill[currentChargenThiefSkill].id, add)
    end
end
function iscbThiefValue(row)
    if ready() then return dw_thiefskill_value(row) end
    return chargen.thief_skill[row].value
end
function iscbThiefRemaining()
    if ready() then return dw_thiefskill_extra_points() end
    return chargen.extraSkillPoints
end
function iscbThiefDoneEnabled()
    if ready() then return dw_thief_skills_finished() end
    return createCharScreen:IsDoneButtonClickable()
end
function iscbThiefDone()
    if not iscbThiefDoneEnabled() then return end
    if ready() then
        if type(dw_thief_skills_implement) ~= 'function' then return end
        -- SCS's pending five-point bonuses are applied only on successful Done.
        dw_thief_skills_implement()
    end
    reset()
    createCharScreen:OnDoneButtonClick()
end
function iscbThiefCancel()
    reset()
    createCharScreen:OnCancelButtonClick()
end
