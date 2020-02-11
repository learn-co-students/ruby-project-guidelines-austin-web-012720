def game_startup
    PROMPT.say("
    +-+ +-+ +-+ +-+ +-+ +-+ +-+    
    |W| |E| |L| |C| |O| |M| |E|    
    +-+ +-+ +-+ +-+ +-+ +-+ +-+    
        |-| |T| |O| |-|        
    +-+ +-+ +-+ +-+ +-+ +-+    
    |~| |R| |U| |B| |Y| |~|    
    +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+
    |~| |W| |I| |Z| |A| |R| |D| |~|
    +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+


    ", color: :bright_red)
    PROMPT.yes?('Is this your first time playing?', help_color: :bright_red, active_color: :green)
    PROMPT.say("Who cares! We don't have enough content for that to matter right now!", color: :bright_red)
end