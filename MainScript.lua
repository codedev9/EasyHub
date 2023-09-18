--// Updates
-- [+] Added BowAimbot
-- [+] Rewrote Keybind System
--// Future Updates
-- [-] Customize keybinds in game
-- [-] Rewrite TPAura and KillAura
-------------------------------------------
local TPAura = false
local KillAura = false
local InfiniteAura = false
local Speed = false
local EasyHub = false
local BowAimbot = false
----------------------------------------
local User = "CoderMatt1" -- Type in your name
local TPAuraSettings = {
   ["Damage"] =  20, -- Damage
   ["Distance"] = 10, -- Max Disance for damage
   ["AttackDelay"] = 1 -- Time between an Attack
}
local KillAuraSettings = {
    ["Damage"] = 20, -- Damage (not based on sword)
    ["MaxDistance"] = 10 -- Distance for a attack to work
}
local BowAimbotSettings = {
   ["Range"] = 10,
   ["OnlyPlayers"] = true
}
---------------------------------------------
local function loadHub(player) -- Don't Touch This 
    MessageService.sendInfo(player, "Welcome To EasyHub!")
    task.wait(0.5)
    MessageService.sendInfo(player, "TPAura: Press G To Toggle")
    task.wait(0.5)
    MessageService.sendInfo(player, "KillAura: Press Y to Toggle")
    task.wait(0.5)
    MessageService.sendInfo(player, "InfiniteAura: Press V to toggle")
    task.wait(0.5)
    MessageService.sendInfo(player, "Speed: Press R to Toggle")
task.wait(0.5)
   MessageService.sendInfo(player, "BowAimbot: Press H to Toggle")
end
-------------------------------------------------
--// KeyBinds //--
-- New Feature!
-- To Use Change the letters where it says KeyCode and thenyour keybind that you want
local TPAuraKey = KeyCode.G
local KillAuraKey = KeyCode.Y 
local SpeedKey = KeyCode.V
local InfiniteAuraKey = KeyCode.R
--// Customize Keybinds //--
-- Beta Feature
-- Allows you to customize the settings of each hack
--// Coming Soon! //--
-------------------------------------------------
InputService.registerInputBegan
Events.PlayerChatted(function (event)
    if event.player.name == User then
        if event.message == "/hub activate" then
            EasyHub = true
        end
    end
end)
InputService.registerInputBegan(TPAuraKey, function (player)
    if player.name == User and EasyHub == true then
        if TPAura == false then
            MessageService(player, "Set TPAura to True")
        elseif TPAura == true then
            MessageService.sendInfo(player, "Set TPAura To False")
        end
    end
end)
InputService.registerInputBegan(KillAuraKey, function (player)
    if player.name == User and EasyHub == true then
        if KillAura == false then
            MessageService(player, "Set KillAura to True")
        elseif KillAura == true then
            MessageService.sendInfo(player, "Set KillAura To False")
        end
    end
end)
InputService.registerInputBegan(InfiniteAuraKey, function (player)
    if player.name == User and EasyHub == true then
        if InfiniteAura == false then
            MessageService(player, "Set InfiniteAura to True")
        elseif InfiniteAura == true then
            MessageService.sendInfo(player, "Set InfiniteAura To False")
        end
    end
end)
InputService.registerInputBegan(SpeedKey, function (player)
    if player.name == User and EasyHub == true then
        if Speed == false then
            MessageService(player, "Set Speed to True")
        elseif Speed == true then
            MessageService.sendInfo(player, "Set Speed To False")
        end
    end
end)
-----------------------------------------------------------------------
--// These are the lines for KillAura, TPAura, InfiniteAura and Speed //--
--// TPAura
Events.WeaponSwing(function (event)
    local entity = event.player.getEntity(event.player).getPosition(event.player).Unit
    local plrsAround = PlayerService.getNearbyPlayers(entity, TPAuraSettings["Distance"])
    local Players = {}
    if plrsAround and EasyHub == true then
        repeat
             task.wait(TPAuraSettings["AttackDelay"])
             CombatService.damage(plrsAround, TPAuraSettings["Damage"])
        until TPAura == false
    end
end)
--// KillAura
Events.EntitySpawn(function (event)
    if event.entity.getPlayer(event.entity).name == User and EasyHub == true then
        local plrs = EntityService.getNearbyEntities(event.entity.getPosition(event.entity).Unit, KillAuraSettings["MaxDistance"])
                if plrs then
                    CombatService.damage(plrs, KillAuraSettings["Damage"], event.entity)
                end
    end
end)
--// InfiniteAura
Events.EntitySpawn(function (event)
    if event.entity.getPlayer(event).name == User and EasyHub == true then
        local pos = event.entity.getPosition(event.entity).Unit
       local plrIn PlayerService.getPlayers()
       if event.entity.getPlayer(plrIn).name ~= User then
          repeat
            task.wait(0.99)
            CombatService.damage(plrIn, 20)
          until event.entity.getPlayer(plrIn).getEntity(plrIn).getHealth(plrIn) <= 0
       end
    end
end)
--// Speed
Events.EntitySpawn(function (event)
    local plr = event.entity
    if plr.isAlive(plr) and plr.getPlayer(plr).name and EasyHub == true then
       plr.getPlayer(plr).registerSpeedMultiplier(plr, "2", 74)
    elseif not plr.isAlive(plr) then
        plr.getPlayer(plr).removeSpeedMultiplier(plr, "2")
    end
end)
--// BowAimbot
Events.ProjectileLaunched(function (event)
    local lplr = event.shooter.getPlayer(event.shooter)
    local plrPos = event.position
    local plrs2 = PlayerService.getNearbyPlayers(plrPos(), 10)
end)
