local AimPart = "Head" -- default


local Dropdown = MainTab:CreateDropdown({
    Name = "Aim Part",
    Options = {
        "Head",
        "Torso"
    },
    CurrentOption = {"Head"},
    MultipleOptions = false,
    Flag = "AimPart",

    Callback = function(Option)
        AimPart = Option[1]
    end,
})
