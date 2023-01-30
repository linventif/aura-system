// -- // -- // -- // -- // -- // -- // -- //
//                                        //
//           General Settings             //
//                                        //
// -- // -- // -- // -- // -- // -- // -- //

LinvAS.Config.ActiveAura = "Vous avez activer votre aura"
LinvAS.Config.DeactiveAura = "Vous avez desactiver votre aura"

// Chat Settings
LinvAS.Config.ChatCommand = {
    ["!aura"] = true,
    ["/aura"] = true,
}

// Aura Settings
LinvAS.Config.AuraDistance = 1000 // Distance max to see the aura
LinvAS.Config.Aura = { // Aura settings
    ["default"] = {
        ["color"] = Color(255, 255, 255),
        ["fade_color"] = Color(255, 255, 255, 20),
        ["shake_force"] = 3,
        ["shake_time"] = 0.5,
        ["blur_x"] = 4,
        ["blur_y"] = 4,
        ["layer"] = 1,
        ["bright"] = false,
        ["wallray"] = false,
        ["chat_msg"] = "Vous resentez une puissance autour de vous",
    },
    ["blue"] = {
        ["color"] = Color(91, 169, 233),
        ["fade_color"] = Color(91, 169, 233, 20),
        ["shake_force"] = 3,
        ["shake_time"] = 0.5,
        ["blur_x"] = 10,
        ["blur_y"] = 40,
        ["layer"] = 2,
        ["bright"] = true,
        ["wallray"] = false,
        ["chat_msg"] = "Vous resentez une imancemante puissance autour de vous",
    },
    ["red"] = {
        ["color"] = Color(255, 0, 0, 255),
        ["fade_color"] = Color(255, 0, 0, 20),
        ["shake_force"] = 3,
        ["shake_time"] = 2,
        ["blur_x"] = 4,
        ["blur_y"] = 4,
        ["layer"] = 1,
        ["bright"] = false,
        ["wallray"] = false,
        ["chat_msg"] = "Vous resentez une grande puissance autour de vous",
    }
}

LinvAS.Config.JobAura = {
    ["Citizen"] = "red"
}

LinvAS.Config.PlayerAura = {
    ["76561198219049673"] = "blue"
}