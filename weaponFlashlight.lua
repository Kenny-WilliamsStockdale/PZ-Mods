local function WeaponLightBeam()

    -- Declare variables
    local attacker = getSpecificPlayer(0)
    local weapon = nil

    if attacker ~= nil then weapon = attacker:getPrimaryHandItem() end
    -- If player has equiped specific weapon in hand and is aiming activate weapon flashlight
    if attacker:isAiming() and attacker:getPrimaryHandItem() and
        (string.find(weapon:getType(), "<weapon-name>")) then
        weapon:setTorchCone(true)
        weapon:setLightDistance(10)
        weapon:setLightStrength(1.5)
    end
    -- If player is not aiming with an equiped weapon that is the a specific weapon then no flashlight
    if not attacker:isAiming() and attacker:getPrimaryHandItem() and
        (string.find(weapon:getType(), "<weapon-name>")) then
        weapon:setTorchCone(false)
        weapon:setLightDistance(0.0)
        weapon:setLightStrength(0.0)
    end
end

Events.OnPlayerUpdate.Add(WeaponLightBeam)
