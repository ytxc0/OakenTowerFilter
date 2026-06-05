local p = {}
local items = {
-- Items
	voidspike = {
		DisplayName = "Voidspike",
		Image = "Voidspike.png",
		Rarity = "Common",
		Damage = "18",
		DamageType = "Melee",
		Cooldown = "2.7",
		Tags = "Spear",
		Pack = "Arcane",
		Cost = "25",
		Ability0 = "When you apply a debuff, gain +2 bonus damage.",
		Ability1 = "When you apply a debuff, gain +4 bonus damage.",
		Ability2 = "When you apply a debuff, gain +8 bonus damage.",
		Ability3 = "When you apply a debuff, permanently gain +8 damage."
	},
	arcane_mace = {
		DisplayName = "Arcane Mace",
		Image = "Arcane Mace.png",
		Rarity = "Common",
		Damage = "10",
		DamageType = "Melee",
		Cooldown = "3.2",
		Burn = "3",
		Shock = "1",
		Tags = "Mace",
		Pack = "Arcane",
		Cost = "25",
		Ability2 = "On Trigger: Permanently gain a random debuff.",
		Ability3 = "On Trigger: Permanently gain 2 random debuffs."
	},
	arcane_cleaver = {
		DisplayName = "Arcane Cleaver",
		Image = "Arcane Cleaver.png",
		Rarity = "Rare",
		Damage = "10",
		DamageType = "Melee",
		Cooldown = "3.7",
		Poison = "2",
		Burn = "4",
		Bleed = "1",
		Tags = "Axe",
		Pack = "Arcane",
		Cost = "30",
		Ability2 = "On Trigger: Permanently gain 2 random debuffs.",
		Ability3 = "On Trigger: Permanently gain 4 random debuffs."
	},
	simple_curses = {
		DisplayName = "Simple Curses",
		Image = "Simple Curses.png",
		Rarity = "Rare",
		Damage = "25",
		DamageType = "Ranged",
		Cooldown = "5",
		Tags = "Spell",
		Pack = "Witch",
		Pack2 = "Arcane",
		Cost = "30",
		Ability0 = "On Trigger: Gain 1 random [[Lesser Potion|lesser potion]] per unique debuff this has.",
		Ability1 = "On Trigger: Gain 2 random [[Lesser Potion|lesser potion]] per unique debuff this has.",
		Ability2 = "On Trigger: Gain 2 random [[Vials|vials]] per unique debuff this has.",
		Ability3 = "On Trigger: Gain 2 random [[Potions|potions]] per unique debuff this has."
	},
	arcane_orb = {
		DisplayName = "Arcane Orb",
		Image = "Arcane Orb.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "5",
		Tags = "Orb",
		Pack = "Arcane",
		Cost = "40",
		Ability0 = "On Trigger: Permanently give Arcane item below +1 random debuff.",
		Ability1 = "On Trigger: Permanently give Arcane item below +1 random debuff twice.",
		Ability2 = "On Trigger: Permanently give Arcane item below +1 random debuff 4 times.",
		Ability3 = "On Trigger: Permanently give Arcane item below +1 random debuff 6 times and trigger it."
	},
	wild_magic = {
		DisplayName = "Wild Magic",
		Image = "Wild Magic.png",
		Rarity = "Epic",
		Damage = "35",
		DamageType = "Ranged",
		Cooldown = "2.9",
		Tags = "Spell",
		Pack = "Arcane",
		Cost = "35",
		Ability0 = "Start of Combat: Permanently transform item to the right into a random plain item.",
		Ability1 = "Start of Combat: Permanently transform item to the right into a random 1-Star item.",
		Ability2 = "Start of Combat: Permanently transform item to the right into a random 2-Star item.",
		Ability3 = "Start of Combat: Permanently transform item to the right into a random 3-Star item."
	},
	runic_shield = {
		DisplayName = "Runic Shield",
		Image = "Runic Shield.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "3.3",
		Multicast = "1",
		Poison = "2",
		Burn = "3",
		Shock = "2",
		Block = "20",
		Tags = "Shield",
		Pack = "Arcane",
		Cost = "45",
		Ability2 = "On Trigger: Permanently gain +1 random debuff.",
		Ability3 = "On Trigger: Permanently gain +1 random debuff per Arcane item."
	},
	soulsplitter = {
		DisplayName = "Soulsplitter",
		Image = "Soulsplitter.png",
		Rarity = "Legendary",
		Damage = "25",
		DamageType = "Melee",
		Cooldown = "2.6",
		Tags = "Axe",
		Pack = "Arcane",
		Cost = "50",
		Ability0 = "Start of Combat: Gain +2 bonus multicast per unique debuff this has.",
		Ability1 = "Start of Combat: Gain +4 bonus multicast per unique debuff this has.",
		Ability2 = "Start of Combat: Gain +8 bonus multicast and +5 bonus damage per unique debuff this has.",
		Ability3 = "Start of Combat: Permanently gain +8 multicast and +15 DMG per unique debuff this has."
	},
	void_stinger = {
		DisplayName = "Void Stinger",
		Image = "Voidstinger.png",
		Rarity = "Legendary",
		Damage = "45",
		DamageType = "Melee",
		Cooldown = "2.4",
		Poison = "2",
		Burn = "2",
		Bleed = "2",
		Tags = "Sword",
		Pack = "Arcane",
		Cost = "45",
		Ability0 = "When you apply a debuff, permanently gain +1 damage.",
		Ability1 = "When you apply a debuff, permanently gain +2 damage.",
		Ability2 = "When you apply a debuff, permanently gain +4 damage.",
		Ability3 = "When you apply a debuff, permanently gain +5 damage and a random debuff."
	},
	ruby_knife = {
		DisplayName = "Ruby Knife",
		Image = "Ruby Knife.png",
		Rarity = "Common",
		Damage = "5",
		DamageType = "Melee",
		Cooldown = "3.3",
		Bleed = "2",
		Tags = "Dagger",
		Pack = "Crystal",
		Cost = "30",
		Ability2 = "On First Trigger: Permanently gain +3 bleed.",
		Ability3 = "On First Trigger: Permanently gain +6 bleed."
	},
	snowflakes = {
		DisplayName = "Snowflakes",
		Image = "Snowflakes.png",
		Rarity = "Common",
		Damage = "8",
		DamageType = "Ranged",
		Cooldown = "2.4",
		Crit = "25",
		Bleed = "1",
		Tags = "Spell",
		Pack = "Frosty",
		Pack2 = "Crystal",
		Cost = "25",
		Ability2 = "Start of Combat: Permanently reduce cooldown by 0.2s",
		Ability3 = "Start of Combat: Permanently reduce cooldown by 0.2s. This applies bleed twice."
	},
	amethyst_bow = {
		DisplayName = "Amethyst Bow",
		Image = "Amethyst Bow.png",
		Rarity = "Rare",
		Damage = "8",
		DamageType = "Ranged",
		Cooldown = "3.9",
		Multicast = "1",
		Bleed = "1",
		Tags = "Bow",
		Pack = "Crystal",
		Cost = "35",
		Ability2 = "On Trigger: 10% chance to apply +12 bleed.",
		Ability3 = "On Trigger: Gain +1 bonus bleed and 10% chance to apply +12 bleed."
	},
	poison_dagger = {
		DisplayName = "Poison Dagger",
		Image = "Poison Dagger.png",
		Rarity = "Rare",
		Damage = "8",
		DamageType = "Melee",
		Cooldown = "2.9",
		Poison = "3",
		Tags = "Dagger",
		Pack = "Elven",
		Pack2 = "Crystal",
		Cost = "35",
		Ability2 = "This item applies debuffs 2 times.",
		Ability3 = "This item applies debuffs 4 times."
	},
	diamond_axe = {
		DisplayName = "Diamond Axe",
		Image = "Diamond Axe.png",
		Rarity = "Rare",
		Damage = "10",
		DamageType = "Melee",
		Cooldown = "2.9",
		Bleed = "1",
		Shock = "1",
		Tags = "Axe",
		Pack = "Crystal",
		Pack2 = "Storm",
		Cost = "30",
		Ability0 = "Every 10 triggers of item below: gain +2 bonus bleed and +2 bonus shock.",
		Ability1 = "Every 10 triggers of item below: gain +4 bonus bleed and +4 bonus shock.",
		Ability2 = "Every 10 triggers of item below: gain +6 bonus bleed and +6 bonus shock.",
		Ability3 = "On every trigger of item below: Permanently gain +1 bleed and shock."
	},
	amber = {
		DisplayName = "Amber",
		Image = "Amber.png",
		Rarity = "Epic",
		Damage = "0",
		DamageType = "Melee",
		Cooldown = "3.7",
		Bleed = "1",
		Tags = "Amulet",
		Pack = "Crystal",
		Cost = "35",
		Ability0 = "On Trigger: Trigger crystal item to the left of this.",
		Ability1 = "On Trigger: Trigger crystal item to the left of this twice.",
		Ability2 = "On Trigger: Trigger crystal item to the left of this thrice.",
		Ability3 = "On Trigger: Trigger crystal item to the left thrice and permanently give it +1 bleed."
	},
	topaz_spear = {
		DisplayName = "Topaz Spear",
		Image = "Topaz Spear.png",
		Rarity = "Epic",
		Damage = "15",
		DamageType = "Melee",
		Cooldown = "4.6",
		Bleed = "10",
		Tags = "Spear",
		Pack = "Crystal",
		Cost = "40",
		Ability2 = "Start of Combat: Apply 20 bleed.",
		Ability3 = "Start of Combat: Apply 40 bleed."
	},
	shardfang = {
		DisplayName = "Shardfang",
		Image = "Shardfang.png",
		Rarity = "Legendary",
		Damage = "25",
		DamageType = "Melee",
		Cooldown = "2",
		Tags = "Dagger",
		Pack = "Crystal",
		Cost = "50",
		Ability0 = "When another item applies bleed, trigger this. This can't get bleed.",
		Ability1 = "When another item applies bleed, trigger this twice. This can't get bleed.",
		Ability2 = "When another item applies bleed, trigger this thrice.",
		Ability3 = "When another item applies bleed, apply 5 extra and trigger this 4 times."
	},
	emerald_sword = {
		DisplayName = "Emerald Sword",
		Image = "Emerald Sword.png",
		Rarity = "Legendary",
		Damage = "20",
		DamageType = "Melee",
		Cooldown = "2.3",
		Bleed = "3",
		Tags = "Sword",
		Pack = "Crystal",
		Cost = "45",
		Ability0 = "Start of Combat: Give your Crystal items +1 bonus bleed.",
		Ability1 = "Start of Combat: Give your Crystal items +2 bonus bleed.",
		Ability2 = "Start of Combat: Give your crystal items +4 bonus bleed.",
		Ability3 = "Start of Combat: Permanently give your Crystal items +4 bleed."
	},
	twilights_edge = {
		DisplayName = "Twilight's Edge",
		Image = "Twilights Edge.png",
		Rarity = "Common",
		Damage = "45",
		DamageType = "Melee",
		Cooldown = "5",
		Tags = "Sword",
		Pack = "Dark",
		Cost = "25",
		Ability0 = "Start of Combat: Permanently gain +7 damage.",
		Ability1 = "Start of Combat: Permanently gain +14 damage.",
		Ability2 = "Start of Combat: Permanently gain +28 damage.",
		Ability3 = "Start of Combat: Permanently gain +100 damage."
	},
	dusk_shield = {
		DisplayName = "Dusk Shield",
		Image = "Dusk Shield.png",
		Rarity = "Rare",
		DamageType = "Melee",
		Cooldown = "2.6",
		Block = "25",
		Tags = "Shield",
		Pack = "Dark",
		Cost = "30",
		Ability0 = "Start of Combat: Shield for 100.",
		Ability1 = "Start of Combat: Shield for 200.",
		Ability2 = "Start of Combat: Shield equal to 33% of your max HP.",
		Ability3 = "Start of Combat and On Trigger: Shield equal to 33% of your max HP."
	},
	trident = {
		DisplayName = "Trident",
		Image = "Trident.png",
		Rarity = "Rare",
		Damage = "15",
		DamageType = "Melee",
		Cooldown = "2.2",
		Tags = "Spear",
		Pack = "Dark",
		Cost = "30",
		Ability0 = "Start of Combat: Apply 5 bleed.",
		Ability1 = "Start of Combat: Apply 10 bleed.",
		Ability2 = "Start of Combat: Apply 20 bleed. This triggers bleed twice on hit.",
		Ability3 = "Start of Combat: Apply 40 bleed. This triggers bleed 4 times on hit."
	},
	eclipse = {
		DisplayName = "Eclipse",
		Image = "Eclipse.png",
		Rarity = "Rare",
		Damage = "20",
		DamageType = "Melee",
		Cooldown = "2.6",
		Tags = "Dagger",
		Pack = "Dark",
		Cost = "35",
		Ability0 = "Start of Combat: Permanently gain +4 damage per dark item.",
		Ability1 = "Start of Combat: Permanently gain +8 damage per dark item.",
		Ability2 = "Start of Combat: Permanently gain +16 damage per other dark item.",
		Ability3 = "Start of Combat: Permanently give your dark items +30 damage."
	},
	executioner = {
		DisplayName = "Executioner",
		SecondName = "Dexecutioner",
		Image = "Executioner.png",
		Rarity = "Epic",
		Damage = "50",
		DamageType = "Melee",
		Cooldown = "2.8",
		Crit = "40",
		Tags = "Axe",
		Pack = "Dark",
		Cost = "40",
		Ability0 = "When the enemy reaches 15% HP or less, instantly execute them.",
		Ability1 = "When the enemy reaches 20% HP or less, instantly execute them.",
		Ability2 = "When the enemy reaches 25% HP or less, instantly execute them.",
		Ability3 = "When the enemy reaches 40% HP or less, instantly execute them."
	},
	dark_necklace = {
		DisplayName = "Dark Necklace",
		Image = "Dark Necklace.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "9",
		Tags = "Amulet",
		Pack = "Dark",
		Cost = "45",
		Ability0 = "On Trigger: Trigger your items' Start of Combat effects.",
		Ability1 = "On Trigger: Trigger your items' Start of Combat effects twice.",
		Ability2 = "On Trigger: Trigger your items' Start of Combat effects thrice.",
		Ability3 = "On Trigger: Trigger your items' Start of Combat effects 4 times."
	},
	decay = {
		DisplayName = "Decay",
		Image = "Decay.png",
		Rarity = "Epic",
		Damage = "40",
		DamageType = "Ranged",
		Cooldown = "2",
		Tags = "Spell",
		Pack = "Dark",
		Cost = "40",
		Ability0 = "Start of Combat: Deal 250 damage.",
		Ability1 = "Start of Combat: Deal 500 damage.",
		Ability2 = "Start of Combat: Deal 1000 damage.",
		Ability3 = "Start of Combat: Deal 2000 damage."
	},
	nightfall = {
		DisplayName = "Nightfall",
		Image = "Nightfall.png",
		Rarity = "Legendary",
		Damage = "40",
		DamageType = "Melee",
		Cooldown = "4.4",
		Tags = "Spear",
		Pack = "Dark",
		Cost = "45",
		Ability0 = "Start of Combat: Permanently gain +25 DMG and +15% crit chance.",
		Ability1 = "Start of Combat: Permanently gain +50 DMG and +30% crit chance.",
		Ability2 = "Start of Combat: Permanently gain +75 DMG and +45% crit chance.",
		Ability3 = "Start of Combat: Permanently gain +150 DMG and +1 multicast."
	},
	bat_wing = {
		DisplayName = "Bat Wing",
		Image = "Bat Wing.png",
		Rarity = "Legendary",
		Damage = "40",
		DamageType = "Ranged",
		Cooldown = "5.2",
		Tags = "Bow",
		Pack = "Dark",
		Cost = "50",
		Ability0 = "Start of Combat: Permanently gain +3 multicast.",
		Ability1 = "Start of Combat: Permanently gain +6 multicast.",
		Ability2 = "Start of Combat: Permanently gain +12 multicast and +25 damage.",
		Ability3 = "Start of Combat: Permanently gain damage equal to this item's multicast."
	},
	elven_shield = {
		DisplayName = "Elven Shield",
		Image = "Elven Shield.png",
		Rarity = "Common",
		DamageType = "Melee",
		Cooldown = "3.4",
		Poison = "2",
		Block = "15",
		Tags = "Shield",
		Pack = "Elven",
		Cost = "30",
		Ability2 = "Start of Combat: Permanently gain +1 multicast.",
		Ability3 = "Start of Combat: Permanently gain +3 multicast and +8 poison."
	},
	petal_staff = {
		DisplayName = "Petal Staff",
		Image = "Petal Staff.png",
		Rarity = "Common",
		DamageType = "Melee",
		Cooldown = "4.1",
		Poison = "2",
		Tags = "Magic",
		Pack = "Elven",
		Cost = "35",
		Ability0 = "On First 2 Triggers: Permanently gain +1 poison.",
		Ability1 = "On First 2 Triggers: Permanently gain +2 poison.",
		Ability2 = "On First 2 Triggers: Permanently gain +4 poison",
		Ability3 = "On Trigger: Permanently gain +5 poison and trigger poison damage on enemy."
	},
	refined_spear = {
		DisplayName = "Refined Spear",
		Image = "Refined Spear.png",
		Rarity = "Common",
		Damage = "15",
		DamageType = "Melee",
		Cooldown = "2.3",
		Tags = "Spear",
		Pack = "Elven",
		Cost = "15",
		Ability2 = "Start of Combat: Permanently gain +12 damage.",
		Ability3 = "Start of Combat and On Trigger: Permanently gain +12 damage."
	},
	poison_dagger = {
		DisplayName = "Poison Dagger",
		Image = "Poison Dagger.png",
		Rarity = "Rare",
		Damage = "8",
		DamageType = "Melee",
		Cooldown = "2.9",
		Poison = "3",
		Tags = "Dagger",
		Pack = "Elven",
		Pack2 = "Crystal",
		Cost = "35",
		Ability2 = "This item applies debuffs 2 times.",
		Ability3 = "This item applies debuffs 4 times."
	},
	how_to_grow = {
		DisplayName = "How To Grow",
		Image = "How To Grow.png",
		Rarity = "Rare",
		DamageType = "Melee",
		Cooldown = "5.5",
		Tags = "Spell",
		Pack = "Elven",
		Cost = "30",
		Ability0 = "On Trigger: Give Elven item to the right +3 damage permanently.",
		Ability1 = "On Trigger: Give Elven item to the right +6 damage permanently.",
		Ability2 = "On Trigger: Give Elven item to the right +12 damage permanently.",
		Ability3 = "On Trigger: Give all your Elven items +12 damage permanently."
	},
	elvish_orb = {
		DisplayName = "Elvish Orb",
		Image = "Elvish Orb.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "13",
		Tags = "Orb",
		Pack = "Elven",
		Cost = "50",
		Ability0 = "On Trigger: Give elven item above +1 multicast permanently (This can't get multicast).",
		Ability1 = "On Trigger: Give elven item above +2 multicast permanently (This can't get multicast).",
		Ability2 = "On Trigger: Give elven item above +4 multicast permanently (This can't get multicast).",
		Ability3 = "On Trigger: Give elven item above +5 multicast permanently and trigger it."
	},
	refined_bow = {
		DisplayName = "Refined Bow",
		Image = "Refined Bow.png",
		Rarity = "Epic",
		Damage = "30",
		DamageType = "Ranged",
		Cooldown = "3",
		Crit = "20",
		Tags = "Bow",
		Pack = "Elven",
		Cost = "40",
		Ability0 = "Start of Combat: Gain +1 bonus multicast per Elven item.",
		Ability1 = "Start of Combat: Gain +2 bonus multicast per Elven item.",
		Ability2 = "Start of Combat: Gain +4 bonus multicast per Elven item.",
		Ability3 = "Start of Combat: Trigger this infinitely."
	},
	razorleaf = {
		DisplayName = "Razorleaf",
		Image = "Razorleaf.png",
		Rarity = "Legendary",
		Damage = "10",
		DamageType = "Ranged",
		Cooldown = "10",
		Multicast = "10",
		Tags = "Spell",
		Pack = "Elven",
		Cost = "55",
		Ability0 = "When another Elven item triggers, remove 1 second from this item's current cooldown.",
		Ability1 = "When another Elven item triggers, remove 2 seconds from this item's current cooldown.",
		Ability2 = "When another Elven item triggers, trigger this and gain +1 bonus damage.",
		Ability3 = "When another Elven item triggers, trigger this and gain +1 damage permanently."
	},
	venom_ring = {
		DisplayName = "Venom Ring",
		Image = "Venom Ring.png",
		Rarity = "Legendary",
		DamageType = "Melee",
		Cooldown = "4.8",
		Poison = "5",
		Tags = "Ring",
		Pack = "Elven",
		Cost = "45",
		Ability0 = "On Trigger: Permanently gain +1 poison per poison item.",
		Ability1 = "On Trigger: Permanently gain +2 poison per poison item.",
		Ability2 = "On Trigger: Permanently gain +16 poison.",
		Ability3 = "On Trigger: Permanently gain +20 poison. This applies poison twice."
	},
	flare = {
		DisplayName = "Flare",
		Image = "Flare.png",
		Rarity = "Common",
		DamageType = "Melee",
		Cooldown = "4.1",
		Burn = "1",
		Tags = "Artifact",
		Pack = "Flame",
		Cost = "30",
		Ability0 = "On Trigger: Give your burn items +1 bonus burn.",
		Ability1 = "On Trigger: Give your burn items +2 bonus burn.",
		Ability2 = "On Trigger: Give your burn items +4 bonus burn.",
		Ability3 = "On Trigger: Give your burn items +2 burn permanently."
	},
	wildfire = {
		DisplayName = "Wildfire",
		Image = "Wildfire.png",
		Rarity = "Common",
		DamageType = "Melee",
		Cooldown = "3.7",
		Burn = "4",
		Tags = "Spell",
		Pack = "Flame",
		Cost = "20",
		Ability2 = "On Trigger: Permanently gain +1 burn.",
		Ability3 = "On Trigger: Permanently gain +2 burn."
	},
	molten_bow = {
		DisplayName = "Molten Bow",
		Image = "Molten Bow.png",
		Rarity = "Rare",
		Damage = "5",
		DamageType = "Ranged",
		Cooldown = "4",
		Multicast = "1",
		Burn = "3",
		Tags = "Bow",
		Pack = "Flame",
		Cost = "35",
		Ability2 = "Start of Combat: Permanently gain +2 burn.",
		Ability3 = "On Trigger: Permanently gain +1 burn."
	},
	staff_of_zeus = {
		DisplayName = "Staff of Zeus",
		Image = "Staff of Zeus.png",
		Rarity = "Rare",
		DamageType = "Melee",
		Cooldown = "2.9",
		Burn = "2",
		Shock = "1",
		Tags = "Magic",
		Pack = "Storm",
		Pack2 = "Flame",
		Cost = "35",
		Ability0 = "[[:Category:Burn|Burn]] ticks 25% faster. [[:Category:Shock|Shock]] triggers twice.",
		Ability1 = "[[:Category:Burn|Burn]] ticks 50% faster.[[:Category:Shock|Shock]] triggers thrice.",
		Ability2 = "[[:Category:Burn|Burn]] ticks 75% faster. [[:Category:Shock|Shock]] triggers 4 times.",
		Ability3 = "[[:Category:Burn|Burn]] ticks 150% faster. [[:Category:Shock|Shock]] trigger instantly."
	},
	fire_orb = {
		DisplayName = "Fire Orb",
		Image = "Fire Orb.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "5.1",
		Burn = "5",
		Tags = "Orb",
		Pack = "Flame",
		Cost = "40",
		Ability0 = "On Trigger: Permanently give Flame item to the right +2 burn.",
		Ability1 = "On Trigger: Permanently give Flame item to the right +4 burn.",
		Ability2 = "On Trigger: Permanently give Flame item to the right +4 burn and trigger it.",
		Ability3 = "On Trigger: Permanently give Flame item to the right +8 burn and trigger it twice."
	},
	fire_mace = {
		DisplayName = "Fire Mace",
		Image = "Fire Mace.png",
		Rarity = "Epic",
		Damage = "10",
		DamageType = "Melee",
		Cooldown = "2.5",
		Burn = "8",
		Tags = "Mace",
		Pack = "Flame",
		Cost = "40",
		Ability2 = "On Trigger: Permanently gain +3 burn.",
		Ability3 = "On Trigger: Permanently gain +6 burn."
	},
	blazing_bull = {
		DisplayName = "Blazing Bull",
		Image = "Blazing Bull.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "3.6",
		Burn = "4",
		Block = "10",
		Tags = "Shield",
		Pack = "Flame",
		Cost = "45",
		Ability0 = "When you apply burn, gain that much bonus shield.",
		Ability1 = "When you apply burn, gain twice that much bonus shield.",
		Ability2 = "When you apply burn, apply 5 extra and gain twice the amount as bonus shield.",
		Ability3 = "When you apply burn, permanently gain twice the amount as shield."
	},
	fiery_war_axe = {
		DisplayName = "Fiery War Axe",
		Image = "Fiery War Axe.png",
		Rarity = "Legendary",
		Damage = "10",
		DamageType = "Melee",
		Cooldown = "2.9",
		Burn = "10",
		Tags = "Axe",
		Pack = "Flame",
		Cost = "55",
		Ability0 = "When you apply burn, gain that much bonus damage.",
		Ability1 = "When you apply burn, gain twice that amount as bonus damage.",
		Ability2 = "When you apply burn, permanently gain that much damage.",
		Ability3 = "When you apply burn, permanently gain twice the amount as damage."
	},
	doom_guide = {
		DisplayName = "Doom Guide",
		Image = "Doom Guide.png",
		Rarity = "Legendary",
		Damage = "2000",
		DamageType = "Ranged",
		Cooldown = "18",
		Tags = "Spell",
		Pack = "Flame",
		Cost = "60",
		Ability2 = "Start of Combat: Gain +500 bonus burn.",
		Ability3 = "Start of Combat: Permanently gain +500 burn."
	},
	icy_axe = {
		DisplayName = "Icy Axe",
		Image = "Icy Axe.png",
		Rarity = "Common",
		Damage = "25",
		DamageType = "Melee",
		Cooldown = "3.8",
		Crit = "50",
		Tags = "Axe",
		Pack = "Frosty",
		Cost = "20",
		Ability2 = "On First Trigger: Trigger this an extra time.",
		Ability3 = "On First Trigger: Trigger this 2 extra times."
	},
	coldshot = {
		DisplayName = "Coldshot",
		Image = "Coldshot.png",
		Rarity = "Rare",
		Damage = "5",
		DamageType = "Ranged",
		Cooldown = "3",
		Crit = "50",
		Tags = "Bow",
		Pack = "Frosty",
		Cost = "35",
		Ability0 = "When another frosty item triggers, trigger this.",
		Ability1 = "When another frosty item triggers, trigger this twice.",
		Ability2 = "When another frosty item triggers, trigger this 4 times.",
		Ability3 = "When another frosty item triggers, trigger this 5 times and gain +5 bonus DMG."
	},
	ice_spear = {
		DisplayName = "Ice Spear",
		Image = "Ice Spear.png",
		Rarity = "Rare",
		Damage = "20",
		DamageType = "Melee",
		Cooldown = "2.4",
		Tags = "Spear",
		Pack = "Frosty",
		Cost = "25",
		Ability0 = "On Trigger: Permanently gain +2% crit chance.",
		Ability1 = "On Trigger: Permanently gain +4% crit chance.",
		Ability2 = "On Trigger: Permanently gain +8% crit chance and +4 damage.",
		Ability3 = "On Trigger: Permanently gain +16% crit chance and +8 damage."
	},
	frozen_orb = {
		DisplayName = "Frozen Orb",
		Image = "Frozen Orb.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "5.2",
		Tags = "Orb",
		Pack = "Frosty",
		Cost = "50",
		Ability0 = "On Trigger: Trigger your other Frosty items.",
		Ability1 = "On Trigger: Trigger your other Frosty items twice.",
		Ability2 = "On Trigger: Trigger your other Frosty items thrice.",
		Ability3 = "On Trigger: Trigger your other Frosty items 4 times and give them +50% bonus crit."
	},
	glacier = {
		DisplayName = "Glacier",
		Image = "Glacier.png",
		Rarity = "Epic",
		Damage = "35",
		DamageType = "Melee",
		Cooldown = "2.5",
		Tags = "Sword",
		Pack = "Frosty",
		Cost = "45",
		Ability0 = "Whenever a Frosty item triggers, permanently gain +2% crit chance.",
		Ability1 = "Whenever a Frosty item triggers, permanently gain +4% crit chance.",
		Ability2 = "Whenever a Frosty item triggers, permanently gain +8% crit and +5 DMG.",
		Ability3 = "Whenever a Frosty item triggers, permanently gain +16% crit and +10 DMG."
	},
	frostbound = {
		DisplayName = "Frostbound",
		Image = "Frostbound.png",
		Rarity = "Legendary",
		Damage = "30",
		DamageType = "Ranged",
		Cooldown = "3",
		Crit = "60",
		Tags = "Spell",
		Pack = "Frosty",
		Cost = "50",
		Ability0 = "Whenever an item crits, permanently gain +2 damage.",
		Ability1 = "Whenever an item crits, permanently gain +4 damage.",
		Ability2 = "Whenever an item crits, permanently gain +8 damage.",
		Ability3 = "Whenever an item crits, permanently give all your items +8 damage."
	},
	sapphire_amulet = {
		DisplayName = "Sapphire Amulet",
		Image = "Sapphire Amulet.png",
		Rarity = "Legendary",
		DamageType = "Melee",
		Cooldown = "7",
		Tags = "Amulet",
		Pack = "Frosty",
		Cost = "45",
		Ability0 = "Increases your critical strike damage from 2x to 3x.",
		Ability1 = "Increases your critical strike damage from 2x to 4x.",
		Ability2 = "Increases your critical strike damage from 2x to 5x.",
		Ability3 = "Increases your critical strike damage from 2x to 6x."
	},
	winters_embrace = {
		DisplayName = "Winter's Embrace",
		Image = "Winters Embrace.png",
		Rarity = "Legendary",
		Damage = "40",
		DamageType = "Ranged",
		Cooldown = "6",
		Crit = "20",
		Multicast = "2",
		Tags = "Spell",
		Pack = "Moon",
		Pack2 = "Frosty",
		Cost = "50",
		Ability0 = "When you crit, gain +1 bonus multicast.",
		Ability1 = "When you crit, gain +2 bonus multicast.",
		Ability2 = "When you crit, permanently gain +2 multicast.",
		Ability3 = "When you crit, gain +2 multicast and +2 damage permanently."
	},
	healing_word = {
		DisplayName = "Healing Word",
		Image = "Healing Word.png",
		Rarity = "Common",
		DamageType = "Melee",
		Cooldown = "3",
		Healing = "10",
		Tags = "Spell",
		Pack = "Holy",
		Cost = "25",
		Ability0 = "On Trigger: Gain +3 bonus heal.",
		Ability1 = "On Trigger: Gain +6 bonus heal.",
		Ability2 = "On Trigger: Gain +12 bonus heal.",
		Ability3 = "On Trigger: Permanently gain +12 heal."
	},
	paladins_hammer = {
		DisplayName = "Paladin's Hammer",
		Image = "Paladins Hammer.png",
		Rarity = "Common",
		Damage = "8",
		DamageType = "Melee",
		Cooldown = "2.6",
		Healing = "20",
		Tags = "Mace",
		Pack = "Holy",
		Cost = "25",
		Ability0 = "On Trigger: If you have 25+ of a debuff, cleanse 5 of it.",
		Ability1 = "On Trigger: If you have 25+ of a debuff, cleanse 10 of it.",
		Ability2 = "On Trigger: Cleanse 15 of all debuffs.",
		Ability3 = "On Trigger: Cleanse 20 of all debuffs and permanently gain +5 heal."
	},
	divine_axe = {
		DisplayName = "Divine Axe",
		Image = "Divine Axe.png",
		Rarity = "Common",
		Damage = "10",
		DamageType = "Melee",
		Cooldown = "3",
		Healing = "15",
		Tags = "Axe",
		Pack = "Holy",
		Cost = "25",
		Ability0 = "Every 3 Triggers: Cleanse 5 of each debuff.",
		Ability1 = "Every 3 Triggers: Cleanse 10 of each debuff.",
		Ability2 = "Every 3 Triggers: Cleanse 20 of each debuff.",
		Ability3 = "On Trigger: Cleanse 20 of each debuff."
	},
	healers_oath = {
		DisplayName = "Healer's Oath",
		Image = "Healers Oath.png",
		Rarity = "Rare",
		Damage = "15",
		DamageType = "Melee",
		Cooldown = "2.9",
		Tags = "Mace",
		Pack = "Holy",
		Cost = "40",
		Ability0 = "When another item heals, trigger this.",
		Ability1 = "When another item heals, trigger this twice.",
		Ability2 = "When another item heals, gain +2 bonus heal and trigger this thrice.",
		Ability3 = "When another item heals, permanently gain +3 heal and trigger this 4 times."
	},
	lightblade = {
		DisplayName = "Lightblade",
		Image = "Lightblade.png",
		Rarity = "Rare",
		Damage = "10",
		DamageType = "Melee",
		Cooldown = "3.3",
		Healing = "45",
		Tags = "Sword",
		Pack = "Holy",
		Cost = "35",
		Ability2 = "On Trigger: Gain +200 Max Health.",
		Ability3 = "On Trigger: Gain +400 Max Health."
	},
	holy_sigil = {
		DisplayName = "Holy Sigil",
		Image = "Holy Sigil.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "3.8",
		Healing = "40",
		Tags = "Artifact",
		Pack = "Holy",
		Cost = "40",
		Ability0 = "On Trigger: Trigger holy item to the left.",
		Ability1 = "On Trigger: Trigger holy item to the left twice.",
		Ability2 = "On Trigger: Trigger holy item to the left thrice.",
		Ability3 = "On Trigger: Trigger holy item to the left 4 times and permanently give it +50 heal."
	},
	solaris = {
		DisplayName = "Solaris",
		Image = "Solaris.png",
		Rarity = "Epic",
		Damage = "15",
		DamageType = "Melee",
		Cooldown = "2.9",
		Multicast = "2",
		Healing = "10",
		Tags = "Axe",
		Pack = "Holy",
		Cost = "40",
		Ability2 = "Start of Combat: Permanently gain +1 multicast and +10 heal.",
		Ability3 = "Start of Combat: Permanently gain +2 multicast and +20 heal."
	},
	redemption = {
		DisplayName = "Redemption",
		Image = "Redemption.png",
		Rarity = "Legendary",
		Damage = "25",
		DamageType = "Melee",
		Cooldown = "4.5",
		Healing = "50",
		Tags = "Mace",
		Pack = "Holy",
		Cost = "50",
		Ability0 = "Whenever you heal, permanently gain +1 damage and +2 heal.",
		Ability1 = "Whenever you heal, permanently gain +2 damage and +4 heal.",
		Ability2 = "Whenever you heal, permanently gain +4 damage and +8 heal.",
		Ability3 = "Whenever you heal, permanently gain +4 damage and +8 heal. Then trigger this."
	},
	protector = {
		DisplayName = "Protector",
		Image = "Protector.png",
		Rarity = "Legendary",
		DamageType = "Melee",
		Cooldown = "2.8",
		Block = "30",
		Healing = "20",
		Tags = "Shield",
		Pack = "Holy",
		Cost = "50",
		Ability0 = "On Trigger: Cleanse 20% of your debuffs.",
		Ability1 = "On Trigger: Cleanse 40% of your debuffs.",
		Ability2 = "On Trigger: Cleanse 70% of your debuffs.",
		Ability3 = "This grants immunity to debuffs."
	},
	moon_knife = {
		DisplayName = "Moon Knife",
		Image = "Moon Knife.png",
		Rarity = "Common",
		Damage = "15",
		DamageType = "Melee",
		Cooldown = "2.4",
		Tags = "Dagger",
		Pack = "Moon",
		Cost = "30",
		Ability0 = "When obtained: Also gain +16 XP.",
		Ability1 = "When obtained: Also gain +24 XP.",
		Ability2 = "When obtained: Also gain +32 XP.",
		Ability3 = "When obtained: Also gain a level. On Trigger: Permanently gain DMG equal to 2x level."
	},
	silver_lance = {
		DisplayName = "Silver Lance",
		Image = "Silver Lance.png",
		Rarity = "Common",
		Damage = "10",
		DamageType = "Melee",
		Cooldown = "2.5",
		Multicast = "1",
		Tags = "Spear",
		Pack = "Moon",
		Cost = "20",
		Ability2 = "On Trigger: Deal 15 bonus damage.",
		Ability3 = "On Trigger: Deal 30 bonus damage."
	},
	crescentshot = {
		DisplayName = "Crescentshot",
		Image = "Crescentshot.png",
		Rarity = "Rare",
		Damage = "8",
		DamageType = "Ranged",
		Cooldown = "3.4",
		Multicast = "3",
		Tags = "Bow",
		Pack = "Moon",
		Cost = "25",
		Ability2 = "On Trigger: Gain +1 bonus damage.",
		Ability3 = "On Trigger: Permanently gain +2 damage."
	},
	lunar_codex = {
		DisplayName = "Lunar Codex",
		Image = "Lunar Codex.png",
		Rarity = "Rare",
		Damage = "15",
		DamageType = "Ranged",
		Cooldown = "3.3",
		Tags = "Spell",
		Pack = "Moon",
		Cost = "35",
		Ability0 = "When you level up, permanently gain +1 multicast.",
		Ability1 = "When you level up, permanently gain +2 multicast.",
		Ability2 = "When you level up, permanently gain +4 multicast.",
		Ability3 = "When you level up, permanently gain +4 multicast and +25 damage."
	},
	high_blade = {
		DisplayName = "High Blade",
		Image = "Highblade.png",
		Rarity = "Epic",
		Damage = "35",
		DamageType = "Melee",
		Cooldown = "5",
		Multicast = "1",
		Tags = "Sword",
		Pack = "Moon",
		Cost = "40",
		Ability0 = "Start of Combat: Permanently reduce cooldown by 0.2s per Moon item.",
		Ability1 = "Start of Combat: Permanently reduce cooldown by 0.4s per Moon item.",
		Ability2 = "Start of Combat: Permanently gain +5 damage per Moon item.",
		Ability3 = "Start of Combat: Permanently gain +10 damage per Moon item."
	},
	moonstone = {
		DisplayName = "Moonstone",
		Image = "Moonstone.png",
		Rarity = "Epic",
		Damage = "10",
		DamageType = "Melee",
		Cooldown = "2.8",
		Multicast = "4",
		Tags = "Mace",
		Pack = "Moon",
		Cost = "30",
		Ability2 = "Start of Combat: Permanently gain +2 damage per Moon item.",
		Ability3 = "Start of Combat: Permanently gain +4 damage per Moon item."
	},
	lapis_lazuli = {
		DisplayName = "Lapis Lazuli",
		Image = "Lapis Lazuli.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "6.5",
		Multicast = "1",
		Tags = "Amulet",
		Pack = "Moon",
		Cost = "40",
		Ability0 = "On Trigger: Permanently give your other Moon items +2 damage.",
		Ability1 = "On Trigger: Permanently give your other Moon items +4 damage.",
		Ability2 = "On Trigger: Permanently give your other Moon items +6 damage.",
		Ability3 = "On Trigger: Permanently give your other Moon items +6 damage and +3% crit."
	},
	moonveil = {
		DisplayName = "Moonveil",
		Image = "Moonveil.png",
		Rarity = "Legendary",
		Damage = "20",
		DamageType = "Ranged",
		Cooldown = "4.2",
		Multicast = "2",
		Tags = "Magic",
		Pack = "Moon",
		Cost = "60",
		Ability0 = "Start of Combat: Give your Moon items +1 bonus multicast.",
		Ability1 = "Start of Combat: Give your Moon items +2 bonus multicast.",
		Ability2 = "Start of Combat: Give your Moon items +4 bonus multicast.",
		Ability3 = "Start of Combat: Permanently give your Moon items +4 multicast."
	},
	chopper = {
		DisplayName = "Chopper",
		Image = "Chopper.png",
		Rarity = "Common",
		Damage = "15",
		DamageType = "Melee",
		Cooldown = "3.4",
		Tags = "Axe",
		Pack = "Neutral",
		Cost = "25",
		Ability0 = "Start of Combat: Give your axes +4 damage permanently.",
		Ability1 = "Start of Combat: Give your axes +8 damage permanently.",
		Ability2 = "Start of Combat: Give your axes +16 damage and +10% crit permanently.",
		Ability3 = "On Trigger: Give your axes +16 damage and +10% crit permanently."
	},
	bone_club = {
		DisplayName = "Bone Club",
		Image = "Bone Club.png",
		Rarity = "Common",
		Damage = "25",
		DamageType = "Melee",
		Cooldown = "3.2",
		Tags = "Mace",
		Pack = "Neutral",
		Cost = "15",
		Ability2 = "On Trigger: Permanently gain +3 damage.",
		Ability3 = "On Trigger: Permanently gain +6 damage."
	},
	novice_blade = {
		DisplayName = "Novice Blade",
		Image = "Novice Blade.png",
		Rarity = "Common",
		Damage = "15",
		DamageType = "Melee",
		Cooldown = "2.6",
		Crit = "30",
		Tags = "Sword",
		Pack = "Neutral",
		Cost = "15",
		Ability2 = "On Trigger: Destroy 30% of enemy shield.",
		Ability3 = "On Trigger: Destroy 60% of enemy shield."
	},
	regular_bow = {
		DisplayName = "Regular Bow",
		SecondName = "Regular Goat",
		Image = "Regular Bow.png",
		Rarity = "Common",
		Damage = "8",
		DamageType = "Ranged",
		Cooldown = "3",
		Multicast = "1",
		Tags = "Bow",
		Pack = "Neutral",
		Cost = "15",
		Ability2 = "Start of Combat: Gain +3 damage.",
		Ability3 = "Start of Combat: If this is your only item, permanently gain +12 DMG and +3 multicast."
	},
	sturdy_shield = {
		DisplayName = "Sturdy Shield",
		Image = "Sturdy Shield.png",
		Rarity = "Common",
		DamageType = "Melee",
		Cooldown = "2.8",
		Block = "15",
		Tags = "Shield",
		Pack = "Neutral",
		Cost = "15",
		Ability2 = "Start of Combat: Permanently gain +10 shield.",
		Ability3 = "Start of Combat and On Trigger: Permanently gain +10 shield."
	},
	spyglass = {
		DisplayName = "Spyglass",
		Image = "Spyglass.png",
		Rarity = "Common",
		DamageType = "Melee",
		Cooldown = "7",
		Tags = "Artifact",
		Pack = "Neutral",
		Cost = "30",
		Ability0 = "On Trigger: Give adjacent items +5% crit chance permanently.",
		Ability1 = "On Trigger: Give adjacent items +10% crit chance permanently.",
		Ability2 = "On Trigger: Give adjacent items +20% crit chance permanently.",
		Ability3 = "On Trigger: Give adjacent items +40% crit and +10 damage permanently."
	},
	sharpsteel = {
		DisplayName = "Sharpsteel",
		Image = "Sharpsteel.png",
		Rarity = "Common",
		Damage = "20",
		DamageType = "Melee",
		Cooldown = "3.2",
		Crit = "30",
		Tags = "Dagger",
		Pack = "Neutral",
		Cost = "30",
		Ability0 = "When this crits, permanently gain +1 damage.",
		Ability1 = "When this crits, permanently gain +2 damage.",
		Ability2 = "When this crits, permanently gain +4 damage.",
		Ability3 = "When this crits, permanently give your items +5 damage."
	},
	brass_knife = {
		DisplayName = "Brass Knife",
		Image = "Brass Knife.png",
		Rarity = "Rare",
		Damage = "12",
		DamageType = "Melee",
		Cooldown = "3.8",
		Tags = "Dagger",
		Pack = "Neutral",
		Cost = "35",
		Ability0 = "On Trigger: Gain +5 gold and reduce this amount by 1.",
		Ability1 = "On Trigger: Gain +8 gold and reduce this amount by 1.",
		Ability2 = "On Trigger: Gain +12 gold and +2 income, then reduce these values amount by 1.",
		Ability3 = "On Trigger: Gain +15 gold and +4 income, then reduce these values amount by 1."
	},
	hook = {
		DisplayName = "Hook",
		Image = "Hook.png",
		Rarity = "Rare",
		Damage = "15",
		DamageType = "Melee",
		Cooldown = "3.2",
		Crit = "30",
		Tags = "Dagger",
		Pack = "Neutral",
		Cost = "35",
		Ability0 = "Whenever this crits, gain +2 gold.",
		Ability1 = "Whenever this crits, gain +4 gold.",
		Ability2 = "Whenever this crits, gain +6 gold.",
		Ability3 = "Whenever this crits, gain 2 [[Goblet|Goblets]]."
	},
	mace_study = {
		DisplayName = "Mace Study",
		Image = "Mace Study.png",
		Rarity = "Rare",
		DamageType = "Melee",
		Cooldown = "5",
		Charges = "1",
		Tags = "Spell",
		Pack = "Neutral",
		Cost = "35",
		Ability0 = "On Trigger: Give Mace below +1 bonus multicast.",
		Ability1 = "On Trigger: Give Mace below +2 bonus multicast.",
		Ability2 = "On Trigger: Give Mace below +4 bonus multicast and +3 DMG permanently.",
		Ability3 = "On Trigger: Give all your Maces +4 multicast and +3 DMG permanently."
	},
	hunters_tome = {
		DisplayName = "Hunter's Tome",
		Image = "Hunters Tome.png",
		Rarity = "Rare",
		Damage = "25",
		DamageType = "Melee",
		Cooldown = "2.9",
		Tags = "Spell",
		Pack = "Neutral",
		Cost = "25",
		Ability0 = "On Trigger: Permanently gain +1 damage.",
		Ability1 = "On Trigger: Permanently gain +2 damage.",
		Ability2 = "On Trigger: Permanently gain +3 damage and +5% crit.",
		Ability3 = "On Trigger: Permanently gain +6 damage and +10% crit."
	},
	spikey_mace = {
		DisplayName = "Spikey Mace",
		Image = "Spikey Mace.png",
		Rarity = "Rare",
		Damage = "30",
		DamageType = "Melee",
		Cooldown = "3.2",
		Tags = "Mace",
		Pack = "Neutral",
		Cost = "35",
		Ability0 = "Start of Combat: Permanently gain +5 damage per Mace.",
		Ability1 = "Start of Combat: Permanently gain +10 damage per Mace.",
		Ability2 = "Start of Combat: Permanently gain +15 damage and +3% crit per Mace.",
		Ability3 = "Start of Combat: Permanently gain +20 damage and +6% crit per Mace."
	},
	sword_techniques = {
		DisplayName = "Sword Techniques",
		Image = "Sword Techniques.png",
		Rarity = "Rare",
		DamageType = "Melee",
		Cooldown = "6.5",
		Tags = "Spell",
		Pack = "Neutral",
		Cost = "30",
		Ability0 = "On Trigger: Give Sword below +3 damage and +5% crit chance permanently.",
		Ability1 = "On Trigger: Give Sword below +6 damage and +10% crit chance permanently.",
		Ability2 = "On Trigger: Give Sword below +10 damage and +15% crit chance permanently.",
		Ability3 = "On Trigger: Give all your Swords +20 damage and +20% crit chance permanently."
	},
	goblet = {
		DisplayName = "Goblet",
		Image = "Goblet.png",
		Rarity = "Rare",
		Damage = "1",
		DamageType = "Melee",
		Cooldown = "2.3",
		Tags = "Artifact",
		Pack = "Neutral",
		Cost = "20",
		Ability0 = "Start of Day: Increase sell value by +15.",
		Ability1 = "Start of Day: Increase sell value by +30.",
		Ability2 = "Start of Day: Increase sell value by +60 and generate +15 gold.",
		Ability3 = "Start of Day: Increase sell value by +120 and generate +30 gold."
	},
	tome_of_blades = {
		DisplayName = "Tome of Blades",
		Image = "Tome of Blades.png",
		Rarity = "Rare",
		Damage = "15",
		DamageType = "Ranged",
		Cooldown = "2.9",
		Crit = "30",
		Tags = "Spell",
		Pack = "Neutral",
		Cost = "35",
		Ability0 = "Start of Combat: If you have at least 3 daggers, gain +4 bonus multicast.",
		Ability1 = "Start of Combat: If you have at least 3 daggers, gain +8 bonus multicast.",
		Ability2 = "Start of Combat: If you have at least 3 daggers, gain +16 bonus multicast.",
		Ability3 = "Start of Combat: If you have at least 3 daggers, trigger this infinitely."
	},
	lifeguard = {
		DisplayName = "Lifeguard",
		Image = "Lifeguard.png",
		Rarity = "Rare",
		DamageType = "Melee",
		Cooldown = "2.9",
		Block = "25",
		Tags = "Shield",
		Pack = "Neutral",
		Cost = "30",
		Ability0 = "On Trigger: Cleanse 2 of each debuff.",
		Ability1 = "On Trigger: Cleanse 5 of each debuff.",
		Ability2 = "On Trigger: Cleanse 10 of each debuff.",
		Ability3 = "On Trigger: Cleanse 30 of each debuff."
	},
	noble_spear = {
		DisplayName = "Noble Spear",
		Image = "Noble Spear.png",
		Rarity = "Rare",
		Damage = "50",
		DamageType = "Melee",
		Cooldown = "3.9",
		Tags = "Spear",
		Pack = "Neutral",
		Cost = "25",
		Ability2 = "Start of Combat: Permanently gain +50 damage.",
		Ability3 = "Start of Combat and On Trigger: Permanently gain +50 damage."
	},
	bulwark = {
		DisplayName = "Bulwark",
		Image = "Bulwark.png",
		Rarity = "Rare",
		DamageType = "Melee",
		Cooldown = "3.6",
		Block = "20",
		Tags = "Shield",
		Pack = "Neutral",
		Cost = "35",
		Ability0 = "On Trigger: Permanently gain +1 shield.",
		Ability1 = "On Trigger: Permanently gain +2 shield.",
		Ability2 = "On Trigger: Permanently gain +4 shield.",
		Ability3 = "On Trigger: Permanently gain +8 shield. Start of Combat: Trigger this 3 times."
	},
	brass_shield = {
		DisplayName = "Brass Shield",
		Image = "Nugget.png",
		Rarity = "Rare",
		DamageType = "Melee",
		Cooldown = "2.5",
		Block = "20",
		Tags = "Shield",
		Pack = "Neutral",
		Cost = "30",
		Ability0 = "Every 3 Triggers: Gain +2 gold.",
		Ability1 = "Every 3 Triggers: Gain +4 gold.",
		Ability2 = "Every 3 Triggers: Gain +4 gold and +1 income.",
		Ability3 = "On Trigger: Gain +4 gold and +1 income."
	},
	modern_archery = {
		DisplayName = "Modern Archery",
		Image = "Modern Archery.png",
		Rarity = "Rare",
		DamageType = "Melee",
		Cooldown = "16",
		Tags = "Spell",
		Pack = "Neutral",
		Cost = "45",
		Ability0 = "On Trigger: Give Bow to the left +1 multicast permanently.",
		Ability1 = "On Trigger: Give Bow to the left +2 multicast permanently.",
		Ability2 = "On Trigger: Give all your Bows +3 multicast permanently.",
		Ability3 = "On Trigger: Give all your Bows +6 multicast and +10 damage permanently."
	},
	war_bow = {
		DisplayName = "War Bow",
		Image = "War Bow.png",
		Rarity = "Rare",
		Damage = "12",
		DamageType = "Ranged",
		Cooldown = "3.5",
		Multicast = "1",
		Tags = "Bow",
		Pack = "Neutral",
		Cost = "30",
		Ability0 = "Start of Combat: Permanently gain +2 Damage per unique bow.",
		Ability1 = "Start of Combat: Permanently gain +4 Damage per unique bow.",
		Ability2 = "Start of Combat: Permanently gain +4 Damage and Crit Chance per unique bow.",
		Ability3 = "Start of Combat: Permanently gain +8 Damage, Crit and Multicast per unique bow."
	},
	dragon_orb = {
		DisplayName = "Dragon Orb",
		SecondName = "SAGon Yorb",
		Image = "Dragon Orb.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "3.9",
		Crit = "25",
		Healing = "50",
		Tags = "Orb",
		Pack = "Dragon",
		Cost = "35",
		Ability0 = "On Trigger: Permanently gain +50 max health (this can crit!).",
		Ability1 = "On Trigger: Permanently gain +100 max health (this can crit!).",
		Ability2 = "On Trigger: Permanently gain +200 max health (this can crit!).",
		Ability3 = "On Trigger: Permanently gain +400 max health and +8 gold (these can crit!)."
	},
	natures_call = {
		DisplayName = "Nature's Call",
		Image = "Natures Call.png",
		Rarity = "Epic",
		Damage = "2",
		DamageType = "Melee",
		Cooldown = "3",
		Charges = "1",
		Tags = "Magic",
		Pack = "Neutral",
		Cost = "55",
		Ability0 = "On Trigger: Give item below +1 bonus multicast.",
		Ability1 = "On Trigger: Give item below +2 bonus multicast.",
		Ability2 = "On Trigger: Give item below +3 bonus multicast.",
		Ability3 = "On Trigger: Give item below +4 multicast permanently."
	},
	venomstrike = {
		DisplayName = "Venomstrike",
		Image = "Venomstrike.png",
		Rarity = "Epic",
		Damage = "10",
		DamageType = "Ranged",
		Cooldown = "3.8",
		Multicast = "3",
		Poison = "4",
		Tags = "Bow",
		Pack = "Neutral",
		Cost = "40",
		Ability2 = "When poison triggers on enemy, permanently gain +1 poison.",
		Ability3 = "When poison triggers on enemy, permanently gain +3 poison."
	},
	time_pendant = {
		DisplayName = "Time Pendant",
		Image = "Time Pendant.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "2",
		Tags = "Amulet",
		Pack = "Neutral",
		Cost = "30",
		Ability0 = "On Trigger: Remove 1s current cooldown from item below.",
		Ability1 = "On Trigger: Remove 2s current cooldown from item below.",
		Ability2 = "On Trigger: Remove 4s current cooldown from item below.",
		Ability3 = "On Trigger: Trigger item below."
	},
	conjure_spear = {
		DisplayName = "Conjure Spear",
		Image = "Conjure Spear.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "5.9",
		Charges = "2",
		Tags = "Spell",
		Pack = "Neutral",
		Cost = "40",
		Ability0 = "On Trigger: Gain a plain copy of spear below.",
		Ability1 = "On Trigger: Gain 2 plain copies of spear below.",
		Ability2 = "On Trigger: Gain 3 plain copies of spear below.",
		Ability3 = "On Trigger: Gain 6 plain copies of spear below."
	},
	wardbinder = {
		DisplayName = "Wardbinder",
		Image = "Wardbinder.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "5.6",
		Tags = "Artifact",
		Pack = "Neutral",
		Cost = "45",
		Ability0 = "On Trigger: Trigger adjacent shields.",
		Ability1 = "On Trigger: Trigger adjacent shields twice.",
		Ability2 = "On Trigger: Trigger adjacent shields 4 times.",
		Ability3 = "On Trigger: Trigger all your shields 6 times."
	},
	dream_catcher = {
		DisplayName = "Dream Catcher",
		Image = "Dream Catcher.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "5.2",
		Tags = "Artifact",
		Pack = "Neutral",
		Cost = "35",
		Ability0 = "On Trigger: Permanently reduce item above's cooldown by 0.1s.",
		Ability1 = "On Trigger: Permanently reduce item above's cooldown by 0.2s.",
		Ability2 = "On Trigger: Permanently reduce item above's cooldown by 0.4s.",
		Ability3 = "On Trigger: Permanently set item above's cooldown to 1s."
	},
	midas_diary = {
		DisplayName = "Midas Diary",
		Image = "Midas Diary.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "3",
		Tags = "Spell",
		Pack = "Neutral",
		Cost = "35",
		Ability0 = "When this or a dagger triggers: Gain +1 gold.",
		Ability1 = "When this or a dagger triggers: Gain +2 gold.",
		Ability2 = "When this or a dagger triggers: Gain +3 gold and +1 income.",
		Ability3 = "When this or a dagger triggers: Gain +6 gold and +2 income."
	},
	nightquill = {
		DisplayName = "Nightquill",
		Image = "Nightquill.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "7",
		Tags = "Amulet",
		Pack = "Neutral",
		Cost = "45",
		Ability0 = "Your start of combat effects trigger an extra time.",
		Ability1 = "Your start of combat effects trigger 2 extra times.",
		Ability2 = "Your start of combat effects trigger 3 extra times.",
		Ability3 = "Your start of combat effects trigger 6 extra times."
	},
	woodchopping = {
		DisplayName = "Woodchopping",
		Image = "Woodchopping.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "4.2",
		Tags = "Spell",
		Pack = "Neutral",
		Cost = "40",
		Ability0 = "On Trigger: Give your axes +3 damage per unique axe permanently.",
		Ability1 = "On Trigger: Give your axes +6 damage per unique axe permanently.",
		Ability2 = "On Trigger: Give your axes +12 damage per unique axe permanently.",
		Ability3 = "On Trigger: Give your axes +24 damage and +5% crit per unique axe permanently."
	},
	mythic_rod = {
		DisplayName = "Mythic Rod",
		SecondName = "Michuu's Rod",
		Image = "Mythic Rod.png",
		Rarity = "Epic",
		Damage = "40",
		DamageType = "Ranged",
		Cooldown = "3.3",
		Tags = "Magic",
		Pack = "Neutral",
		Cost = "45",
		Ability0 = "On Trigger: If you have only unique item types, permanently gain +5 DMG.",
		Ability1 = "On Trigger: If you have only unique item types, permanently gain +10 DMG.",
		Ability2 = "On Trigger: If you have only unique item types, permanently gain +15 DMG.",
		Ability3 = "On Trigger: Permanently gain +30 DMG and +5% crit."
	},
	launcher = {
		DisplayName = "Launcher",
		Image = "Launcher.png",
		Rarity = "Epic",
		Damage = "30",
		DamageType = "Ranged",
		Cooldown = "6.2",
		Multicast = "1",
		Tags = "Bow",
		Pack = "Neutral",
		Cost = "35",
		Ability0 = "On Trigger: Trigger another random bow.",
		Ability1 = "On Trigger: Trigger 2 other random bows.",
		Ability2 = "On Trigger: Trigger 3 other random bows and permanently give them +2 DMG.",
		Ability3 = "On Trigger: Trigger your other bows and permanently give them +10 DMG."
	},
	recharge_rod = {
		DisplayName = "Recharge Rod",
		Image = "Charge Rod.png",
		Rarity = "Legendary",
		DamageType = "Melee",
		Cooldown = "6",
		Charges = "2",
		Tags = "Magic",
		Pack = "Neutral",
		Cost = "40",
		Ability0 = "On Trigger: Replenish 1 charge of item to the right.",
		Ability1 = "On Trigger: Fully recharge item to the right.",
		Ability2 = "On Trigger: Permanently give item to the right +1 Max Charge.",
		Ability3 = "Item to the right has unlimited charges."
	},
	warhorn = {
		DisplayName = "Warhorn",
		Image = "Warhorn.png",
		Rarity = "Legendary",
		DamageType = "Melee",
		Cooldown = "10",
		Tags = "Artifact",
		Pack = "Neutral",
		Cost = "55",
		Ability0 = "On Trigger: Give adjacent items bonus damage equal to their crit chance.",
		Ability1 = "On Trigger: Give adjacent items bonus damage equal to twice their crit chance.",
		Ability2 = "On Trigger: Give adjacent items bonus damage equal to 4 times their crit chance.",
		Ability3 = "On Trigger: Give all your items bonus damage equal to 6 times their crit chance."
	},
	astral_hammer = {
		DisplayName = "Astral Hammer",
		Image = "Astral Hammer.png",
		Rarity = "Legendary",
		Damage = "35",
		DamageType = "Melee",
		Cooldown = "3.5",
		Multicast = "4",
		Tags = "Mace",
		Pack = "Neutral",
		Cost = "55",
		Ability0 = "Start of Combat: If you have at least 4 Maces, reduce cooldown to 1 second.",
		Ability1 = "Start of Combat: If you have at least 4 Maces, reduce cooldown to 0.5 seconds.",
		Ability2 = "Start of Combat: Reduce cooldown to 0.5 seconds and gain +3 damage per Mace.",
		Ability3 = "Start of Combat: Gain +50 damage and trigger this infinitely."
	},
	cobalt_spear = {
		DisplayName = "Cobalt Spear",
		Image = "Cobalt Spear.png",
		Rarity = "Legendary",
		Damage = "40",
		DamageType = "Melee",
		Cooldown = "3.2",
		Tags = "Spear",
		Pack = "Neutral",
		Cost = "50",
		Ability0 = "Drag spears here to consume them and permanently gain their damage and crit.",
		Ability1 = "Drag spears here to consume them and permanently gain twice their damage and crit.",
		Ability2 = "Drag spears here to consume them and permanently gain 4 times their damage and crit.",
		Ability3 = "Drag spears here to consume them and permanently gain 8 times their damage and crit."
	},
	cutlass = {
		DisplayName = "Cutlass",
		Image = "Cutlass.png",
		Rarity = "Legendary",
		Damage = "25",
		DamageType = "Melee",
		Cooldown = "2.7",
		Tags = "Sword",
		Pack = "Neutral",
		Cost = "45",
		Ability0 = "When you gain gold during combat, permanently gain twice that much damage.",
		Ability1 = "When you gain gold during combat, permanently gain 4x the damage.",
		Ability2 = "When you gain gold during combat, permanently gain 4x the damage and +2 gold.",
		Ability3 = "When you gain gold during combat, permanently gain 6x the damage and +4 gold."
	},
	warrior_shield = {
		DisplayName = "Warrior Shield",
		Image = "Warrior Shield.png",
		Rarity = "Legendary",
		DamageType = "Melee",
		Cooldown = "2.8",
		Block = "100",
		Tags = "Shield",
		Pack = "Neutral",
		Cost = "40",
		Ability0 = "Whenever you gain shield, deal 50 damage.",
		Ability1 = "Whenever you gain shield, deal 100 damage.",
		Ability2 = "Whenever you gain shield, gain 50 extra and deal 200 damage.",
		Ability3 = "Whenever you gain shield, gain 200 extra and deal 400 damage."
	},
	anvil = {
		DisplayName = "Anvil",
		Image = "Anvil.png",
		Rarity = "Legendary",
		DamageType = "Melee",
		Cooldown = "4.8",
		Block = "40",
		Tags = "Artifact",
		Pack = "Neutral",
		Cost = "50",
		Ability0 = "On Trigger: Gain +1 iron stack per sword. At 20 stacks: Gain a random Forge Blade.",
		Ability1 = "On Trigger: Gain +2 iron stacks per sword. At 20 stacks: Gain a random Forge Blade.",
		Ability2 = "On Trigger: Gain +3 iron stacks per sword. At 20 stacks: Gain a random Forge Blade.",
		Ability3 = "On Trigger: Gain a random Forge Blade."
	},
	lost_fragment = {
		DisplayName = "Lost Fragment",
		Image = "Lost Fragment.png",
		Rarity = "Legendary",
		DamageType = "Melee",
		Cooldown = "4",
		Tags = "Artifact",
		Pack = "Neutral",
		Cost = "60",
		Ability0 = "On Trigger: Give item above +1 bonus multicast and increase this item's cooldown by 4s.",
		Ability1 = "On Trigger: Give item above +1 bonus multicast and increase this item's cooldown by 2s.",
		Ability2 = "On Trigger: Give item above +1 bonus multicast.",
		Ability3 = "On Trigger: Permanently give item above +1 multicast."
	},
	dragons_call = {
		DisplayName = "Dragon's Call",
		Image = "Dragons Call.png",
		Rarity = "Legendary",
		Damage = "70",
		DamageType = "Ranged",
		Cooldown = "5.3",
		Charges = "3",
		Burn = "7",
		Tags = "Bow",
		Pack = "Dragon",
		Cost = "55",
		Ability0 = "On Trigger: If you only have unique bows, trigger your other bows 3 times.",
		Ability1 = "On Trigger: If you only have unique bows, trigger your other bows 6 times.",
		Ability2 = "On Trigger: Trigger your other bows 6 times and give them +5 bonus damage.",
		Ability3 = "On Trigger: Trigger your other bows 12 times and permanently give them +10 damage."
	},
	trigem = {
		DisplayName = "Trigem",
		Image = "Trigem.png",
		Rarity = "Legendary",
		DamageType = "Melee",
		Cooldown = "5.7",
		Tags = "Relic",
		Pack = "Neutral",
		Cost = "50",
		Ability0 = "On Trigger: If you have only unqiue item types, give your items +5 damage permanently.",
		Ability1 = "On Trigger: If you have only unique item types, give your items +10 damage permanently.",
		Ability2 = "On Trigger: If you have only unique item types, give your items +20 damage permanently.",
		Ability3 = "On Trigger: Give your items +40 damage and +15% crit permanently."
	},
	astralis = {
		DisplayName = "Astralis",
		Image = "Astralis.png",
		Rarity = "Forged",
		Damage = "180",
		DamageType = "Melee",
		Cooldown = "3.2",
		Tags = "Sword",
		Pack = "Moon",
		Cost = "40",
		Ability0 = "Start of Combat: Give your swords +1 bonus multicast.",
		Ability1 = "Start of Combat: Give your swords +2 bonus multicast.",
		Ability2 = "Start of Combat: Give your swords +4 bonus multicast.",
		Ability3 = "Start of Combat: Permanently give your swords +4 multicast."
	},
	black_rose = {
		DisplayName = "Black Rose",
		Image = "Black Rose.png",
		Rarity = "Forged",
		Damage = "150",
		DamageType = "Melee",
		Cooldown = "2.7",
		Tags = "Sword",
		Pack = "Dark",
		Cost = "40",
		Ability0 = "Start of Combat: Give your swords +100% bonus crit chance and +20 bonus damage.",
		Ability1 = "Start of Combat: Give your swords +200% bonus crit chance and +40 bonus damage.",
		Ability2 = "Start of Combat: Give your swords +400% bonus crit chance and +80 bonus damage.",
		Ability3 = "Start of Combat: Permanently give your swords +400% crit chance and +80 damage."
	},
	molten_core = {
		DisplayName = "Molten Core",
		Image = "Molten Core.png",
		Rarity = "Forged",
		Damage = "40",
		DamageType = "Melee",
		Cooldown = "3.5",
		Burn = "20",
		Tags = "Sword",
		Pack = "Flame",
		Cost = "40",
		Ability0 = "Start of Combat: Give your swords +10 bonus burn.",
		Ability1 = "Start of Combat: Give your swords +20 bonus burn.",
		Ability2 = "Start of Combat: Give your swords +40 bonus burn.",
		Ability3 = "Start of Combat: Permanently give your swords +40 burn."
	},
	harbinger = {
		DisplayName = "Harbinger",
		Image = "Harbinger.png",
		Rarity = "Forged",
		Damage = "50",
		DamageType = "Melee",
		Cooldown = "1.8",
		Crit = "50",
		Multicast = "1",
		Poison = "7",
		Burn = "10",
		Bleed = "3",
		Healing = "25",
		Tags = "Sword",
		Pack = "Dragon",
		Cost = "40",
		Ability2 = "Start of Combat: Trigger this.",
		Ability3 = "Start of Combat: Trigger this twice."
	},
	a_thousand_cuts = {
		DisplayName = "A Thousand Cuts",
		Image = "A Thousand Cuts.png",
		Rarity = "Forged",
		Damage = "35",
		DamageType = "Melee",
		Cooldown = "1.4",
		Crit = "50",
		Tags = "Sword",
		Pack = "Neutral",
		Cost = "40",
		Ability0 = "When another sword triggers, trigger this.",
		Ability1 = "When another sword triggers, trigger this twice.",
		Ability2 = "When another sword triggers, trigger this 4 times.",
		Ability3 = "Start of Combat: Permanently gain +10 damage and trigger this infinitely."
	},
	home_brew = {
		DisplayName = "Home-Brew",
		Image = "Home_Brew.png",
		Rarity = "Special",
		DamageType = "Ranged",
		Cooldown = "5",
		Tags = "Potion",
		Pack = "Neutral",
		Cost = "30",
		Ability0 = "Has randomized stats.",
		Ability1 = "Has randomized stats.",
		Ability2 = "This has many stats...",
		Ability3 = "This has tons and tons of stats..."
	},
    toxins = {
        DisplayName = "Toxins",
  	    Image = "Toxins.png",
        Rarity = "Unobtainable",
        DamageType = "Melee",
        Cooldown = "1.4",
        Tags = "Magic",
        Pack = "Neutral",
        Cost = "35",
        Ability0 = "On Trigger: Trigger poison damage on enemy.",
        Ability1 = "On Trigger: Trigger poison damage on enemy twice.",
        Ability2 = "On Trigger: Trigger poison damage on enemy 4 times.",
        Ability3 = "When you apply poison and On Trigger: Trigger poison damage on enemy 4 times."
    },
	jade = {
		DisplayName = "Jade",
		Image = "Jade.png",
		Rarity = "Special",
		DamageType = "Melee",
		Cooldown = "3.8",
		Tags = "Amulet",
		Pack = "Elven",
		Cost = "25",
		Ability0 = "On Trigger: Give your poison items +1 poison permanently.",
		Ability1 = "On Trigger: Give your poison items +2 poison permanently.",
		Ability2 = "On Trigger: Give your poison items +4 poison permanently.",
		Ability3 = "On Trigger: Give your items +8 poison permanently."
	},
	icicle = {
		DisplayName = "Icicle",
		Image = "Icicle.png",
		Rarity = "Special",
		DamageType = "Melee",
		Cooldown = "3.2",
		Charges = "4",
		Tags = "Magic",
		Pack = "Frosty",
		Cost = "45",
		Ability0 = "On Trigger: Freeze a random enemy item for 2s.",
		Ability1 = "On Trigger: Freeze 2 random enemy items for 2s.",
		Ability2 = "On Trigger: Freeze 3 random enemy items for 2s.",
		Ability3 = "On Trigger: Freeze all enemy items for 2s."
	},
	mimic_rod = {
		DisplayName = "Mimic Rod",
		Image = "Mimic Rod.png",
		Rarity = "Special",
		DamageType = "Melee",
		Cooldown = "11",
		Tags = "Magic",
		Pack = "Neutral",
		Cost = "40",
		Ability0 = "On Trigger: Gain a plain copy of item above.",
		Ability1 = "On Trigger: Gain 2 plain copies of item above.",
		Ability2 = "On Trigger: Gain 3 plain copies of item above.",
		Ability3 = "On Trigger: Gain 4 plain copies of item above."
	},
	cursed_garnet = {
		DisplayName = "Cursed Garnet",
		Image = "Cursed Garnet.png",
		Rarity = "Cursed",
		DamageType = "Melee",
		Cooldown = "8",
		Tags = "Amulet",
		Pack = "Dark",
		Cost = "45",
		Ability0 = "Start of Combat: Gain 2 random [[Dark]] items.",
		Ability1 = "Start of Combat: Gain 4 random [[Dark]] items.",
		Ability2 = "Start of Combat: Gain 6 random [[Dark]] items.",
		Ability3 = "Start of Combat: Gain 6 random [[Dark]] or [[Cursed]] items."
	},
	cursed_tiara = {
		DisplayName = "Cursed Tiara",
		Image = "Cursed Tiara.png",
		Rarity = "Cursed",
		Damage = "2",
		DamageType = "Melee",
		Cooldown = "2.6",
		Bleed = "2",
		Tags = "Artifact",
		Pack = "Dark",
		Pack2 = "Crystal",
		Cost = "45",
		Ability0 = "Start of Combat: Gain +5 bonus multicast.",
		Ability1 = "Start of Combat: Gain +10 bonus multicast.",
		Ability2 = "Start of Combat: Gain +15 bonus multicast.",
		Ability3 = "Start of Combat: Permanently gain +15 multicast."
	},
	dark_orb = {
		DisplayName = "Dark Orb",
		Image = "Cursed Orb.png",
		Rarity = "Cursed",
		DamageType = "Melee",
		Cooldown = "8",
		Tags = "Orb",
		Pack = "Dark",
		Cost = "45",
		Ability0 = "Start of Combat: Trigger your dark items. (except [[Dark Necklace]])",
		Ability1 = "Start of Combat: Trigger your dark items twice. (except [[Dark Necklace]])",
		Ability2 = "Start of Combat: Trigger your dark items thrice. (except [[Dark Necklace]])",
		Ability3 = "Start of Combat: Trigger your dark items 4 times."
	},
	the_pyramid = {
		DisplayName = "The Pyramid",
		Image = "Cursed Artifact.png",
		Rarity = "Cursed",
		DamageType = "Melee",
		Cooldown = "8",
		Tags = "Artifact",
		Pack = "Dark",
		Cost = "45",
		Ability0 = "Start of Combat: Permanently give item to the right a random debuff.",
		Ability1 = "Start of Combat: Permanently give item to the right 2 random debuffs.",
		Ability2 = "Start of Combat: Permanently give item to the right 4 random debuffs.",
		Ability3 = "Start of Combat: Permanently give item to the right 8 random debuffs."
	},
	cursed_shield = {
		DisplayName = "Cursed Shield",
		Image = "Cursed Shield.png",
		Rarity = "Cursed",
		DamageType = "Melee",
		Cooldown = "3.6",
		Block = "30",
		Tags = "Shield",
		Pack = "Dark",
		Cost = "45",
		Ability0 = "Start of Combat: Permanently gain +4 multicast.",
		Ability1 = "Start of Combat: Permanently gain +8 multicast.",
		Ability2 = "Start of Combat: Permanently gain +16 multicast and +30 shield.",
		Ability3 = "Start of Combat: Permanently gain shield equal to 2x this item's multicast."
	},
	treasure_chest = {
		DisplayName = "Treasure Chest",
		Image = "Treasure Chest.png",
		Rarity = "Special",
		DamageType = "Melee",
		Cooldown = "7",
		Tags = "Artifact",
		Pack = "Neutral",
		Cost = "55",
		Ability0 = "When Sold: Gain 2 goblets.",
		Ability1 = "When Sold: Gain 4 goblets.",
		Ability2 = "When Sold: Gain 8 goblets.",
		Ability3 = "When Sold: Gain 8 goblets, 40 gold and 40 income."
	},
	lightning_to_go = {
		DisplayName = "Lightning To-Go",
		Image = "Lightning To-Go.png",
		Rarity = "Common",
		DamageType = "Melee",
		Cooldown = "3.3",
		Shock = "2",
		Tags = "Spell",
		Pack = "Storm",
		Cost = "20",
		Ability2 = "This applies [[:Category:Shock|shock]] twice.",
		Ability3 = "This applies [[:Category:Shock|shock]] 4 times."
	},
	outdoor_knife = {
		DisplayName = "Outdoor Knife",
		Image = "Outdoor Knife.png",
		Rarity = "Common",
		Damage = "10",
		DamageType = "Melee",
		Cooldown = "2.3",
		Tags = "Dagger",
		Pack = "Storm",
		Cost = "15",
		Ability0 = "Start of Combat: Gain +3 bonus damage per [[Storm]] item.",
		Ability1 = "Start of Combat: Gain +6 bonus damage per [[Storm]] item.",
		Ability2 = "Start of Combat: Gain +9 bonus damage and +6 bonus crit chance per [[Storm]] item.",
		Ability3 = "Start of Combat: Gain +15 damage and crit chance per [[Storm]] item permanently."
	},
	morning_star = {
		DisplayName = "Morning Star",
		Image = "Morning Star.png",
		Rarity = "Rare",
		Damage = "8",
		DamageType = "Melee",
		Cooldown = "2.8",
		Shock = "1",
		Tags = "Mace",
		Pack = "Storm",
		Cost = "30",
		Ability0 = "Every 2 Triggers: Permanently increase your [[:Category:Shock|shock]] damage by 2.",
		Ability1 = "Every 2 Triggers: Permanently increase your [[:Category:Shock|shock]] damage by 4.",
		Ability2 = "On Trigger: Permanently increase your [[:Category:Shock|shock]] damage by 4.",
		Ability3 = "On Trigger: Permanently increase your [[:Category:Shock|shock]] damage by 10."
	},
	stormpike = {
		DisplayName = "Stormpike",
		Image = "Stormpike.png",
		Rarity = "Epic",
		Damage = "15",
		DamageType = "Melee",
		Cooldown = "3.8",
		Shock = "1",
		Tags = "Spear",
		Pack = "Storm",
		Cost = "30",
		Ability0 = "On Trigger: Permanently gain +1 [[:Category:Shock|shock]].",
		Ability1 = "On Trigger: Permanently gain +2 [[:Category:Shock|shock]].",
		Ability2 = "On Trigger: Permanently gain +3 [[:Category:Shock|shock]] and increase [[:Category:Shock|shock]] damage by +5.",
		Ability3 = "On Trigger: Permanently gain +4 [[:Category:Shock|shock]] and increase [[:Category:Shock|shock]] damage by +20."
	},
	stormguard = {
		DisplayName = "Stormguard",
		Image = "Stormguard.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "2.3",
		Block = "45",
		Tags = "Shield",
		Pack = "Storm",
		Cost = "40",
		Ability0 = "On Trigger: Permanently increase [[:Category:Shock|shock]] damage by +2.",
		Ability1 = "On Trigger: Permanently increase [[:Category:Shock|shock]] damage by +4.",
		Ability2 = "On Trigger: Permanently increase [[:Category:Shock|shock]] damage by +8.",
		Ability3 = "On Trigger and Start of Combat: Permanently increase [[:Category:Shock|shock]] damage by +20."
	},
	skybolt = {
		DisplayName = "Skybolt",
		Image = "Skybolt.png",
		Rarity = "Legendary",
		Damage = "50",
		DamageType = "Ranged",
		Cooldown = "3",
		Tags = "Spear",
		Pack = "Storm",
		Cost = "40",
		Ability0 = "When [[:Category:Shock|shock]] triggers on enemy, trigger this. This can't gain [[:Category:Shock|shock]].",
		Ability1 = "When [[:Category:Shock|shock]] triggers on enemy, trigger this twice. This can't gain [[:Category:Shock|shock]].",
		Ability2 = "When [[:Category:Shock|shock]] triggers on enemy, trigger this thrice.",
		Ability3 = "When [[:Category:Shock|shock]] triggers on enemy, trigger this 6 times."
	},
	tempest = {
		DisplayName = "Tempest",
		Image = "Tempest.png",
		Rarity = "Legendary",
		Damage = "25",
		DamageType = "Ranged",
		Cooldown = "2.9",
		Multicast = "3",
		Tags = "Bow",
		Pack = "Storm",
		Cost = "45",
		Ability0 = "On Trigger: Trigger a [[:Category:Shock|shock]] stack on enemy.",
		Ability1 = "On Trigger: Trigger 2 [[:Category:Shock|shock]] stacks on enemy.",
		Ability2 = "On Trigger: Trigger 3 [[:Category:Shock|shock]] stacks on enemy.",
		Ability3 = "On Trigger: Trigger 4 [[:Category:Shock|shock]] stacks on enemy."
	},
	crook = {
		DisplayName = "Crook",
		Image = "Crook.png",
		Rarity = "Common",
		Damage = "12",
		DamageType = "Melee",
		Cooldown = "3.5",
		Crit = "30",
		Tags = "Magic",
		Pack = "Witch",
		Cost = "35",
		Ability0 = "Whenever this crits, gain a random [[Lesser Potion]].",
		Ability1 = "Whenever this crits, gain 2 random [[Lesser Potion|Lesser Potions]].",
		Ability2 = "Whenever this crits, gain 2 random [[Vials]].",
		Ability3 = "Whenever this crits, gain 2 random [[Potions]]."
	},
	nightbloom = {
		DisplayName = "Nightbloom",
		Image = "Nightbloom.png",
		Rarity = "Common",
		DamageType = "Melee",
		Cooldown = "3.1",
		Block = "20",
		Tags = "Shield",
		Pack = "Witch",
		Cost = "20",
		Ability0 = "Permanently gain +1 Shield whenever you use a [[Potions|potion]].",
		Ability1 = "Permanently gain +2 Shield whenever you use a [[Potions|potion]].",
		Ability2 = "Permanently gain +3 Shield and +1 Heal whenever you use a [[Potions|potion]].",
		Ability3 = "Permanently gain +10 Shield and +10 Heal whenever you use a [[Potions|potion]]."
	},
	brew_today = {
		DisplayName = "Brew Today",
		Image = "Brew Today.png",
		Rarity = "Rare",
		DamageType = "Melee",
		Cooldown = "5.2",
		Charges = "3",
		Tags = "Spell",
		Pack = "Witch",
		Cost = "35",
		Ability0 = "On Trigger: Gain a random [[Vials|Vial]].",
		Ability1 = "On Trigger: Gain 2 random [[Vials]].",
		Ability2 = "On Trigger: Gain 2 random [[Potions|Regular Potions]].",
		Ability3 = "On Trigger: Gain 4 random [[Potions]]."
	},
	wicked_staff = {
		DisplayName = "Wicked Staff",
		Image = "Wicked Staff.png",
		Rarity = "Rare",
		Damage = "15",
		DamageType = "Ranged",
		Cooldown = "3.5",
		Tags = "Magic",
		Pack = "Witch",
		Cost = "30",
		Ability0 = "Permanently gain +5 damage when using a [[Potions|potion]] on this.",
		Ability1 = "Permanently gain +10 damage when using a [[Potions|potion]] on this.",
		Ability2 = "Permanently gain +20 damage when using a [[Potions|potion]] on this.",
		Ability3 = "Permanently gain +50 damage when using a [[Potions|potion]] on this."
	},
	candle = {
		DisplayName = "Candle",
		Image = "Candle.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "3.1",
		Burn = "1",
		Tags = "Artifact",
		Pack = "Witch",
		Cost = "40",
		Ability0 = "On Trigger: Gain a Wax stack. [[Potions]] consume Wax to grant your other [[Witch]] items +2 DMG.",
		Ability1 = "On Trigger: Gain a Wax stack. [[Potions]] consume Wax to grant your other [[Witch]] items +4 DMG.",
		Ability2 = "On Trigger: Gain a Wax stack. [[Potions]] consume Wax to grant your other [[Witch]] items +8 DMG.",
		Ability3 = "[[Potions]] grant your other [[Witch]] items +20 DMG."
	},
	potion_belt = {
		DisplayName = "Potion Belt",
		Image = "Potion Belt.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "7",
		Tags = "Artifact",
		Pack = "Witch",
		Cost = "25",
		Ability0 = "Start of Day: Gain a random [[Vials|vial]].",
		Ability1 = "Start of Day: Gain 2 random [[Vials|vials]].",
		Ability2 = "Start of Day: Gain 3 random [[Potions|potions]].",
		Ability3 = "Start of Day: Gain 10 random [[Potions|potions]]."
	},
	cauldron = {
		DisplayName = "Cauldron",
		Image = "Cauldron.png",
		Rarity = "Legendary",
		DamageType = "Melee",
		Cooldown = "4.5",
		Poison = "5",
		Tags = "Artifact",
		Pack = "Witch",
		Cost = "50",
		Ability0 = "Use a [[Potions|potion]] on this to gain +1 ingredient stack. On Trigger: Spend an ingredient stack to gain a random [[Potions|Potion]].",
		Ability1 = "Use a [[Potions|potion]] on this to gain +2 ingredient stacks. On Trigger: Spend an ingredient stack to gain a random [[Potions|Potion]].",
		Ability2 = "Use a [[Potions|potion]] on this to gain +3 ingredient stacks. On Trigger: Spend an ingredient stack to gain a random [[Potions|Potion]].",
		Ability3 = "On Trigger: Gain a random [[Potions|potion]] per [[Witch]] item."
	},
	wand = {
		DisplayName = "Wand",
		Image = "Wand.png",
		Rarity = "Legendary",
		Damage = "20",
		DamageType = "Ranged",
		Cooldown = "3.8",
		Tags = "Magic",
		Pack = "Witch",
		Cost = "50",
		Ability0 = "Permanently gain +1 multicast when using a [[Potions|potion]] on this.",
		Ability1 = "Permanently gain +2 multicast when using a [[Potions|potion]] on this.",
		Ability2 = "Permanently gain +4 multicast when using a [[Potions|potion]] on this.",
		Ability3 = "Permanently gain +4 multicast and +15 damage when using a [[Potions|potion]] on this."
	},
	pandoras_box = {
		DisplayName = "Pandora's Box",
		Image = "Pandoras Box.png",
		Rarity = "Legendary",
		DamageType = "Melee",
		Cooldown = "20",
		Charges = "1",
		Burn = "30",
		Bleed = "20",
		Tags = "Artifact",
		Cost = "50",
		Ability0 = "On Trigger: Gain Pandora's Slot here (copies an item each day).",
		Ability1 = "On Trigger: Gain or upgrade Pandora's Slot here.",
		Ability2 = "On Trigger: Gain or upgrade Pandora's Slot here twice.",
		Ability3 = "On Trigger: Gain or upgrade Pandora's Slot here three times."
	},
	turnbound_ring = {
		DisplayName = "Turnbound Ring",
		Image = "Turnbound Ring.png",
		Rarity = "Epic",
		DamageType = "Melee",
		Cooldown = "3.9",
		Multicast = "1",
		Tags = "Ring",
		Pack = "All Packs",
		Cost = "30",
		Ability0 = "Start of Day: Permanently gain +5 damage.",
		Ability1 = "Start of Day: Permanently gain +10 damage.",
		Ability2 = "Start of Day: Permanently gain +10 damage and +10% crit chance.",
		Ability3 = "Start of Day: Permanently gain +20 damage, 20% crit chance, and +2 Multicast."
	},
-- Potions
	lesser_damage_potion = {
		DisplayName = "Lesser Damage Potion",
		Image = "Lesser Damage Potion.png",
		Pack = "Neutral",
		Cost = "8",
		Ability = "Use on item to give it +1 damage.",
		Class = "Lesser Potion",
		Type = "Weapon-Buff"
	},
	lesser_heal_potion = {
		DisplayName = "Lesser Heal Potion",
		Image = "Lesser Heal Potion.png",
		Pack = "Neutral",
		Cost = "8",
		Ability = "Use on item to give it +1 heal.",
		Class = "Lesser Potion",
		Type = "Weapon-Buff"
	},
	lesser_shield_potion = {
		DisplayName = "Lesser Shield Potion",
		Image = "Lesser Shield Potion.png",
		Pack = "Neutral",
		Cost = "8",
		Ability = "Use on item to give it +1 shield.",
		Class = "Lesser Potion",
		Type = "Weapon-Buff"
	},
	lesser_crit_potion = {
		DisplayName = "Lesser Crit Potion",
		Image = "Lesser Crit Potion.png",
		Pack = "Neutral",
		Cost = "Unknown",
		Ability = "Use on item to give it +3% crit.",
		Class = "Lesser Potion",
		Type = "Weapon-Buff"
	},
	lesser_cloud_potion = {
		DisplayName = "Lesser Cloud Potion",
		Image = "Lesser Cloud Potion.png",
		Pack = "Neutral",
		Cost = "Unknown",
		Ability = "Use to gain +1 cheaper reroll.",
		Class = "Lesser Potion",
		Type = "Utility"
	},
	lesser_xp_potion = {
		DisplayName = "Lesser XP Potion",
		Image = "Lesser XP Potion.png",
		Pack = "Neutral",
		Cost = "3",
		Ability = "Use to gain +4 XP.",
		Class = "Lesser Potion",
		Type = "Utility"
	},
	lesser_gold_potion = {
		DisplayName = "Lesser Gold Potion",
		Image = "Lesser Gold Potion.png",
		Pack = "Neutral",
		Cost = "3",
		Ability = "Use to gain +4 gold.",
		Class = "Lesser Potion",
		Type = "Utility"
	},
	lesser_health_potion = {
		DisplayName = "Lesser Health Potion",
		Image = "Lesser Health Potion.png",
		Pack = "Neutral",
		Cost = "Unknown",
		Ability = "Use to gain +30 Max HP.",
		Class = "Lesser Potion",
		Type = "Utility"
	},
	rainbow_potion = {
		DisplayName = "Rainbow Potion",
		Image = "Rainbow Potion.png",
		Pack = "Neutral",
		Cost = "15",
		Ability = "Use on reroll button to gain +1 lucky rerolls.",
		Class = "Major Potion",
		Type = "Utility"
	},
	mirror_elixir = {
		DisplayName = "Mirror Elixir",
		Image = "Mirror pot.png",
		Pack = "Neutral",
		Cost = "40",
		Ability = "Use on an item to gain a base copy of it.",
		Class = "Major Potion",
		Type = "Utility"
	},
	wrath_potion = {
		DisplayName = "Wrath Potion",
		Image = "Wrath Potion.png",
		Pack = "Neutral",
		Cost = "15",
		Ability = "Use on item to give it +8 damage.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	precision_flask = {
		DisplayName = "Precision Flask",
		Image = "Precision Flask.png",
		Pack = "Neutral",
		Cost = "15",
		Ability = "Use on item to give it +25% crit chance.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	time_tonic = {
		DisplayName = "Time Tonic",
		Image = "Time Tonic.png",
		Pack = "Neutral",
		Cost = "18",
		Ability = "Use on item to give it -0.5s cooldown.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	flask_of_venom = {
		DisplayName = "Flask of Venom",
		Image = "Flask of Venom.png",
		Pack = "Neutral",
		Cost = "25",
		Ability = "Use on item to give it +2 Poison.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	fire_bottle = {
		DisplayName = "Fire Bottle",
		Image = "Fire Bottle.png",
		Pack = "Neutral",
		Cost = "25",
		Ability = "Use on item to give it +2 Burn.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	blood_flask = {
		DisplayName = "Blood Flask",
		Image = "Blood Flask.png",
		Pack = "Neutral",
		Cost = "30",
		Ability = "Use on item to give it +1 Bleed.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	potion_of_appearance = {
		DisplayName = "Potion of Appearance",
		Image = "Potion of Appearance.png",
		Pack = "Neutral",
		Cost = "15",
		Ability = "Use on an item to increase the chance of finding it in the shop.",
		Class = "Major Potion",
		Type = "Utility"
	},
	potion_of_experience = {
		DisplayName = "Potion of Experience",
		Image = "Potion of Experience.png",
		Pack = "Neutral",
		Cost = "15",
		Ability = "Use on XP bar to gain +20 XP.",
		Class = "Potion",
		Type = "Utility"
	},
	value_potion = {
		DisplayName = "Value Potion",
		Image = "Value Potion.png",
		Pack = "Neutral",
		Cost = "25",
		Ability = "Use on an item in the shop to trade this potion for that item.",
		Class = "Potion",
		Type = "Utility"
	},
	excellence_flask = {
		DisplayName = "Excellence Flask",
		Image = "Excellence Flask.png",
		Pack = "Neutral",
		Cost = "10",
		Ability = "Drag onto your gold counter to gain +10 income.",
		Class = "Potion",
		Type = "Utility"
	},
	fortitude_potion = {
		DisplayName = "Fortitude Potion",
		Image = "Fortitude Potion.png",
		Pack = "Neutral",
		Cost = "15",
		Ability = "Use on health bar to gain +400 max HP.",
		Class = "Potion",
		Type = "Utility"
	},
	burn_vial = {
		DisplayName = "Burn Vial",
		Image = "Burn Vial.png",
		Pack = "Neutral",
		Cost = "15",
		Ability = "Use on item to give it +1 Burn.",
		Class = "Vial",
		Type = "Weapon-Buff"
	},
	cloud_in_a_vial = {
		DisplayName = "Cloud in a Vial",
		Image = "Cloud in a Vial.png",
		Pack = "Neutral",
		Cost = "5",
		Ability = "Use on Reroll button to gain 3 free rerolls.",
		Class = "Vial",
		Type = "Utility"
	},
	crit_vial = {
		DisplayName = "Crit Vial",
		Image = "Crit Vial.png",
		Pack = "Neutral",
		Cost = "10",
		Ability = "Use on item to give it +8% crit chance.",
		Class = "Vial",
		Type = "Weapon-Buff"
	},
	damage_vial = {
		DisplayName = "Damage Vial",
		Image = "Damage Vial.png",
		Pack = "Neutral",
		Cost = "8",
		Ability = "Use on item to give it +3 damage.",
		Class = "Vial",
		Type = "Weapon-Buff"
	},
	experience_vial = {
		DisplayName = "Experience Vial",
		Image = "Experience Vial.png",
		Pack = "Neutral",
		Cost = "8",
		Ability = "Use on XP bar to gain +12 XP.",
		Class = "Vial",
		Type = "Utility"
	},
	gold_vial = {
		DisplayName = "Gold Vial",
		Image = "Gold Vial.png",
		Pack = "Neutral",
		Cost = "6",
		Ability = "Drag onto your gold counter to gain +8 gold.",
		Class = "Vial",
		Type = "Utility"
	},
	health_vial = {
		DisplayName = "Health Vial",
		Image = "Health Vial.png",
		Pack = "Neutral",
		Cost = "8",
		Ability = "Use on health bar to gain +100 max HP.",
		Class = "Vial",
		Type = "Utility"
	},
		
	heal_vial = {
		DisplayName = "Heal Vial",
		Image = "Heal Vial.png",
		Pack = "Neutral",
		Cost = "12",
		Ability = "Use on item to give it +3 heal.",
		Class = "Vial",
		Type = "Weapon-Buff"
	},
	poison_vial = {
		DisplayName = "Poison Vial",
		Image = "Poison Vial.png",
		Pack = "Neutral",
		Cost = "15",
		Ability = "Use on item to give it +1 Poison.",
		Class = "Vial",
		Type = "Weapon-Buff"
	},
	shield_vial = {
		DisplayName = "Shield Vial",
		Image = "Shield Vial.png",
		Pack = "Neutral",
		Cost = "12",
		Ability = "Use on item to give it +3 shield.",
		Class = "Vial",
		Type = "Weapon-Buff"
	},
	time_vial = {
		DisplayName = "Time Vial",
		Image = "Time Vial.png",
		Pack = "Neutral",
		Cost = "10",
		Ability = "Use on item to give it -0.2s cooldown.",
		Class = "Vial",
		Type = "Weapon-Buff"
	},
	morph_vial = {
		DisplayName = "Morph Vial",
		Image = "Morph Vial.png",
		Pack = "Neutral",
		Cost = "8",
		Ability = "Use on item to transform it into a random item of the same rarity.",
		Class = "Vial",
		Type = "Weapon-Buff"
	},
	shock_vial = {
		DisplayName = "Shock Vial",
		Image = "Shock Vial.png",
		Pack = "Neutral",
		Cost = "10",
		Ability = "Use on item to give it +1 shock.",
		Class = "Vial",
		Type = "Weapon-Buff"
	},
	morph_potion = {
		DisplayName = "Morph Potion",
		Image = "Morph Potion.png",
		Pack = "Neutral",
		Cost = "20",
		Ability = "Use on item to transform it into a random item.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	beetle_potion = {
		DisplayName = "Beetle Potion",
		Image = "Beetle Potion.png",
		Pack = "Neutral",
		Cost = "15",
		Ability = "Drag onto your gold counter to gain +20 gold.",
		Class = "Potion",
		Type = "Utility"
	},
	cloud_in_a_bottle = {
		DisplayName = "Cloud in a Bottle",
		Image = "Cloud in a Bottle.png",
		Pack = "Neutral",
		Cost = "15",
		Ability = "Use on Reroll button to gain 8 free rerolls.",
		Class = "Potion",
		Type = "Utility"
	},
	iron_potion = {
		DisplayName = "Iron Potion",
		Image = "Iron Potion.png",
		Pack = "Neutral",
		Cost = "18",
		Ability = "Use on item to give it +8 shield.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	jungleblood = {
		DisplayName = "Jungleblood",
		Image = "Jungleblood.png",
		Pack = "Neutral",
		Cost = "45",
		Ability = "Use on item to give it +8 poison.",
		Class = "Major Potion",
		Type = "Weapon-Buff"
	},
	liquid_knowledge = {
		DisplayName = "Liquid Knowledge",
		Image = "Liquid Knowledge.png",
		Pack = "Neutral",
		Cost = "40",
		Ability = "Use on XP bar to gain a level.",
		Class = "Major Potion",
		Type = "Utility"
	},
	mending_serum = {
		DisplayName = "Mending Serum",
		Image = "Mending Serum.png",
		Pack = "Neutral",
		Cost = "18",
		Ability = "Use on item to give it +8 heal.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	phantom_brew = {
		DisplayName = "Phantom Brew",
		Image = "Phantom Brew.png",
		Pack = "Neutral",
		Cost = "60",
		Ability = "Use on item to give it +1 multicast.",
		Class = "Major Potion",
		Type = "Weapon-Buff"
	},
	arcane_essence = {
		DisplayName = "Arcane Essence",
		Image = "Arcane Essence.png",
		Pack = "Arcane",
		Cost = "15",
		Ability = "Use on item to give it the Arcane tag.",
		Class = "Essence",
		Type = "Weapon-Buff"
	},
	crystal_essence = {
		DisplayName = "Crystal Essence",
		Image = "Crystal Essence.png",
		Pack = "Crystal",
		Cost = "15",
		Ability = "Use on item to give it the Crystal tag.",
		Class = "Essence",
		Type = "Weapon-Buff"
	},
	dark_essence = {
		DisplayName = "Dark Essence",
		Image = "Dark Essence.png",
		Pack = "Dark",
		Cost = "15",
		Ability = "Use on item to give it the Dark tag.",
		Class = "Essence",
		Type = "Weapon-Buff"
	},
	elf_essence = {
		DisplayName = "Elf Essence",
		Image = "Elf Essence.png",
		Pack = "Elven",
		Cost = "15",
		Ability = "Use on item to give it the Elven tag.",
		Class = "Essence",
		Type = "Weapon-Buff"
	},
	flame_essence = {
		DisplayName = "Flame Essence",
		Image = "Flame Essence.png",
		Pack = "Flame",
		Cost = "15",
		Ability = "Use on item to give it the Flame tag.",
		Class = "Essence",
		Type = "Weapon-Buff"
	},
	frost_essence = {
		DisplayName = "Frost Essence",
		Image = "Frost Essence.png",
		Pack = "Frosty",
		Cost = "15",
		Ability = "Use on item to give it the Frosty tag.",
		Class = "Essence",
		Type = "Weapon-Buff"
	},
	holy_essence = {
		DisplayName = "Holy Essence",
		Image = "Holy Essence.png",
		Pack = "Holy",
		Cost = "15",
		Ability = "Use on item to give it the Holy tag.",
		Class = "Essence",
		Type = "Weapon-Buff"
	},
	moon_essence = {
		DisplayName = "Moon Essence",
		Image = "Moon Essence.png",
		Pack = "Moon",
		Cost = "15",
		Ability = "Use on item to give it the Moon tag.",
		Class = "Essence",
		Type = "Weapon-Buff"
	},
	storm_essence = {
		DisplayName = "Storm Essence",
		Image = "Storm Essence.png",
		Pack = "Storm",
		Cost = "15",
		Ability = "Use on item to give it the Storm tag.",
		Class = "Essence",
		Type = "Weapon-Buff"
	},
	witch_essence = {
		DisplayName = "Witch Essence",
		Image = "Witch Essence.png",
		Pack = "Witch",
		Cost = "15",
		Ability = "Use on item to give it the Witch tag.",
		Class = "Essence",
		Type = "Weapon-Buff"
	},
	royal_drops = {
		DisplayName = "Royal Drops",
		Image = "Royal Drops.png",
		Pack = "Neutral",
		Cost = "-",
		Ability = "Use on an item in the shop to gain 3 copies of that item.",
		Class = "Special Potion",
		Type = "Utility"
	},
	holy_water = {
		DisplayName = "Holy Water",
		Image = "Holy Water.png",
		Pack = "Neutral",
		Cost = "-",
		Ability = "Gain +15000 Max HP.",
		Class = "Special Potion",
		Type = "Utility"
	},
	crownforge_brew = {
		DisplayName = "Crownforge Brew",
		Image = "Crownforge.png",
		Pack = "Neutral",
		Cost = "200",
		Ability = "Use on a [[File:Star Purple.png|20x20px|link=]][[File:Star Purple.png| 20x20px|link=]] item to upgrade it to a [[File:Star Red.png| 20x20px|link=]][[File:Star Red.png| 20x20px|link=]][[File:Star Red.png| 20x20px|link=]] item.",
		Class = "Major Potion",
		Type = "Weapon-Buff"
	},
	liquid_luck = {
		DisplayName = "Liquid Luck",
		Image = "Liquid Luck.png",
		Pack = "Neutral",
		Cost = "30",
		Ability = "Gain +3% Luck.",
		Class = "Major Potion",
		Type = "Utility"
	},
	small_luck_potion = {
		DisplayName = "Small Luck Potion",
		Image = "Small Luck Potion.png",
		Pack = "Neutral",
		Cost = "15",
		Ability = "Gain +1% Luck.",
		Class = "Potion",
		Type = "Utility"
	},
	starlight_potion = {
		DisplayName = "Starlight Potion",
		Image = "Starlight Potion.png",
		Pack = "Neutral",
		Cost = "100",
		Ability = "Use to gain a [[Goblet]], +5 Income, and a random 1-Star [[Legendary]].",
		Class = "Major Potion",
		Type = "Utility"
	},
	jar_of_charges = {
		DisplayName = "Jar of Charges",
		Image = "Jar of Charges.png",
		Pack = "Neutral",
		Cost = "35",
		Ability = "Give an item +1 Max Charge permanently.",
		Class = "Major Potion",
		Type = "Weapon-Buff"
	},
	ink = {
		DisplayName = "Ink",
		Image = "Ink.png",
		Pack = "Dark",
		Cost = "5",
		Ability = "Use on item to set its cooldown to 100s.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	sharpness_oil = {
		DisplayName = "Sharpness Oil",
		Image = "Sharpness Oil.png",
		Pack = "Neutral",
		Cost = "12",
		Ability = "Use on item to give it +4 damage and +15% crit.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	shock_potion = {
		DisplayName = "Shock Potion",
		Image = "Shock Potion.png",
		Pack = "Neutral",
		Cost = "12",
		Ability = "Use on item to give it +3 shock.",
		Class = "Potion",
		Type = "Weapon-Buff"
	},
	thunder_potion = {
		DisplayName = "Thunder Potion",
		Image = "Thunder Potion.png",
		Pack = "Neutral",
		Cost = "12",
		Ability = "Use to permanently increase shock damage by +20.",
		Class = "Potion",
		Type = "Utility"
	},
-- Encounters
	priest = {
		DisplayName = "Priest",
		Image = "Priest.png",
		Day = "3",
		Option1Name = "Healing Touch",
		Option1 = "Increase your Max HP by 100% and gain +10 Gold.",
		Option2Name = "Blessing",
		Option2 = "Gain +300 Max HP and +10 Income.",
		LimitedTime = "not seasonal",
	},
	blacksmith = {
		DisplayName = "Blacksmith",
		Image = "Blacksmith.png",
		Day = "4",
		Option1Name = "Upgrade!",
		Option1 = "Give a weapon +8 damage and +30% crit chance.",
		Option2Name = "Heavy Armor",
		Option2 = "Start each fight with 10% max hp as shield.",
		LimitedTime = "not seasonal",
	},
	home_brewer = {
		DisplayName = "Home Brewer",
		Image = "HomeBrewer.png",
		Day = "4",
		Option1Name = "Ask About His Hidden Drawer",
		Option1 = "Gain 2 random vials.",
		Option2Name = "Try the Home-Brew",
		Option2 = "Gain a [[Home-Brew]] with random stats.",
		LimitedTime = "not seasonal",
	},
	traveller = {
		DisplayName = "Traveller",
		Image = "Traveller.png",
		Day = "4",
		Option1Name = "Freerolls",
		Option1 = "Gain 2 free rerolls and +2 free rerolls each day (can accumulate).",
		Option2Name = "Traveller's Stock",
		Option2 = "Gain 4x [[Cloud in a Vial]].",
		LimitedTime = "not seasonal",
	},
	pirate = {
		DisplayName = "Pirate",
		Image = "Pirate.png",
		Day = "4",
		Option1Name = "Hooked",
		Option1 = "Gain a [[Hook]] with 30% extra crit chance.",
		Option2Name = "Plunder",
		Option2 = "Gain a [[Goblet]] and 10[[file:Gold.png|13x13px]].",
		LimitedTime = "not seasonal",
	},
	warrior = {
		DisplayName = "Warrior",
		Image = "Warrior.png",
		Day = "4",
		Option1Name = "Weapon Loot",
		Option1 = "Gain 2 random common weapons.",
		Option2Name = "Sharpen",
		Option2 = "Give your weapons +6 damage permanently.",
		LimitedTime = "not seasonal",
	},
	shieldbearer = {
		DisplayName = "Shieldbearer",
		Image = "Shieldbearer.png",
		Day = "4",
		Option1Name = "Take My Shield",
		Option1 = "Gain a [[Lifeguard]] with +1 multicast.",
		Option2Name = "Shield Mastery",
		Option2 = "Give a shield +1 multicast and +10 shield.",
		LimitedTime = "not seasonal",
	},
	potion_seller = {
		DisplayName = "Potion Seller",
		Image = "Potion_Seller.png",
		Day = "4",
		Option1Name = "Regular Stock",
		Option1 = "Get a random weapon-buff potion.",
		Option2Name = "Special Stock",
		Option2 = "Gain a [[Value Potion]].",
		LimitedTime = "not seasonal",
	},
	elven_archer = {
		DisplayName = "Elven Archer",
		Image = "Elven_Archer.png",
		Day = "6",
		Option1Name = "Take my Bow",
		Option1 = "Gain a [[Regular Bow]] with [[Elven]] and +4 Multicast.",
		Option2Name = "Elven Favor",
		Option2 = "Gain an artillery slot.",
		LimitedTime = "not seasonal",
	},
	sage = {
		DisplayName = "Sage",
		Image = "Sage.png",
		Day = "6",
		Option1Name = "Sacred Touch",
		Option1 = "Gain a vitality slot.",
		Option2Name = "Holy Favor",
		Option2 = "Gain a [[Mending Serum]] and a [[Healing Word]] with +1 Multicast.",
		LimitedTime = "not seasonal",
	},
	salesman = {
		DisplayName = "Salesman",
		Image = "Salesman.png",
		Day = "6",
		Option1Name = "Bargain Contract",
		Option1 = "Some items in the shop will be on sale.",
		Option2Name = "Discount License",
		Option2 = "Gain 15[[file:Gold.png|13x13px]]. Reduce the cost of rerolls by 1[[file:Gold.png|13x13px]].",
		LimitedTime = "not seasonal",
	},
	elder = {
		DisplayName = "Elder",
		Image = "Elder.png",
		Day = "6",
		Option1Name = "Learn by Doing",
		Option1 = "Gain 16 XP. Permanent buff: gain +16 XP per day.",
		Option2Name = "Instant Knowledge",
		Option2 = "Gain 40 XP",
		LimitedTime = "not seasonal",
	},
	enchanter = {
		DisplayName = "Enchanter",
		Image = "Enchanter.png",
		Day = "6",
		Option1Name = "Enchant",
		Option1 = "Upgrade a common or rare item (up to 2 star).",
		Option2Name = "Discover Item",
		Option2 = "Gain an epic chest reward.",
		LimitedTime = "not seasonal",
	},
	chronomancer = {
		DisplayName = "Chronomancer",
		Image = "Chronomancer.png",
		Day = "6",
		Option1Name = "Request Potion",
		Option1 = "Gain a [[Time Tonic]].",
		Option2Name = "Request Artifact",
		Option2 = "Gain a [[Time Pendant]].",
		LimitedTime = "not seasonal",
	},
	granny = {
		DisplayName = "Granny",
		Image = "Granny.png",
		Day = "6",
		Option1Name = "Check her assortment.",
		Option1 = "A shop containing 7 potions.",
		Option2Name = "Steal",
		Option2 = "Steal 1 potion from Granny's assortment..",
		LimitedTime = "not seasonal",
	},
	cleric = {
		DisplayName = "Cleric",
		Image = "Cleric.png",
		Day = "8",
		Option1Name = "Lifesurge",
		Option1 = "Gain +2000 max health and regain 2 lives",
		Option2Name = "Vitality",
		Option2 = "Gain +2500 max health.",
		LimitedTime = "not seasonal",
	},
	carmen = {
		DisplayName = "Carmen",
		Image = "Carmen.png",
		Day = "9",
		Option1Name = "Lucky Rerolls",
		Option1 = "Gain +15% luck.",
		Option2Name = "Walk on Water",
		Option2 = "Permanently reduce CD of all your items by 0.3s.",
		LimitedTime = "not seasonal",
	},
	lyra = {
		DisplayName = "Lyra",
		Image = "Lyra.png",
		Day = "9",
		Option1Name = "Northern Blessing",
		Option1 = "Gain a [[Frozen Orb]] and make an item [[Frosty]].",
		Option2Name = "Absolute Zero",
		Option2 = "Drag to freeze individual items. They persist through rerolls and become likelier to appear.",
		LimitedTime = "not seasonal",
	},
	count_vlado = {
		DisplayName = "Count Vlado",
		Image = "Count_Vlado.png",
		Day = "9",
		Option1Name = "Gain His Amulet",
		Option1 = "Gain a tripled [[Nightquill]].",
		Option2Name = "Cursed Artifact",
		Option2 = "Discover a [[:Category:Items#Cursed_Items-0|Cursed Artifact]].",
		LimitedTime = "not seasonal",
	},
	celestia = {
		DisplayName = "Celestia",
		Image = "Celestia.png",
		Day = "9",
		Option1Name = "Special Gift",
		Option1 = "Gain 15 gold and a [[Mirror Elixir]].",
		Option2Name = "Wish",
		Option2 = "Upgrade a 2* item to 3* in 2 days.",
		LimitedTime = "not seasonal",
	},
	master_alderos = {
		DisplayName = "Master Alderos",
		Image = "Master_Alderos.png",
		Day = "9",
		Option1Name = "Ascendence",
		Option1 = "Upgrade an epic item or below.",
		Option2Name = "Wisdom",
		Option2 = "Fill your tower with random [[Slots|slot buffs]].",
		LimitedTime = "not seasonal",
	},
	king_midas = {
		DisplayName = "King Midas",
		Image = "Midas.png",
		Day = "9",
		Option1Name = "Make an Offering",
		Option1 = "Pay 20 gold and gain a random blessing chosen from 2.",
		Option2Name = "Accept some valuables",
		Option2 = "Gain 1x [[Treasure Chest]].",
		LimitedTime = "not seasonal",
	},
	bishop = {
		DisplayName = "Bishop",
		Image = "Bishop.png",
		Day = "11",
		Option1Name = "Exaltation",
		Option1 = "Gain +7000 max health and give all your items +15 damage.",
		Option2Name = "Benediction",
		Option2 = "Gain +6500 max health and 3 lucky rerolls.",
		LimitedTime = "not seasonal",
    },
    shady_dealer = {
	    DisplayName = "Shady Dealer",
	    Image = "ShadyDealer.png",
	    Day = "18",
	    Option1Name = "No Thanks",
	    Option1 = "Refuse the offer and pickpocket 5 gold from the dealer.",
	    Option2Name = "Listen, Kid..",
	    Option2 = "Lose 15 rating points. Day 23: Gain +30 rating points.",
        LimitedTime = "not seasonal", 
	},
	miriel = {
		DisplayName = "Miriel",
		Image = "Miriel.png",
		Day = "N/A",
		Option1Name = "Toss a Coin to Your Angel",
		Option1 = "Revive with 2 life and gain 45 [[file:Gold.png|13x13px]].",
		Option2Name = "Answer the Call",
		Option2 = "Revive with 2 lives, gain 16 XP and gain 1 epic chest.",
		LimitedTime = "not seasonal",
	},
	mr_spook = {
		DisplayName = "Mr. Spook",
		Image = "Mr. Spook.png",
		Day = "6",
		Option1Name = "Trick or Treat",
		Option1 = "[[Candy]] will now appear in the shop.",
		Option2Name = "Witch Bargain",
		Option2 = "Gain a [[Brew Today]].",
		LimitedTime = "seasonal",
	},
	nicholas = {
		DisplayName = "Nicholas",
		Image = "Nicholas.png",
		Day = "9",
		Option1Name = "Wheel of Fortune",
		Option1 = "Wheel of Fortune:-Price 8[[File:Gold.png|16x16px]]. Increase by +3[[File:Gold.png|16x16px]] per spin.",
		Option2Name = "Presents!",
		Option2 = "Present will now appear in the shop",
		LimitedTime = "seasonal",
	},
-- Perks
	random_perk = {
		DisplayName = "Random",
		Image = "Random.png",
		Perk = "Perk",
		Unlock = "Unlock all other perks.",
		Ability = "Gain a random perk each game. This provides a little extra rating in ranked(+5%)."
	},
	tempo = {
		DisplayName = "Tempo",
		Image = "Tempo.png",
		Perk = "Perk",
		Unlock = "Unlocked by default.",
		Ability = "Start with +10 Gold and a random 15g item."
	},
	scorch = {
		DisplayName = "Scorch",
		Image = "Scorch.png",
		Perk = "Perk",
		Unlock = "Unlocked by default.",
		Ability = "Start with a [[Wildfire]]. Day 3: Gain a [[Slots|Burn Slot]]."
	},
	toxic = {
		DisplayName = "Toxic",
		Image = "Toxic.png",
		Perk = "Perk",
		Unlock = "Unlocked by default.",
		Ability = "Start with a [[Refined Spear]]. Day 4: Gain a [[Slots|Poison Slot]]."
	},
	chosen = {
		DisplayName = "Chosen",
		Image = "Chosen.png",
		Perk = "Perk",
		Unlock = "Unlocked by default.",
		Ability = "Start with a [[Slots|Heal Slot]]."
	},
	turtle = {
		DisplayName = "Turtle",
		Image = "Turtle.png",
		Perk = "Perk",
		Unlock = "Buy 30 shields.",
		Ability = "Start with a [[Slots|Shield Slot]]."
	},
	lucky = {
		DisplayName = "Lucky",
		Image = "Lucky.png",
		Perk = "Perk",
		Unlock = "Get a lucky roll on day 3.",
		Ability = "Start with a random 15g item. Day 3 and 8: Gain +2% luck."
	},
	strike = {
		DisplayName = "Strike",
		Image = "Strike.png",
		Perk = "Perk",
		Unlock = "Have an item with 99+ [[multicast]].",
		Ability = "Start with a [[Silver Lance]]. Day 8: Gain a [[Slots|Multicast Slot]]."
	},
	darkness = {
		DisplayName = "Darkness",
		Image = "Darkness.png",
		Perk = "Perk",
		Unlock = "Earn the 10th Trophy with a full [[Dark]] build 2 times.",
		Ability = "Start with a [[Twilight's Edge]]. Day 7: Gain a [[Slots|Night Slot]]."
	},
	sugar_rush = {
		DisplayName = "Sugar Rush",
		Image = "Sugar Rush.png",
		Perk = "Perk",
		Unlock = "Obtain a total of 30 [[Candy|candies]].",
		Ability = "Start with +5 Gold. From day 4 and forward, gain a piece of [[Candy]]."
	},
	treasure = {
		DisplayName = "Treasure",
		Image = "Treasure.png",
		Perk = "Perk",
		Unlock = "Discover 50 items from Epic chests.",
		Ability = "When reaching level 5: Gain an Epic Chest. Chests contain 4 items instead of 3."
	},
	power = {
		DisplayName = "Power",
		Image = "Power.png",
		Perk = "Perk",
		Unlock = "Deal a critical strike for 10,000 Damage.",
		Ability = "Start with a [[Slots|Damage Slot]] and a [[Slots|Crit Slot]]."
	},
	electric = {
		DisplayName = "Electric",
		Image = "Electric.png",
		Perk = "Perk",
		Unlock = "Increase your [[shock]] damage to a total of 300 in one game.",
		Ability = "Start with a [[Slots|Shock Slot]] and +5 Gold. Day 4: Gain +5 [[Shock]] Damage."
	},
	archmage = {
		DisplayName = "Archmage",
		Image = "Archmage.png",
		Perk = "Perk",
		Unlock = "Earn the 10th Trophy with only [[Spell|Spells]] or [[Magic]] items in your tower 2 times.",
		Ability = "Start with a random common Spellbook. Day 5: Gain a [[Slots|Magic Slot]]."
	},
	gathering = {
		DisplayName = "Gathering",
		Image = "Gathering.png",
		Perk = "Perk",
		Unlock = "Talk to every [[encounter]].",
		Ability = "Start with 3 free rerolls. You will have 3 [[encounter]] options instead of 2."
	},
	hex = {
		DisplayName = "Hex",
		Image = "Hex.png",
		Perk = "Perk",
		Unlock = "Earn the 10th Trophy with a full [[Arcane]] build 2 times.",
		Ability = "Start with a [[Voidspike]]. Day 7: Gain a [[Slots|Hex Slot]]."
	},
	stock = {
		DisplayName = "Stock",
		Image = "Stock.png",
		Perk = "Perk",
		Unlock = "Buy 500 items.",
		Ability = "Start with +5 Gold. The shop contains 8 items instead of 7."
	},
	essential_oils = {
		DisplayName = "Essential Oils",
		Image = "Essential Oils.png",
		Perk = "Perk",
		Unlock = "Use an [[Essence]] to give an item a new tag 3 times.",
		Ability = "Day 5: Discover one of two [[Essence|Essences]]."
	},
	melee = {
		DisplayName = "Melee",
		Image = "Melee.png",
		Perk = "Perk",
		Unlock = "Earn the 10th Trophy with 6 Melee items 5 times.",
		Ability = "Start with a [[Bone Club]]. Day 3: Gain a [[Slots|Melee Slot]]."
	},
	artillery = {
		DisplayName = "Artillery",
		Image = "Artillery.png",
		Perk = "Perk",
		Unlock = "Earn the 10th Trophy with only a [[Regular Bow]].",
		Ability = "Start with a [[Regular Bow]]. Day 4: Gain an [[Slots|Artillery Slot]]."
	},
	flash_sale = {
		DisplayName = "Flash Sale",
		Image = "Flash Sale.png",
		Perk = "Perk",
		Unlock = "Buy 50 items on sale.",
		Ability = "Start with +5 Gold. The first shop on day 3, 8 and 11 will be on sale."
	},
	merge = {
		DisplayName = "Merge",
		Image = "Merge.png",
		Perk = "Perk",
		Unlock = "Earn the 10th Trophy with a 3-star item 2 times.",
		Ability = "Obtaining two 2-Star items will combine them into a 3-Star item. Only works once and from day 7+."
	},
	growth = {
		DisplayName = "Growth",
		Image = "Growth.png",
		Perk = "Perk",
		Unlock = "Reduce cooldowns with [[Dream Catcher]] 300 times.",
		Ability = "Start with a [[Slots|Time Slot]]."
	},
	gambit = {
		DisplayName = "Gambit",
		Image = "Gambit.png",
		Perk = "Perk",
		Unlock = "Earn 10 trophies while only ever buying Epic items.",
		Ability = "Day 2: Gain a random Epic item. You start with -25% HP and -15 Gold."
	},
-- Slots
	night_slot = {
		DisplayName = "Night Slot",
		Image = "Night Slot.png",
		Slot = "Slot",
		Ability = "Start of Combat effects trigger twice here."
	},
	pandoras_slot = {
		DisplayName = "Pandora's Slot",
		Image = "Pandoras Slot.png",
		Slot = "Slot",
		Ability = "Start of Day: Gain x plain copies of this item (except [[Pandora's Box]])."
	},
	bleed_slot = {
		DisplayName = "Bleed Slot",
		Image = "Bleed Slot.png",
		Slot = "Slot",
		Ability = "This slot grants +2 Bleed."
	},
	burn_slot = {
		DisplayName = "Burn Slot",
		Image = "Burn Slot.png",
		Slot = "Slot",
		Ability = "This slot grants +x Burn. (+2 every 4 days)"
	},
	crit_slot = {
		DisplayName = "Crit Slot",
		Image = "Crit Slot.png",
		Slot = "Slot",
		Ability = "This slot grants +25% crit chance."
	},
	damage_slot = {
		DisplayName = "Damage Slot",
		Image = "Damage Slot.png",
		Slot = "Slot",
		Ability = "This slot grants +x damage. (+3 every 3 days)"
	},
	heal_slot = {
		DisplayName = "Heal Slot",
		Image = "Heal Slot.png",
		Slot = "Slot",
		Ability = "This slot grants +x Heal. (+5 every 3 days)"
	},
	multicast_slot = {
		DisplayName = "Multicast Slot",
		Image = "Multicast Slot.png",
		Slot = "Slot",
		Ability = "This slot grants +1 Multicast."
	},
	poison_slot = {
		DisplayName = "Poison Slot",
		Image = "Poison Slot.png",
		Slot = "Slot",
		Ability = "This slot grants +x Poison. (+2 every 4 days)"
	},
	shield_slot = {
		DisplayName = "Shield Slot",
		Image = "Shield Slot.png",
		Slot = "Slot",
		Ability = "This slot grants +x Shield. (+5 every 3 days)"
	},
	shock_slot = {
		DisplayName = "Shock Slot",
		Image = "Shock Slot.png",
		Slot = "Slot",
		Ability = "This slot grants +2 Shock."
	},
	magic_slot = {
		DisplayName = "Magic Slot",
		Image = "Magic Slot.png",
		Slot = "Slot",
		Ability = "Spells and Magic items here have 25% reduced CD."
	},
	hex_slot = {
		DisplayName = "Hex Slot",
		Image = "Hex Slot.png",
		Slot = "Slot",
		Ability = "Each day, this slots grants a random debuff permanently."
	},
	melee_slot = {
		DisplayName = "Melee Slot",
		Image = "Melee Slot.png",
		Slot = "Slot",
		Ability = "Melee item here has +25% damage."
	},
	vitality_slot = {
		DisplayName = "Vitality Slot",
		Image = "Vitality Slot.png",
		Slot = "Slot",
		Ability = "First 3 triggers: Healing here also grants Max HP."
	},
	artillery_slot = {
		DisplayName = "Artillery Slot",
		Image = "Artillery Slot.png",
		Slot = "Slot",
		Ability = "Ranged item here fires 2 extra bolts (10 damage)."
	},
	midas_slot = {
		DisplayName = "Midas' Slot",
		Image = "Midas' Slot.png",
		Slot = "Slot",
		Ability = "Each day, increase this item's sell value by 25."
	},
	wild_slot = {
		DisplayName = "Wild Slot",
		Image = "Wild Slot.png",
		Slot = "Slot",
		Ability = "Each day, transform item here into a random one."
	},
	time_slot = {
		DisplayName = "Time Slot",
		Image = "Time Slot.png",
		Slot = "Slot",
		Ability = "Each day, reduce item's cooldown by 5% permanently."
	},
}

