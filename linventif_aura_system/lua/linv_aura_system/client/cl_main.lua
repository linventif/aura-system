local ply_active = {}

local function RespW(x)
    return ScrW() / 1920 * x
end

local function RespH(y)
    return ScrH() / 1080 * y
end

local function GetHalo(ply)
    if LinvAS.Config.PlayerAura[ply:SteamID64()] then
        return LinvAS.Config.Aura[LinvAS.Config.PlayerAura[ply:SteamID64()]]
    elseif LinvAS.Config.JobAura[team.GetName(ply:Team())] then
        return LinvAS.Config.Aura[LinvAS.Config.JobAura[team.GetName(ply:Team())]]
    else
        return LinvAS.Config.Aura["default"]
    end
end

local function DrawHighlight()
    for ply, active in pairs(ply_active) do
        if !IsValid(ply) || !ply:Alive() || (LocalPlayer():GetPos():Distance(ply:GetPos()) > LinvAS.Config.AuraDistance) then continue end
        local datahalo = GetHalo(ply)
        halo.Add({ply}, datahalo.color, RespW(datahalo.blur_x), RespH(datahalo.blur_y), datahalo.layer, datahalo.bright, datahalo.wallray)
    end
end

hook.Add("HUDPaint", "AllPlayersHighlight", DrawHighlight)

net.Receive("LinvAS:Refresh", function()
    local ply = net.ReadEntity()
    local active = net.ReadBool()
    if active then
        ply_active[ply] = true
        if ply == LocalPlayer() then
            LocalPlayer():ChatPrint(LinvAS.Config.ActiveAura)
            return
        end
        local datahalo = GetHalo(ply)
        LocalPlayer():ScreenFade(SCREENFADE.IN, datahalo.fade_color, datahalo.shake_time, 0)
        util.ScreenShake(LocalPlayer():GetPos(), datahalo.shake_force, datahalo.shake_force, datahalo.shake_time, 1000)
        LocalPlayer():ChatPrint(datahalo.chat_msg)
    else
        ply_active[ply] = nil
        if ply == LocalPlayer() then
            LocalPlayer():ChatPrint(LinvAS.Config.DeactiveAura)
            return
        end
    end
end)

hook.Add("InitPostEntity", "LinvAS:Init", function()
    net.Start("LinvAS:Init")
    net.SendToServer()
end)