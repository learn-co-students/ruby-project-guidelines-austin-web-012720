bush = Bush.create
fieldod = Location.create(name: "Field of Despair", description: "Behold the Field of Despair! Marvel at the terrifying and dangerous challenges you must overcome to progress.")
encounter1 = Encounter.create(challenge_id: 1, location_id: 1)

bat = Bat.create
emptycave = Location.create(name: "Empty(?) Cave", description: "Take a moment to rest in this empty cave...wait...do you hear that? Let's take a closer look...")
encounter2 = Encounter.create(challenge_id: 2, location_id: 2)

wolf = Werewolf.create
jungle = Location.create(name: "Jargon Jungle", description: "As you traverse through the jungle you can feel the hot, foreboding breath of something...evil. However, no matter where you look you can’t find the source. Things are heating up, work fast")
encounter3 = Encounter.create(challenge_id: 3, location_id: 3)

monkey = CodeMonkey.create
cabin = Location.create(name: "Google's Private Cabin", description: "Whenever their top employees are behind schedule Google sends them to this isolated cabin in the woods. The raw, unfiltered magic has slowly changed them into something new and terrifying…")
encounter4 = Encounter.create(challenge_id: 4, location_id: 4)

##spells##
manabolt = Spell.create(name: "Manabolt", damage: 2, element: nil)
frostbolt = Spell.create(name: "Frostbolt", damage: 2, element: "water")
inspect = Spell.create(name: "Inspect", damage: 0, element: nil)