local function safeTrim(v)
    if type(v) ~= "string" then
        return ""
    end

    v = mw.text.trim(v)
    v = mw.ustring.lower(v)
    v = mw.ustring.gsub(v, "%s+", "")

    return v
end

function p.get(frame)
	local name = mw.ustring.lower(frame.args[1]) or ""
	name = name:gsub(" ", "_"):gsub("'", ""):gsub("%.", ""):gsub("-", "_")
	local field = frame.args[2] or ""
	local item = items[name]
	
	-- Fields that should error if item is missing
	if not item and (field == "displayname" or field == "table0" or field == "table1" or field == "table2" or field == "table3" or field == "potiontable" or field == "encountertable" or field == "template") then
		return "[[Module:ItemData|Module doesn't exist for " .. name .. "]]"
	end
	
	if item and item.field ~= nil then
		return item[field]
	end
	
	local function GetValue(key, default)
		if item[key] then
			return item[key]
		elseif default ~= nil then return default
		elseif (key == "Ability0" or key == "Ability1" or key == "Ability2" or key == "Ability3") then return "No ability."
		elseif key == "Pack" then return "Neutral"
		elseif key == "Damage" then return "0"
		else return "-"
		end
	end
	
	local function AffixCheck(key, Affix)
		if GetValue(key) ~= "-" and GetValue(key) ~= "Unobtainable" and GetValue(key) ~= "Unknown" then
			return Affix
		else
			return ""
		end
	end
		
	local function PackCheck(result)
		local pack2 = item.Pack2
		if pack2 then
			if result == "link" then
				return ", [[" .. pack2 .. "]]"
			elseif result == "category" then
				return "[[Category:" .. pack2 .. "]]"
			else
				return ""
			end
		else
			return ""
		end
	end
	
	local function MultiplyStat(key, mult)
		local val = tonumber(GetValue(key))
		if not val then
			return GetValue(key)
		end
		return val * mult
	end
	
	if field == "table0" and item then
		return "[[" .. item.DisplayName .. "]] [[file:" .. item.Image .. "|40x40px|left|link=" .. name .. "]]\n" ..
		"| [[File:" .. item.DamageType .. " Damage.png|20px|link=:Category:" .. item.DamageType .. " Damage]]" .. GetValue("Damage") .. "\n" ..
		"| " .. GetValue("Cooldown") .. AffixCheck("Cooldown", "s") .. "\n" ..
		"| " .. GetValue("Charges") .. "\n" ..
		"| " .. GetValue("Crit") .. AffixCheck("Crit", "%") .. "\n" ..
		"| " .. AffixCheck("Multicast", "+") .. GetValue("Multicast") .. "\n" ..
		"| " .. GetValue("Poison") .. "\n" ..
		"| " .. GetValue("Burn") .. "\n" ..
		"| " .. GetValue("Bleed") .. "\n" ..
		"| " .. GetValue("Shock") .. "\n" ..
		"| " .. GetValue("Block") .. "\n" ..
		"| " .. GetValue("Healing") .. "\n" ..
		"| [[" .. item.Tags .. "]]\n" ..
		"| [[" .. GetValue("Pack") .. "]]" .. PackCheck("link") .. "\n" ..
		"| " .. item.Cost .. AffixCheck("Cost", "[[File:Gold.png|17px|link=Shop]]") .. "\n" ..
		"| " .. GetValue("Ability0")
	end
	
	if field == "table1" and item then
		return "[[" .. item.DisplayName .. "]] [[file:" .. item.Image .. "|40x40px|left|link=" .. name .. "]]\n" ..
		"| [[File:" .. item.DamageType .. " Damage.png|20px|link=:Category:" .. item.DamageType .. " Damage]]" .. MultiplyStat("Damage", 2) .."\n" ..
		"| " .. GetValue("Cooldown") .. AffixCheck("Cooldown", "s") .. "\n" ..
		"| " .. GetValue("Charges") .. "\n" ..
		"| " .. MultiplyStat("Crit", 2) .. AffixCheck("Crit", "%") .. "\n" ..
		"| " .. AffixCheck("Multicast", "+") .. MultiplyStat("Multicast", 2) .."\n" ..
		"| " .. MultiplyStat("Poison", 2) .."\n" ..
		"| " .. MultiplyStat("Burn", 2) .."\n" ..
		"| " .. MultiplyStat("Bleed", 2) .."\n" ..
		"| " .. MultiplyStat("Shock", 2) .."\n" ..
		"| " .. MultiplyStat("Block", 2) .."\n" ..
		"| " .. MultiplyStat("Healing", 2) .."\n" ..
		"| [[" .. item.Tags .. "]]\n" ..
		"| [[" .. GetValue("Pack") .. "]]" .. PackCheck("link") .. "\n" ..
		"| " .. MultiplyStat("Cost", 3) .. AffixCheck("Cost", "[[File:Gold.png|17px|link=Shop]]") .. "\n" ..
		"| " .. GetValue("Ability1")
	end
	
	if field == "table2" and item then
		return "[[" .. item.DisplayName .. "]] [[file:" .. item.Image .. "|40x40px|left|link=" .. name .. "]]\n" ..
		"| [[File:" .. item.DamageType .. " Damage.png|20px|link=:Category:" .. item.DamageType .. " Damage]]" .. MultiplyStat("Damage", 4) .."\n" ..
		"| " .. GetValue("Cooldown") .. AffixCheck("Cooldown", "s") .. "\n" ..
		"| " .. GetValue("Charges") .. "\n" ..
		"| " .. MultiplyStat("Crit", 4) .. AffixCheck("Crit", "%") .. "\n" ..
		"| " .. AffixCheck("Multicast", "+") .. MultiplyStat("Multicast", 4) .."\n" ..
		"| " .. MultiplyStat("Poison", 4) .."\n" ..
		"| " .. MultiplyStat("Burn", 4) .."\n" ..
		"| " .. MultiplyStat("Bleed", 4) .."\n" ..
		"| " .. MultiplyStat("Shock", 4) .."\n" ..
		"| " .. MultiplyStat("Block", 4) .."\n" ..
		"| " .. MultiplyStat("Healing", 4) .."\n" ..
		"| [[" .. item.Tags .. "]]\n" ..
		"| [[" .. GetValue("Pack") .. "]]" .. PackCheck("link") .. "\n" ..
		"| " .. MultiplyStat("Cost", 6) .. AffixCheck("Cost", "[[File:Gold.png|17px|link=Shop]]") .. "\n" ..
		"| " .. GetValue("Ability2")
	end
	
	if field == "table3" and item then
		return "[[" .. item.DisplayName .. "|" .. (item.SecondName or item.DisplayName) .. "]] [[file:" .. item.Image .. "|40x40px|left|link=" .. name .. "]]\n" ..
		"| [[File:" .. item.DamageType .. " Damage.png|20px|link=:Category:" .. item.DamageType .. " Damage]]" .. MultiplyStat("Damage", 8) .."\n" ..
		"| " .. GetValue("Cooldown") .. AffixCheck("Cooldown", "s") .. "\n" ..
		"| " .. GetValue("Charges") .. "\n" ..
		"| " .. MultiplyStat("Crit", 8) .. AffixCheck("Crit", "%") .. "\n" ..
		"| " .. AffixCheck("Multicast", "+") .. MultiplyStat("Multicast", 8) .."\n" ..
		"| " .. MultiplyStat("Poison", 8) .."\n" ..
		"| " .. MultiplyStat("Burn", 8) .."\n" ..
		"| " .. MultiplyStat("Bleed", 8) .."\n" ..
		"| " .. MultiplyStat("Shock", 8) .."\n" ..
		"| " .. MultiplyStat("Block", 8) .."\n" ..
		"| " .. MultiplyStat("Healing", 8) .."\n" ..
		"| [[" .. item.Tags .. "]]\n" ..
		"| [[" .. GetValue("Pack") .. "]]" .. PackCheck("link") .. "\n" ..
		"| " .. MultiplyStat("Cost", 12) .. AffixCheck("Cost", "[[File:Gold.png|17px|link=Shop]]") .. "\n" ..
		"| " .. GetValue("Ability3")
	end
	
	if field == "potiontable" and item then
		return "[[" .. item.DisplayName .. "]] [[file:" .. item.Image .. "|45x45px|left|link=" .. name .. "]]\n" ..
		"| " .. item.Cost .. AffixCheck("Cost", "[[File:Gold.png|17px|link=Shop]]") .. "\n" ..
		"| [[" .. GetValue("Pack") .. "]]" .. PackCheck("link") .. "\n" ..
		"| " .. item.Ability .. "\n" ..
		"| [[" .. item.Type .. "]]"
	end
	
	if field == "encountertable" and item then
		return "[[" .. item.DisplayName .. "]] [[file:" .. item.Image .. "|60x60px|left|link=" .. item.DisplayName .. "]]\n" ..
		"| " .. item.Day .. "\n" ..
		"| " .. item.Option1Name .. " - " .. item.Option1 .. "\n" ..
		"| " .. item.Option2Name .. " - " .. item.Option2
	end
	
	if field == "perktable" and item then
		return "[[" .. item.DisplayName .. "]] [[file:" .. item.Image .. "|50x50px|left|link=" .. item.DisplayName .. "]]\n" ..
		"| " .. item.Ability .. "\n" ..
		"| " .. item.Unlock
	end
	
	if field == "slottable" and item then
		return "[[" .. item.DisplayName .. "]] [[file:" .. item.Image .. "|50x50px|left|link=" .. item.DisplayName .. "]]\n" ..
		"| " .. item.Ability .. "\n"
	end
	
	if item ~= nil then
		return GetValue(field)
	end
	
	return ""
