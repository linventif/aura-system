util.AddNetworkString("LinvAS:Refresh")
util.AddNetworkString("LinvAS:Init")

local ply_active = {}

hook.Add("PlayerSay", "LinvAS:ChatActive", function(ply, text)
    if LinvAS.Config.ChatCommand[string.lower(text)] then
        if LinvAS.Config.PlayerAura[ply:SteamID()] || LinvAS.Config.JobAura[team.GetName(ply:Team())] then
            if ply_active[ply] then
                ply_active[ply] = false
                net.Start("LinvAS:Refresh")
                    net.WriteEntity(ply)
                    net.WriteBool(false)
                net.Broadcast()
            else
                ply_active[ply] = true
                net.Start("LinvAS:Refresh")
                    net.WriteEntity(ply)
                    net.WriteBool(true)
                net.Broadcast()
            end
        end
    end
end)

hook.Add("PlayerDeath", "LinvAS:Death", function(victim, inflictor, attacker)
    if ply_active[victim] then
        ply_active[victim] = false
        net.Start("LinvAS:Refresh")
            net.WriteEntity(victim)
            net.WriteBool(false)
        net.Broadcast()
    end
end)

hook.Add("PlayerDisconnected", "LinvAS:Disconnect", function(ply)
    if ply_active[ply] then
        ply_active[ply] = false
        net.Start("LinvAS:Refresh")
            net.WriteEntity(ply)
            net.WriteBool(false)
        net.Broadcast()
    end
end)

net.Receive("LinvAS:Init", function(len, ply)
    for _, ply in pairs(player.GetAll()) do
        if ply_active[ply] then
            net.Start("LinvAS:Refresh")
                net.WriteEntity(ply)
                net.WriteBool(true)
            net.Send(ply)
        end
    end
end)