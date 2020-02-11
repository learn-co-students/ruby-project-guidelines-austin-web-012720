Bush.create
fieldod = Location.create(name: "Field of Despair", description: "Behold the Field of Despair! Marvel at the terrifying and dangerous challenges you must overcome to progress.")
encounter1 = Encounter.create(challenge_id: 1, location_id: 1)

bat = Challenge.create(name: "b-ATTR-ACCESSOR", description: "Hidden in the darkness you see it: due to the turbulent mana emanating deep within the mountain these bats have become influenced by the attr_accessor...they can give just as well as they can take, be careful!", health: 5, stealth: 1, armor: 0, element: nil)
emptycave = Location.create(name: "Empty(?) Cave", description: "Take a moment to rest in this empty cave...wait...do you hear that? Let's take a closer look...")
encounter2 = Encounter.create(challenge_id: 2, location_id: 2)

wolf = Challenge.create(name: "w-ERROR-wolf", description: "After being bitten by a broken but enchanted line of code, these wolves are driven to growl loudly at every full moon. If you could speak wolf you’d know they said ErrorMethod: Undefined method ‘howl_at_moon’.", health: 10, stealth: 1, armor: 0, element: "fire")
jungle = Location.create(name: "Jargon Jungle", description: "As you traverse through the jungle you can feel the hot, foreboding breath of something...evil. However, no matter where you look you can’t find the source. Things are heating up, work fast")
encounter3 = Encounter.create(challenge_id: 3, location_id: 3)

monkey = Challenge.create(name: "Code Monkey", description: "Although they always seem to be busy, you can never find them when you need them for work. After being stuck debugging the same issue for the past 3 months you better be wary!", stealth: 1, health: 15, armor: 1, element: "fire")
cabin = Location.create(name: "Google's Private Cabin", description: "Whenever their top employees are behind schedule Google sends them to this isolated cabin in the woods. The raw, unfiltered magic has slowly changed them into something new and terrifying…")
encounter4 = Encounter.create(challenge_id: 4, location_id: 4)

##spells##
manabolt = Spell.create(name: "Manabolt", damage: 2, element: nil)
frostbolt = Spell.create(name: "Frostbolt", damage: 2, element: "water")
inspect = Spell.create(name: "Inspect", damage: 0, element: nil)