end

function p.TemplateData(frame)
	local name = mw.ustring.lower(frame.args[1]) or ""
	name = name:gsub(" ", "_"):gsub("'", ""):gsub("%.", ""):gsub("-", "_")
	local item = items[name]
	
	local function GetValue(key, default)
		if item[key] then
			return item[key]
		elseif default ~= nil then return default
		elseif (key == "Ability0" or key == "Ability1" or key == "Ability2" or key == "Ability3") then return "No ability."
		elseif key == "Pack" then return "Neutral"
		elseif key == "Damage" then return "0"
		else return "-"
		end
	end
		
	local function PackCheck(result)
		local pack2 = item.Pack2
		if pack2 then
			if result == "link" then
				return ", [[" .. pack2 .. "]]"
			elseif result == "category" then
				return "[[Category:" .. pack2 .. "]]"
			else
				return ""
			end
		else
			return ""
		end
	end
	
	local display = item.DisplayName
	local pack = GetValue("Pack")
	local pack2 = PackCheck("link")
	local image = "[[File:" .. item.Image .. "|125px|link=" .. display .. "]]"
	local tag = item.Tags
	local rarity = item.Rarity
	local cost = item.Cost
	local class = item.Class
	local perk = item.Perk
	local limited = item.LimitedTime
	local slot = item.Slot
	
	local function costcheck(mult)
		if mult == nil then mult = 1 end
		
		if cost and cost ~= "-" and cost ~= "Unknown" then
			return cost * mult .. "[[File:Gold.png|17px|link=Shop]]"
		else
			return ""
		end
	end
	
	if rarity then
		local damage = tonumber(GetValue("Damage")) or 0
		local dmgtype = item.DamageType .. " Damage"
		local cooldown = tonumber(items[name]["Cooldown"]) or 1
		local critchance = tonumber(GetValue("Crit")) or 0
		local multi = tonumber(GetValue("Multicast")) or 0
		local poison = tonumber(GetValue("Poison")) or 0
		local burn = tonumber(GetValue("Burn")) or 0
		local bleed = tonumber(GetValue("Bleed")) or 0
		local shock = tonumber(GetValue("Shock")) or 0
		local block = tonumber(GetValue("Block")) or 0
		local heal = tonumber(GetValue("Healing")) or 0
		local name2 = item.SecondName or display
		local charges = tonumber(GetValue("Charges")) or 0
		
		if charges > 0 then
		else
			charges = ""
		end
		
		local function findcrit(mult)
			if mult == nil then mult = 1 end
			
			if critchance > 0 then 
				return "[[File:Crit.png|20px|link=Critical_Strikes]]" .. critchance * mult .. "%"
			else
				return ""
			end
		end
		
		local function findmulti(mult)
			if mult == nil then mult = 1 end
			
			if multi > 0 then
				return "[[Category:Multicast]][[File:Multicast Icon.png|20px|link=:Category:Multicast]] +" .. multi * mult
			else
				return ""
			end
		end
		
		local function debuffadd(mult)
			local debuffs = ""
			if mult == nil then mult = 1 end
			
			if poison > 0 then
				debuffs = debuffs .. "[[File:Poison Icon.png|20px|link=:Category:Poison]][[Category:Poison]] " .. poison * mult
			end
			
			if burn > 0 then
				if debuffs ~= "" then debuffs = debuffs .. ", " end
				debuffs = debuffs .. "[[File:Burn Icon.png|20x20px|link=:Category:Burn]][[Category:Burn]] " .. burn * mult
			end
			
			if bleed > 0 then
				if debuffs ~= "" then debuffs = debuffs .. ", " end
				debuffs = debuffs .. "[[File:Bleed Icon.png|20px|link=:Category:Bleed]][[Category:Bleed]] " .. bleed * mult
			end
			
			if shock > 0 then
				if debuffs ~= "" then debuffs = debuffs .. ", " end
				debuffs = debuffs .. "[[File:Shock Icon.png|20px|link=:Category:Shock]][[Category:Shock]] " .. shock * mult
			end
			
			if block > 0 then
				if debuffs ~= "" then debuffs = debuffs .. ", " end
				debuffs = debuffs .. "[[File:Block Icon.png|20x20px|link=:Category:Block]][[Category:Block]] " .. block * mult
			end
			
			if heal > 0 then
				if debuffs ~= "" then debuffs = debuffs .. ", " end
				debuffs = debuffs .. "[[File:Heal Icon.png|20x20px|link=:Category:Healing]][[Category:Healing]] " .. heal * mult
			end
			
			return debuffs
		end
		
		local function dpscalculate(mult)
			if mult == nil then mult = 1 end
			if damage > 0 then
				return math.floor(100 * damage * mult * (1 + math.min(mult*critchance/100, 1)) * math.min(multi*mult+1,10*cooldown) / cooldown)/100 .. "/s"
			else
				return ""
			end
		end
		
		
		return "*image=" .. image .. "$" ..
			"*0name=[[" .. display .. "]]$" ..
		    "*pack=[[Category:" .. pack .. "]][[" .. pack .. "]]" .. PackCheck("category") .. pack2 .. "$" ..
		    "*tag=[[Category:" .. tag .. "]][[" .. tag .. "]]$" ..
		    "*0ability=" .. GetValue("Ability0") .. "$" ..
		    "*rarity=[[Category:" .. rarity .. "]][[" .. rarity .. "]]$" ..
		    "*0cost=" .. costcheck() .. "$" ..
		    "*0damage=[[File:" .. dmgtype .. ".png|20px|link=:Category:" .. dmgtype .. "]]" .. damage .. "$" ..
		    "*CD=[[File:Cooldown_Icon.png|20px]]" .. cooldown .. "s$" ..
		    "*Charges=" .. charges .. "$" ..
		    "*0crit=" .. findcrit() .. "$" ..
		    "*0mult=" .. findmulti() .. "$" ..
		    "*0debuff=" .. debuffadd() .. "$" ..
		    "*0dps=" .. dpscalculate() .. "$" ..
		    -- 1 star
		    "*1ability=" .. GetValue("Ability1") .. "$" ..
		    "*1cost=" .. costcheck(3) .. "$" ..
		    "*1damage=[[File:" .. dmgtype .. ".png|20px|link=:Category:" .. dmgtype .. "]]" .. damage * 2 .. "$" ..
		    "*1crit=" .. findcrit(2) .. "$" ..
		    "*1mult=" .. findmulti(2) .. "$" ..
		    "*1debuff=" .. debuffadd(2) .. "$" ..
		    "*1dps=" .. dpscalculate(2) .. "$" ..
		    -- 2 star
		    "*2ability=" .. GetValue("Ability2") .. "$" ..
		    "*2cost=" .. costcheck(6) .. "$" ..
		    "*2damage=[[File:" .. dmgtype .. ".png|20px|link=:Category:" .. dmgtype .. "]]" .. damage * 4 .. "$" ..
		    "*2crit=" .. findcrit(4) .. "$" ..
		    "*2mult=" .. findmulti(4) .. "$" ..
		    "*2debuff=" .. debuffadd(4) .. "$" ..
		    "*2dps=" .. dpscalculate(4) .. "$" ..
		    -- 3 star
		    "*3name=[[" .. display .. "|" .. name2 .. "]]$" ..
		    "*3ability=" .. GetValue("Ability3") .. "$" ..
		    "*3cost=" .. costcheck(12) .. "$" ..
		    "*3damage=[[File:" .. dmgtype .. ".png|20px|link=:Category:" .. dmgtype .. "]]" .. damage * 8 .. "$" ..
		    "*3crit=" .. findcrit(8) .. "$" ..
		    "*3mult=" .. findmulti(8) .. "$" ..
		    "*3debuff=" .. debuffadd(8) .. "$" ..
		    "*3dps=" .. dpscalculate(8)
	elseif class then
		local itemtype = item.Type
		return "*ability=" .. GetValue("Ability") .. "$" ..
		"*cost=" .. costcheck() .. "$" ..
		"*0name=[[" .. display .. "]]$" ..
		"*pack=[[Category:" .. pack .. "]][[" .. pack .. "]]" .. PackCheck("category") .. pack2 .. "$" ..
		"*class=[[" .. class .. "]][[Category:" .. class .. "]]$" ..
		"*type=[[" .. itemtype .. "]][[Category:" .. itemtype .. "]]$" ..
		"*image=" .. image
	elseif limited then
		return "*0name=[[" .. display .. "]]$" ..
		"*image=" .. image .. "$" ..
		"*day=day " .. item.Day .. "$" ..
		"*1name=" .. item.Option1Name .. "$" ..
		"*2name=" .. item.Option2Name .. "$" ..
		"*1option=" .. item.Option1 .. "$" ..
		"*2option=" .. item.Option2
	elseif perk then
		return "*0name=[[" .. display .. "]]$" ..
		"*image=" .. image .. "$" ..
		"*ability=" .. GetValue("Ability") .. "$" ..
		"*unlock=" .. item.Unlock
	elseif slot then
		return "*0name=[[" .. display .. "]]$" ..
		"*image=" .. image .. "$" ..
		"*ability=" .. GetValue("Ability") .. "$" ..
		"*slot=slot"
	end
end
	

function p.GetTableByRarity(frame)
	local Rarity = frame.args.rarity or ""
	local TableType = safeTrim(frame.args.type or "")
	local TrimmedRarity = safeTrim(Rarity)
	
	-- 1. Create a temporary list so we can sort it
	local sortedList = {}
	
	-- 2. Filter items and put them into the list
	for name, item in pairs(items) do
		local match = false
		if safeTrim(item.Rarity or "") == TrimmedRarity then
			match = true
		elseif safeTrim(item.Class or "") == TrimmedRarity and TableType == "potiontable" then
			match = true
		elseif safeTrim(item.LimitedTime or "") == TrimmedRarity and TableType == "encountertable" then
			match = true
		elseif safeTrim(item.Perk or "") == TrimmedRarity and TableType == "perktable" then
			match = true
		elseif safeTrim(item.Slot or "") == TrimmedRarity and TableType == "slottable" then
			match = true
		end
		
		if match then
			-- Store the internal name and the full item data
			table.insert(sortedList, { internalName = name, data = item })
		end
	end

	-- 3. Sort the list automatically
	table.sort(sortedList, function(a, b)
		-- Convert Day to a number. Treat "N/A" as 999 to put it at the bottom.
		local dayA = tonumber(a.data.Day) or 999
		local dayB = tonumber(b.data.Day) or 999
		
		if dayA ~= dayB then
			return dayA < dayB
		end
		-- Fallback: If days are equal, sort alphabetically by DisplayName
		return (a.data.DisplayName or a.internalName) < (b.data.DisplayName or b.internalName)
	end)

	-- 4. Build the final output string from the sorted list
	local out = ""
	for _, entry in ipairs(sortedList) do
		-- Create a frame to pass to your p.get function
		local getFrame = {args = {[1] = entry.internalName, [2] = TableType}}
		local row = p.get(getFrame)
		if row and row ~= "" then
			out = out .. "|-\n| " .. row .. "\n"
		end
	end
	
	return out
end

return p