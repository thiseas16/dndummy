# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# require 'httparty'
# require 'json'

# base_url = "https://www.dnd5eapi.co"

# Attack.delete_all
# Character.all.each do |c|
#   unless c.encounter == nil
#     c.delete
#   end
# end
# Encounter.delete_all
# ClassListItemGrantedJoin.delete_all
# ClassListProficiencyGrantedJoin.delete_all
# ItemChoiceJoin.delete_all
# ProficiencyChoiceJoin.delete_all
# ProficiencyChoice.delete_all
# ItemChoice.delete_all
# SpellClassListJoin.delete_all
# FeatClassListJoin.delete_all
# LevelFeatJoin.delete_all
# TraitProficiencyChoiceJoin.delete_all
# TraitProficiencyGrantedJoin.delete_all
# RaceTraitJoin.delete_all
# RaceLanguageJoin.delete_all
# RaceProficiencyChoiceJoin.delete_all
# RaceProficiencyGrantedJoin.delete_all
# SavingThrow.delete_all # required for class_list deletion
# Spell.delete_all
# Proficiency.delete_all
# Item.delete_all
# Level.delete_all # required for class_list deletion
# Feat.delete_all
# ClassList.delete_all
# Trait.delete_all
# AbilityBonuse.delete_all
# Race.delete_all

# #PROFICIENCIES
# response = JSON.parse(HTTParty.get(base_url + "/api/proficiencies").body)
# proficiencies = response["results"]
# proficiencies.each do |proficiency|
#   url = proficiency["url"]
#   details = JSON.parse(HTTParty.get(base_url + url).body)
#   name = details["name"]
#   type = details["type"]
#   prof = Proficiency.create(name: name, prof_type: type)
#   puts "Added #{prof.name} proficiency."
# end
# puts "\nFinished with proficiencies. Total: #{Proficiency.count}\n"

# #ITEMS / EQUIPMENT
# response = JSON.parse(HTTParty.get(base_url + "/api/equipment").body)
# equipment = response["results"]
# equipment.each do |item|
#   url = item["url"]
#   details = JSON.parse(HTTParty.get(base_url + url).body)
#   name = details["name"]

#   description = ""
#   details["desc"].each do |desc| #filling description from desc array
#     description = description + desc
#   end

#   weight = details["weight"]
#   i = Item.create(name: name, description: description, weight: weight)
#   puts "Added #{i.name} item."
# end
# puts "\nFinished with items. Total: #{Item.count}\n"

# #CLASS
# response = JSON.parse(HTTParty.get(base_url + "/api/classes").body)
# class_lists = response["results"]
# class_lists.each do |class_list|
#   url = class_list["url"]
#   details = JSON.parse(HTTParty.get(base_url + url).body)
#   name = details["name"]
#   hit_die = details["hit_die"]

#   class_instance = ClassList.create(name: name, hit_die: hit_die)
#   puts "Added #{class_instance.name} class."

#   details["saving_throws"].each do |st| #creating saving throws for the calss
#     st_name = st["name"]
#     st = SavingThrow.create(name: st_name, class_list: class_instance)
#   end

#   details["proficiencies"].each do |proficiency| # binding each STARTING proficiency to the class through join table
#     name = proficiency["name"]
#     prof = Proficiency.find_by(name: name)
#     ClassListProficiencyGrantedJoin.create(class_list: class_instance, proficiency: prof )
#   end

#   details["proficiency_choices"].each do |choice|
#     choice_instance = ProficiencyChoice.create(no_of_choices: choice["choose"], class_list: class_instance)
#     choice["from"]["options"].each do |proficiency| # binding each proficiency OF CHOICE to the class through join table
#       # puts "\n\n"
#       # puts proficiency
#       if proficiency["item"]
#         name = proficiency["item"]["name"]
#         prof = Proficiency.find_by(name: name)
#       else
#         proficiency["choice"]["from"]["options"].each do |option|
#           name = option["item"]["name"]
#           prof = Proficiency.find_by(name: name)
#         end
#       end
#       ProficiencyChoiceJoin.create(proficiency: prof, proficiency_choice: choice_instance )
#     end
#   end

#   details["starting_equipment_options"].each do |equipment| # binding equipment OF CHOICE to classthrough join table
#     choice_instance = ItemChoice.create(no_of_choices: equipment["choose"], class_list: class_instance )

#     if equipment["from"]["options"] ###NEEDS TO BE FIXED
#       equipment["from"]["options"].each do |i|
#         if i["of"] ###NEEDS TO BE FIXED
#           item = Item.find_by(name: i["of"]["name"])
#           ItemChoiceJoin.create(item_choice: choice_instance, item: item)
#         end
#       end
#     end

#   end

#   details["starting_equipment"].each do |equipment| # binding STARTING equipment to classthrough join table
#     item_name = equipment["equipment"]["name"]
#     item = Item.find_by(name: item_name)
#     ClassListItemGrantedJoin.create(class_list: class_instance, item: item)
#   end
# end
# puts "\nFinished with classes. Total: #{ClassList.count}\n"



# #POPULATING THE CLASSES HEADERS

# # BARBARIAN
# barb = ClassList.find_by(name: 'Barbarian')
# h1_title = "Barbarian"
# h1 =
# "A tall human tribesman strides through a blizzard, draped in fur and hefting his axe. He laughs as he charges
# toward the frost giant who dared poach his people’s elk herd.\n\n
# A half-orc snarls at the latest challenger to her authority over their savage tribe, ready to break his neck with her
# bare hands as she did to the last six rivals.\n\n
# Frothing at the mouth, a dwarf slams his helmet into the face of his drow foe, then turns to drive his armored elbow
# into the gut of another.\n\n
# These barbarians, different as they might be, are defined by their rage: unbridled, unquenchable, and unthinking fury.
# More than a mere emotion, their anger is the ferocity of a cornered predator, the unrelenting assault of a storm, the
# churning turmoil of the sea.\n\n
# For some, their rage springs from a communion with fierce animal spirits. Others draw from a roiling reservoir of anger
# at a world full of pain. For every barbarian, rage is a power that fuels not just a battle frenzy but also uncanny refle
# xes, resilience, and feats of strength."
# h2_title = "Primal Instinct"
# h2 =
# "People of towns and cities take pride in how their civilized ways set them apart from animals, as if denying one’s
# own nature was a mark of superiority. To a barbarian, though, civilization is no virtue, but a sign of weakness.
# The strong embrace their animal nature—keen instincts, primal physicality, and ferocious rage.
# Barbarians are uncomfortable when hedged in by walls and crowds. They thrive in the wilds of their homelands: the
# tundra, jungle, or grasslands where their tribes live and hunt.\n\n
# Barbarians come alive in the chaos of combat. They can enter a berserk state where rage takes over, giving them
# superhuman strength and resilience. A barbarian can draw on this reservoir of fury only a few times without resting,
# but those few rages are usually sufficient to defeat whatever threats arise."
# h3_title = "Primal Instinct"
# h3 = "Not every member of the tribes deemed “barbarians” by scions of civilized society has the barbarian class.
# A true barbarian among these people is as uncommon as a skilled fighter in a town, and he or she plays a similar role
# as a protector of the people and a leader in times of war. Life in the wild places of the world is fraught with peril:
# rival tribes, deadly weather, and terrifying monsters. Barbarians charge headlong into that danger so that their people
# don’t have to.\n\n
# Their courage in the face of danger makes barbarians perfectly suited for adventuring. Wandering is often a way of life
# for their native tribes, and the rootless life of the adventurer is little hardship for a barbarian. Some barbarians
#   miss the close-knit family structures of the tribe, but eventually find them replaced by the bonds formed among the
#     members of their adventuring parties."
# h4_title = "Creating a Barbarian"
# h4 = "When creating a barbarian character, think about where your character comes from and his or her place in the world.
#  Talk with your DM about an appropriate origin for your barbarian. Did you come from a distant land, making you a
#  stranger in the area of the campaign? Or is the campaign set in a rough-and-tumble frontier where barbarians are common?
# \n\n
# What led you to take up the adventuring life? Were you lured to settled lands by the promise of riches? Did you join
# forces with soldiers of those lands to face a shared threat? Did monsters or an invading horde drive you out of your
#  homeland, making you a rootless refugee? Perhaps you were a prisoner of war, brought in chains to “civilized” lands
#   and only now able to win your freedom. Or you might have been cast out from your people because of a crime you
#    committed, a taboo you violated, or a coup that removed you from a position of authority."
# barb.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)
# # BARD
# bard = ClassList.find_by(name: 'Bard')
# h1_title = "Bard"
# h1 = "Humming as she traces her fingers over an ancient monument in a long-forgotten ruin, a half-elf in rugged leathers
#   finds knowledge springing into her mind, conjured forth by the magic of her song—knowledge of the people who
#   constructed the monument and the mythic saga it depicts.
#   \n
#   A stern human warrior bangs his sword rhythmically against his scale mail, setting the tempo for his war chant and
#     exhorting his companions to bravery and heroism. The magic of his song fortifies and emboldens them.
#   \n
#   Laughing as she tunes her cittern, a gnome weaves her subtle magic over the assembled nobles, ensuring that her
#   companions’ words will be well received.
#   \n
#   Whether scholar, skald, or scoundrel, a bard weaves magic through words and music to inspire allies, demoralize foes,
#   manipulate minds, create illusions, and even heal wounds."

# h2_title = "Music and Magic"
# h2 = "In the worlds of D&D, words and music are not just vibrations of air, but vocalizations with power all their own.
#  The bard is a master of song, speech, and the magic they contain. Bards say that the multiverse was spoken into existence,
#   that the words of the gods gave it shape, and that echoes of these primordial Words of Creation still resound throughout
#    the cosmos. The music of bards is an attempt to snatch and harness those echoes, subtly woven into their spells and
#     powers.\n\n
# The greatest strength of bards is their sheer versatility. Many bards prefer to stick to the sidelines in combat, using
#  their magic to inspire their allies and hinder their foes from a distance. But bards are capable of defending themselves
#   in melee if necessary, using their magic to bolster their swords and armor. Their spells lean toward charms and illusions
#    rather than blatantly destructive spells. They have a wide-ranging knowledge of many subjects and a natural aptitude that
#     lets them do almost anything well. Bards become masters of the talents they set their minds to perfecting, from musical
#        performance to esoteric knowledge."
# h3_title = "Learning from Experience"
# h3 = "In the worlds of D&D, words and music are not just vibrations of air, but vocalizations with power all their
#  own. The bard is a master of song, speech, and the magic they contain. Bards say that the multiverse was spoken into
#   existence, that the words of the gods gave it shape, and that echoes of these primordial Words of Creation still
#    resound throughout the cosmos. The music of bards is an attempt to snatch and harness those echoes, subtly woven into
#     their spells and powers.\n\n
# The greatest strength of bards is their sheer versatility. Many bards prefer to stick to the sidelines in combat, using
#  their magic to inspire their allies and hinder their foes from a distance. But bards are capable of defending themselves
#   in melee if necessary, using their magic to bolster their swords and armor. Their spells lean toward charms and
#    illusions rather than blatantly destructive spells. They have a wide-ranging knowledge of many subjects and a
#     natural aptitude that lets them do almost anything well. Bards become masters of the talents they set their
#        minds to perfecting, from musical performance to esoteric knowledge."
# h4_title = "Creating a Bard"
# h4 = "Bards thrive on stories, whether those stories are true or not. Your character’s background and motivations
#  are not as important as the stories that he or she tells about them. Perhaps you had a secure and mundane childhood.
#   There’s no good story to be told about that, so you might paint yourself as an orphan raised by a hag in a dismal swamp.
#    Or your childhood might be worthy of a story. Some bards acquire their magical music through extraordinary means,
#     including the inspiration of fey or other supernatural creatures.\n\n
# Did you serve an apprenticeship, studying under a master, following the more experienced bard until you were ready to
#  strike out on your own? Or did you attend a college where you studied bardic lore and practiced your musical magic?
#   Perhaps you were a young runaway or orphan, befriended by a wandering bard who became your mentor. Or you might have
#    been a spoiled noble child tutored by a master. Perhaps you stumbled into the clutches of a hag, making a bargain
#     for a musical gift in addition to your life and freedom, but at what cost?"
# bard.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)

# # CLERIC
# c = ClassList.find_by(name: 'Cleric')
# h1_title = "Cleric"
# h1 = "Arms and eyes upraised toward the sun and a prayer on his lips, an elf begins to glow with an inner light that spills out to heal his battle-worn companions.
# \n\n
# Chanting a song of glory, a dwarf swings his axe in wide swaths to cut through the ranks of orcs arrayed against him, shouting praise to the gods with every foe’s fall.
# \n\n
# Calling down a curse upon the forces of undeath, a human lifts her holy symbol as light pours from it to drive back the zombies crowding in on her companions.
# \n\n
# Clerics are intermediaries between the mortal world and the distant planes of the gods. As varied as the gods they serve, clerics strive to embody the handiwork of their deities. No ordinary priest, a cleric is imbued with divine magic."

# h2_title = "Healers and Warriors"
# h2 = "Divine magic, as the name suggests, is the power of the gods, flowing from them into the world. Clerics are conduits for that power, manifesting it as miraculous effects. The gods don’t grant this power to everyone who seeks it, but only to those chosen to fulfill a high calling.
# \n\n
# Harnessing divine magic doesn’t rely on study or training. A cleric might learn formulaic prayers and ancient rites, but the ability to cast cleric spells relies on devotion and an intuitive sense of a deity’s wishes.
# \n\n
# Clerics combine the helpful magic of healing and inspiring their allies with spells that harm and hinder foes. They can provoke awe and dread, lay curses of plague or poison, and even call down flames from heaven to consume their enemies. For those evildoers who will benefit most from a mace to the head, clerics depend on their combat training to let them wade into melee with the power of the gods on their side."
# h3_title = "Divine Agents"
# h3 = "Not every acolyte or officiant at a temple or shrine is a cleric. Some priests are called to a simple life of temple service, carrying out their gods’ will through prayer and sacrifice, not by magic and strength of arms. In some cities, priesthood amounts to a political office, viewed as a stepping stone to higher positions of authority and involving no communion with a god at all. True clerics are rare in most hierarchies.
# \n\n
# When a cleric takes up an adventuring life, it is usually because his or her god demands it. Pursuing the goals of the gods often involves braving dangers beyond the walls of civilization, smiting evil or seeking holy relics in ancient tombs. Many clerics are also expected to protect their deities’ worshipers, which can mean fighting rampaging orcs, negotiating peace between warring nations, or sealing a portal that would allow a demon prince to enter the world.
# \n\n
# Most adventuring clerics maintain some connection to established temples and orders of their faiths. A temple might ask for a cleric’s aid, or a high priest might be in a position to demand it."
# h4_title = "Creating a Cleric"
# h4 = "As you create a cleric, the most important question to consider is which deity to serve and what principles you want your character to embody. The Gods of the Multiverse section includes lists of many of the gods of the multiverse. Check with your DM to learn which deities are in your campaign.
# \n\n
# Once you’ve chosen a deity, consider your cleric’s relationship to that god. Did you enter this service willingly? Or did the god choose you, impelling you into service with no regard for your wishes? How do the temple priests of your faith regard you: as a champion or a troublemaker? What are your ultimate goals? Does your deity have a special task in mind for you? Or are you striving to prove yourself worthy of a great quest?"
# c.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)

# # DRUID
# c = ClassList.find_by(name: 'Druid')
# h1_title = "Druid"
# h1 = "Holding high a gnarled staff wreathed with holly, an elf summons the fury of the storm and calls down explosive bolts of lightning to smite the torch-carrying orcs who threaten her forest.
# \n
# Crouching out of sight on a high tree branch in the form of a leopard, a human peers out of the jungle at the strange construction of a temple of Evil Elemental Air, keeping a close eye on the cultists’ activities.
# \n\n
# Swinging a blade formed of pure fire, a half-elf charges into a mass of skeletal soldiers, sundering the unnatural magic that gives the foul creatures the mocking semblance of life.
# \n\n
# Whether calling on the elemental forces of nature or emulating the creatures of the animal world, druids are an embodiment of nature’s resilience, cunning, and fury. They claim no mastery over nature. Instead, they see themselves as extensions of nature’s indomitable will."

# h2_title = "Power of Nature"
# h2 = "Druids revere nature above all, gaining their spells and other magical powers either from the force of nature itself or from a nature deity. Many druids pursue a mystic spirituality of transcendent union with nature rather than devotion to a divine entity, while others serve gods of wild nature, animals, or elemental forces. The ancient druidic traditions are sometimes called the Old Faith, in contrast to the worship of gods in temples and shrines.
# \n\n
# Druid spells are oriented toward nature and animals—the power of tooth and claw, of sun and moon, of fire and storm. Druids also gain the ability to take on animal forms, and some druids make a particular study of this practice, even to the point where they prefer animal form to their natural form."
# h3_title = "Preserve the Balance"
# h3 = "For druids, nature exists in a precarious balance. The four elements that make up a world—air, earth, fire, and water—must remain in equilibrium. If one element were to gain power over the others, the world could be destroyed, drawn into one of the elemental planes and broken apart into its component elements. Thus, druids oppose cults of Elemental Evil and others who promote one element to the exclusion of others.
# \n\n
# Druids are also concerned with the delicate ecological balance that sustains plant and animal life, and the need for civilized folk to live in harmony with nature, not in opposition to it. Druids accept that which is cruel in nature, and they hate that which is unnatural, including aberrations (such as beholders and mind flayers) and undead (such as zombies and vampires). Druids sometimes lead raids against such creatures, especially when the monsters encroach on the druids’ territory.
# \n\n
# Druids are often found guarding sacred sites or watching over regions of unspoiled nature. But when a significant danger arises, threatening nature’s balance or the lands they protect, druids take on a more active role in combating the threat, as adventurers."
# h4_title = "Creating a Druid"
# h4 = "When making a druid, consider why your character has such a close bond with nature. Perhaps your character lives in a society where the Old Faith still thrives, or was raised by a druid after being abandoned in the depths of a forest. Perhaps your character had a dramatic encounter with the spirits of nature, coming face to face with a giant eagle or dire wolf and surviving the experience. Maybe your character was born during an epic storm or a volcanic eruption, which was interpreted as a sign that becoming a druid was part of your character’s destiny.
# \n\n
# Have you always been an adventurer as part of your druidic calling, or did you first spend time as a caretaker of a sacred grove or spring? Perhaps your homeland was befouled by evil, and you took up an adventuring life in hopes of finding a new home or purpose."
# c.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)


# # DRUID
# c = ClassList.find_by(name: 'Fighter')
# h1_title = "Fighter"
# h1 = "A human in clanging plate armor holds her shield before her as she runs toward the massed goblins. An elf behind her, clad in studded leather armor, peppers the goblins with arrows loosed from his exquisite bow. The half-orc nearby shouts orders, helping the two combatants coordinate their assault to the best advantage.
# \n\n
# A dwarf in chain mail interposes his shield between the ogre’s club and his companion, knocking the deadly blow aside. His companion, a half-elf in scale armor, swings two scimitars in a blinding whirl as she circles the ogre, looking for a blind spot in its defenses.
# \n\n
# A gladiator fights for sport in an arena, a master with his trident and net, skilled at toppling foes and moving them around for the crowd’s delight—and his own tactical advantage. His opponent’s sword flares with blue light an instant before she sends lightning flashing forth to smite him.
# \n\n
# All of these heroes are fighters, perhaps the most diverse class of characters in the worlds of Dungeons & Dragons. Questing knights, conquering overlords, royal champions, elite foot soldiers, hardened mercenaries, and bandit kings—as fighters, they all share an unparalleled mastery with weapons and armor, and a thorough knowledge of the skills of combat. And they are well acquainted with death, both meting it out and staring it defiantly in the face."

# h2_title = "Well-Rounded Specialists"
# h2 = "Fighters learn the basics of all combat styles. Every fighter can swing an axe, fence with a rapier, wield a longsword or a greatsword, use a bow, and even trap foes in a net with some degree of skill. Likewise, a fighter is adept with shields and every form of armor. Beyond that basic degree of familiarity, each fighter specializes in a certain style of combat. Some concentrate on archery, some on fighting with two weapons at once, and some on augmenting their martial skills with magic. This combination of broad general ability and extensive specialization makes fighters superior combatants on battlefields and in dungeons alike."
# h3_title = "Trained for Danger"
# h3 = "Not every member of the city watch, the village militia, or the queen’s army is a fighter. Most of these troops are relatively untrained soldiers with only the most basic combat knowledge. Veteran soldiers, military officers, trained bodyguards, dedicated knights, and similar figures are fighters.
# \n\n
# Some fighters feel drawn to use their training as adventurers. The dungeon delving, monster slaying, and other dangerous work common among adventurers is second nature for a fighter, not all that different from the life he or she left behind. There are greater risks, perhaps, but also much greater rewards—few fighters in the city watch have the opportunity to discover a magic flame tongue sword, for example."
# h4_title = "Creating a Fighter"
# h4 = "As you build your fighter, think about two related elements of your character’s background: Where did you get your combat training, and what set you apart from the mundane warriors around you? Were you particularly ruthless? Did you get extra help from a mentor, perhaps because of your exceptional dedication? What drove you to this training in the first place? A threat to your homeland, a thirst for revenge, or a need to prove yourself might all have been factors.
# \n\n
# You might have enjoyed formal training in a noble’s army or in a local militia. Perhaps you trained in a war academy, learning strategy, tactics, and military history. Or you might be self-taught—unpolished but well tested. Did you take up the sword as a way to escape the limits of life on a farm, or are you following a proud family tradition? Where did you acquire your weapons and armor? They might have been military issue or family heirlooms, or perhaps you scrimped and saved for years to buy them. Your armaments are now among your most important possessions—the only things that stand between you and death’s embrace."
# c.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)

# # MONK
# c = ClassList.find_by(name: 'Monk')
# h1_title = "Monk"
# h1 = "Her fists a blur as they deflect an incoming hail of arrows, a half-elf springs over a barricade and throws herself into the massed ranks of hobgoblins on the other side. She whirls among them, knocking their blows aside and sending them reeling, until at last she stands alone.
# \n\n
# Taking a deep breath, a human covered in tattoos settles into a battle stance. As the first charging orcs reach him, he exhales and a blast of fire roars from his mouth, engulfing his foes.
# \n\n
# Moving with the silence of the night, a black-clad halfling steps into a shadow beneath an arch and emerges from another inky shadow on a balcony a stone’s throw away. She slides her blade free of its cloth-wrapped scabbard and peers through the open window at the tyrant prince, so vulnerable in the grip of sleep.
# \n\n
# Whatever their discipline, monks are united in their ability to magically harness the energy that flows in their bodies. Whether channeled as a striking display of combat prowess or a subtler focus of defensive ability and speed, this energy infuses all that a monk does."

# h2_title = "The Magic of Ki"
# h2 = "Monks make careful study of a magical energy that most monastic traditions call ki. This energy is an element of the magic that suffuses the multiverse—specifically, the element that flows through living bodies. Monks harness this power within themselves to create magical effects and exceed their bodies’ physical capabilities, and some of their special attacks can hinder the flow of ki in their opponents. Using this energy, monks channel uncanny speed and strength into their unarmed strikes. As they gain experience, their martial training and their mastery of ki gives them more power over their bodies and the bodies of their foes."
# h3_title = "Training and Asceticism"
# h3 = "Small walled cloisters dot the landscapes of the worlds of D&D, tiny refuges from the flow of ordinary life, where time seems to stand still. The monks who live there seek personal perfection through contemplation and rigorous training. Many entered the monastery as children, sent to live there when their parents died, when food couldn’t be found to support them, or in return for some kindness that the monks had performed for their families.
# \n\n
# Some monks live entirely apart from the surrounding population, secluded from anything that might impede their spiritual progress. Others are sworn to isolation, emerging only to serve as spies or assassins at the command of their leader, a noble patron, or some other mortal or divine power.
# \n\n
# The majority of monks don’t shun their neighbors, making frequent visits to nearby towns or villages and exchanging their service for food and other goods. As versatile warriors, monks often end up protecting their neighbors from monsters or tyrants.
# \n\n
# For a monk, becoming an adventurer means leaving a structured, communal lifestyle to become a wanderer. This can be a harsh transition, and monks don’t undertake it lightly. Those who leave their cloisters take their work seriously, approaching their adventures as personal tests of their physical and spiritual growth. As a rule, monks care little for material wealth and are driven by a desire to accomplish a greater mission than merely slaying monsters and plundering their treasure."
# h4_title = "Creating a Monk"
# h4 = "As you make your monk character, think about your connection to the monastery where you learned your skills and spent your formative years. Were you an orphan or a child left on the monastery’s threshold? Did your parents promise you to the monastery in gratitude for a service performed by the monks? Did you enter this secluded life to hide from a crime you committed? Or did you choose the monastic life for yourself?
# \n\n
# Consider why you left. Did the head of your monastery choose you for a particularly important mission beyond the cloister? Perhaps you were cast out because of some violation of the community’s rules. Did you dread leaving, or were you happy to go? Is there something you hope to accomplish outside the monastery? Are you eager to return to your home?
# \n\n
# As a result of the structured life of a monastic community and the discipline required to harness ki, monks are almost always lawful in alignment."
# c.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)

# # PALADIN
# c = ClassList.find_by(name: 'Paladin')
# h1_title = "Paladin"
# h1 = "Clad in plate armor that gleams in the sunlight despite the dust and grime of long travel, a human lays down her sword and shield and places her hands on a mortally wounded man. Divine radiance shines from her hands, the man’s wounds knit closed, and his eyes open wide with amazement.
# \n\n
# A dwarf crouches behind an outcrop, his black cloak making him nearly invisible in the night, and watches an orc war band celebrating its recent victory. Silently, he stalks into their midst and whispers an oath, and two orcs are dead before they even realize he is there.
# \n\n
# Silver hair shining in a shaft of light that seems to illuminate only him, an elf laughs with exultation. His spear flashes like his eyes as he jabs again and again at a twisted giant, until at last his light overcomes its hideous darkness.
# \n\n
# Whatever their origin and their mission, paladins are united by their oaths to stand against the forces of evil. Whether sworn before a god’s altar and the witness of a priest, in a sacred glade before nature spirits and fey beings, or in a moment of desperation and grief with the dead as the only witness, a paladin’s oath is a powerful bond. It is a source of power that turns a devout warrior into a blessed champion."

# h2_title = "The Cause of Righteousness"
# h2 = "A paladin swears to uphold justice and righteousness, to stand with the good things of the world against the encroaching darkness, and to hunt the forces of evil wherever they lurk. Different paladins focus on various aspects of the cause of righteousness, but all are bound by the oaths that grant them power to do their sacred work. Although many paladins are devoted to gods of good, a paladin’s power comes as much from a commitment to justice itself as it does from a god.
# \n\n
# Paladins train for years to learn the skills of combat, mastering a variety of weapons and armor. Even so, their martial skills are secondary to the magical power they wield: power to heal the sick and injured, to smite the wicked and the undead, and to protect the innocent and those who join them in the fight for justice."
# h3_title = "Beyond the Mundane Life"
# h3 = "Almost by definition, the life of a paladin is an adventuring life. Unless a lasting injury has taken him or her away from adventuring for a time, every paladin lives on the front lines of the cosmic struggle against evil. Fighters are rare enough among the ranks of the militias and armies of the world, but even fewer people can claim the true calling of a paladin. When they do receive the call, these warriors turn from their former occupations and take up arms to fight evil. Sometimes their oaths lead them into the service of the crown as leaders of elite groups of knights, but even then their loyalty is first to the cause of righteousness, not to crown and country.
# \n\n
# Adventuring paladins take their work seriously. A delve into an ancient ruin or dusty crypt can be a quest driven by a higher purpose than the acquisition of treasure. Evil lurks in dungeons and primeval forests, and even the smallest victory against it can tilt the cosmic balance away from oblivion."
# h4_title = "Creating a Paladin"
# h4 = "The most important aspect of a paladin character is the nature of his or her holy quest. Although the class features related to your oath don’t appear until you reach 3rd level, plan ahead for that choice by reading the oath descriptions at the end of the class. Are you a devoted servant of good, loyal to the gods of justice and honor, a holy knight in shining armor venturing forth to smite evil? Are you a glorious champion of the light, cherishing everything beautiful that stands against the shadow, a knight whose oath descends from traditions older than many of the gods? Or are you an embittered loner sworn to take vengeance on those who have done great evil, sent as an angel of death by the gods or driven by your need for revenge? The Gods of the Multiverse section lists many deities worshiped by paladins throughout the multiverse, such as Torm, Tyr, Heironeous, Paladine, Kiri-Jolith, Dol Arrah, the Silver Flame, Bahamut, Athena, Re-Horakhty, and Heimdall.
# \n\n
# How did you experience your call to serve as a paladin? Did you hear a whisper from an unseen god or angel while you were at prayer? Did another paladin sense the potential within you and decide to train you as a squire? Or did some terrible event—the destruction of your home, perhaps—drive you to your quests? Perhaps you stumbled into a sacred grove or a hidden elven enclave and found yourself called to protect all such refuges of goodness and beauty. Or you might have known from your earliest memories that the paladin’s life was your calling, almost as if you had been sent into the world with that purpose stamped on your soul.
# \n\n
# As guardians against the forces of wickedness, paladins are rarely of any evil alignment. Most of them walk the paths of charity and justice. Consider how your alignment colors the way you pursue your holy quest and the manner in which you conduct yourself before gods and mortals. Your oath and alignment might be in harmony, or your oath might represent standards of behavior that you have not yet attained."
# c.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)

# # RANGER
# c = ClassList.find_by(name: 'Ranger')
# h1_title = "Ranger"
# h1 = "Rough and wild looking, a human stalks alone through the shadows of trees, hunting the orcs he knows are planning a raid on a nearby farm. Clutching a shortsword in each hand, he becomes a whirlwind of steel, cutting down one enemy after another.
# \n\n
# After tumbling away from a cone of freezing air, an elf finds her feet and draws back her bow to loose an arrow at the white dragon. Shrugging off the wave of fear that emanates from the dragon like the cold of its breath, she sends one arrow after another to find the gaps between the dragon’s thick scales.
# \n\n
# Holding his hand high, a half-elf whistles to the hawk that circles high above him, calling the bird back to his side. Whispering instructions in Elvish, he points to the owlbear he’s been tracking and sends the hawk to distract the creature while he readies his bow.
# \n\n
# Far from the bustle of cities and towns, past the hedges that shelter the most distant farms from the terrors of the wild, amid the dense-packed trees of trackless forests and across wide and empty plains, rangers keep their unending watch."

# h2_title = "Deadly Hunters"
# h2 = "Warriors of the wilderness, rangers specialize in hunting the monsters that threaten the edges of civilization—humanoid raiders, rampaging beasts and monstrosities, terrible giants, and deadly dragons. They learn to track their quarry as a predator does, moving stealthily through the wilds and hiding themselves in brush and rubble. Rangers focus their combat training on techniques that are particularly useful against their specific favored foes.
# \n\n
# Thanks to their familiarity with the wilds, rangers acquire the ability to cast spells that harness nature’s power, much as a druid does. Their spells, like their combat abilities, emphasize speed, stealth, and the hunt. A ranger’s talents and abilities are honed with deadly focus on the grim task of protecting the borderlands."
# h3_title = "Independent Adventurers"
# h3 = "Though a ranger might make a living as a hunter, a guide, or a tracker, a ranger’s true calling is to defend the outskirts of civilization from the ravages of monsters and humanoid hordes that press in from the wild. In some places, rangers gather in secretive orders or join forces with druidic circles. Many rangers, though, are independent almost to a fault, knowing that, when a dragon or a band of orcs attacks, a ranger might be the first—and possibly the last—line of defense.
# \n\n
# This fierce independence makes rangers well suited to adventuring, since they are accustomed to life far from the comforts of a dry bed and a hot bath. Faced with city-bred adventurers who grouse and whine about the hardships of the wild, rangers respond with some mixture of amusement, frustration, and compassion. But they quickly learn that other adventurers who can carry their own weight in a fight against civilization’s foes are worth any extra burden. Coddled city folk might not know how to feed themselves or find fresh water in the wild, but they make up for it in other ways."
# h4_title = "Creating a Ranger"
# h4 = "As you create your ranger character, consider the nature of the training that gave you your particular capabilities. Did you train with a single mentor, wandering the wilds together until you mastered the ranger’s ways? Did you leave your apprenticeship, or was your mentor slain—perhaps by the same kind of monster that became your favored enemy? Or perhaps you learned your skills as part of a band of rangers affiliated with a druidic circle, trained in mystic paths as well as wilderness lore. You might be self-taught, a recluse who learned combat skills, tracking, and even a magical connection to nature through the necessity of surviving in the wilds.
# \n\n
# What’s the source of your particular hatred of a certain kind of enemy? Did a monster kill someone you loved or destroy your home village? Or did you see too much of the destruction these monsters cause and commit yourself to reining in their depredations? Is your adventuring career a continuation of your work in protecting the borderlands, or a significant change? What made you join up with a band of adventurers? Do you find it challenging to teach new allies the ways of the wild, or do you welcome the relief from solitude that they offer?"
#   c.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)

# # ROGUE
# c = ClassList.find_by(name: 'Rogue')
# h1_title = "Rogue"
# h1 = "Signaling for her companions to wait, a halfling creeps forward through the dungeon hall. She presses an ear to the door, then pulls out a set of tools and picks the lock in the blink of an eye. Then she disappears into the shadows as her fighter friend moves forward to kick the door open.
# \n\n
# A human lurks in the shadows of an alley while his accomplice prepares for her part in the ambush. When their target — a notorious slaver — passes the alleyway, the accomplice cries out, the slaver comes to investigate, and the assassin’s blade cuts his throat before he can make a sound.
# \n\n
# Suppressing a giggle, a gnome waggles her fingers and magically lifts the key ring from the guard’s belt. In a moment, the keys are in her hand, the cell door is open, and she and her companions are free to make their escape.
# \n\n
# Rogues rely on skill, stealth, and their foes’ vulnerabilities to get the upper hand in any situation. They have a knack for finding the solution to just about any problem, demonstrating a resourcefulness and versatility that is the cornerstone of any successful adventuring party."

# h2_title = "Skill and Precision"
# h2 = "Rogues devote as much effort to mastering the use of a variety of skills as they do to perfecting their combat abilities, giving them a broad expertise that few other characters can match. Many rogues focus on stealth and deception, while others refine the skills that help them in a dungeon environment, such as climbing, finding and disarming traps, and opening locks.
# \n\n
# When it comes to combat, rogues prioritize cunning over brute strength. A rogue would rather make one precise strike, placing it exactly where the attack will hurt the target most, than wear an opponent down with a barrage of attacks. Rogues have an almost supernatural knack for avoiding danger, and a few learn magical tricks to supplement their other abilities."
# h3_title = "A Shady Living"
# h3 = "Every town and city has its share of rogues. Most of them live up to the worst stereotypes of the class, making a living as burglars, assassins, cutpurses, and con artists. Often, these scoundrels are organized into thieves’ guilds or crime families. Plenty of rogues operate independently, but even they sometimes recruit apprentices to help them in their scams and heists. A few rogues make an honest living as locksmiths, investigators, or exterminators, which can be a dangerous job in a world where dire rats—and wererats—haunt the sewers.
# \n\n
# As adventurers, rogues fall on both sides of the law. Some are hardened criminals who decide to seek their fortune in treasure hoards, while others take up a life of adventure to escape from the law. Some have learned and perfected their skills with the explicit purpose of infiltrating ancient ruins and hidden crypts in search of treasure."
# h4_title = "Creating a Rogue"
# h4 = "As you create your rogue character, consider the character’s relationship to the law. Do you have a criminal past—or present? Are you on the run from the law or from an angry thieves’ guild master? Or did you leave your guild in search of bigger risks and bigger rewards? Is it greed that drives you in your adventures, or some other desire or ideal?
# \n\n
# What was the trigger that led you away from your previous life? Did a great con or heist gone terribly wrong cause you to reevaluate your career? Maybe you were lucky and a successful robbery gave you the coin you needed to escape the squalor of your life. Did wanderlust finally call you away from your home? Perhaps you suddenly found yourself cut off from your family or your mentor, and you had to find a new means of support. Or maybe you made a new friend—another member of your adventuring party—who showed you new possibilities for earning a living and employing your particular talents."
# c.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)

# # SORCERER
# c = ClassList.find_by(name: 'Sorcerer')
# h1_title = "Sorcerer"
# h1 = "Golden eyes flashing, a human stretches out her hand and unleashes the dragonfire that burns in her veins. As an inferno rages around her foes, leathery wings spread from her back and she takes to the air.
# \n\n
# Long hair whipped by a conjured wind, a half-elf spreads his arms wide and throws his head back. Lifting him momentarily off the ground, a wave of magic surges up in him, through him, and out from him in a mighty blast of lightning.
# \n\n
# Crouching behind a stalagmite, a halfling points a finger at a charging troglodyte. A blast of fire springs from her finger to strike the creature. She ducks back behind the rock formation with a grin, unaware that her wild magic has turned her skin bright blue.
# \n\n
# Sorcerers carry a magical birthright conferred upon them by an exotic bloodline, some otherworldly influence, or exposure to unknown cosmic forces. One can’t study sorcery as one learns a language, any more than one can learn to live a legendary life. No one chooses sorcery; the power chooses the sorcerer."

# h2_title = "Raw Magic"
# h2 = "Magic is a part of every sorcerer, suffusing body, mind, and spirit with a latent power that waits to be tapped. Some sorcerers wield magic that springs from an ancient bloodline infused with the magic of dragons. Others carry a raw, uncontrolled magic within them, a chaotic storm that manifests in unexpected ways.
# \n\n
# The appearance of sorcerous powers is wildly unpredictable. Some draconic bloodlines produce exactly one sorcerer in every generation, but in other lines of descent every individual is a sorcerer. Most of the time, the talents of sorcery appear as apparent flukes. Some sorcerers can’t name the origin of their power, while others trace it to strange events in their own lives. The touch of a demon, the blessing of a dryad at a baby’s birth, or a taste of the water from a mysterious spring might spark the gift of sorcery. So too might the gift of a deity of magic, exposure to the elemental forces of the Inner Planes or the maddening chaos of Limbo, or a glimpse into the inner workings of reality.
# \n\n
# Sorcerers have no use for the spellbooks and ancient tomes of magic lore that wizards rely on, nor do they rely on a patron to grant their spells as warlocks do. By learning to harness and channel their own inborn magic, they can discover new and staggering ways to unleash that power."
# h3_title = "Unexplained Powers"
# h3 = "Sorcerers are rare in the world, and it’s unusual to find a sorcerer who is not involved in the adventuring life in some way. People with magical power seething in their veins soon discover that the power doesn’t like to stay quiet. A sorcerer’s magic wants to be wielded, and it has a tendency to spill out in unpredictable ways if it isn’t called on.
# \n\n
# Sorcerers often have obscure or quixotic motivations driving them to adventure. Some seek a greater understanding of the magical force that infuses them, or the answer to the mystery of its origin. Others hope to find a way to get rid of it, or to unleash its full potential. Whatever their goals, sorcerers are every bit as useful to an adventuring party as wizards, making up for a comparative lack of breadth in their magical knowledge with enormous flexibility in using the spells they know."
# h4_title = "Creating a Sorcerer"
# h4 = "The most important question to consider when creating your sorcerer is the origin of your power. As a starting character, you’ll choose an origin that ties to a draconic bloodline or the influence of wild magic, but the exact source of your power is up to you to decide. Is it a family curse, passed down to you from distant ancestors? Or did some extraordinary event leave you blessed with inherent magic but perhaps scarred as well?
# \n\n
# How do you feel about the magical power coursing through you? Do you embrace it, try to master it, or revel in its unpredictable nature? Is it a blessing or a curse? Did you seek it out, or did it find you? Did you have the option to refuse it, and do you wish you had? What do you intend to do with it? Perhaps you feel like you’ve been given this power for some lofty purpose. Or you might decide that the power gives you the right to do what you want, to take what you want from those who lack such power. Perhaps your power links you to a powerful individual in the world—the fey creature that blessed you at birth, the dragon who put a drop of its blood into your veins, the lich who created you as an experiment, or the deity who chose you to carry this power."
#   c.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)

# # WARLOCK
# c = ClassList.find_by(name: 'Warlock')
# h1_title = "Warlock"
# h1 = "With a pseudodragon curled on his shoulder, a young elf in golden robes smiles warmly, weaving a magical charm into his honeyed words and bending the palace sentinel to his will.
# \n\n
# As flames spring to life in her hands, a wizened human whispers the secret name of her demonic patron, infusing her spell with fiendish magic.
# \n\n
# Shifting his gaze between a battered tome and the odd alignment of the stars overhead, a wild-eyed tiefling chants the mystic ritual that will open a doorway to a distant world.
# \n\n
# Warlocks are seekers of the knowledge that lies hidden in the fabric of the multiverse. Through pacts made with mysterious beings of supernatural power, warlocks unlock magical effects both subtle and spectacular. Drawing on the ancient knowledge of beings such as fey nobles, demons, devils, hags, and alien entities of the Far Realm, warlocks piece together arcane secrets to bolster their own power."

# h2_title = "Sworn and Beholden"
# h2 = "A warlock is defined by a pact with an otherworldly being. Sometimes the relationship between warlock and patron is like that of a cleric and a deity, though the beings that serve as patrons for warlocks are not gods. A warlock might lead a cult dedicated to a demon prince, an archdevil, or an utterly alien entity—beings not typically served by clerics. More often, though, the arrangement is similar to that between a master and an apprentice. The warlock learns and grows in power, at the cost of occasional services performed on the patron’s behalf.
# \n\n
# The magic bestowed on a warlock ranges from minor but lasting alterations to the warlock’s being (such as the ability to see in darkness or to read any language) to access to powerful spells. Unlike bookish wizards, warlocks supplement their magic with some facility at hand-to-hand combat. They are comfortable in light armor and know how to use simple weapons."
# h3_title = "Delvers into Secrets"
# h3 = "Warlocks are driven by an insatiable need for knowledge and power, which compels them into their pacts and shapes their lives. This thirst drives warlocks into their pacts and shapes their later careers as well.
# \n\n
# Stories of warlocks binding themselves to fiends are widely known. But many warlocks serve patrons that are not fiendish. Sometimes a traveler in the wilds comes to a strangely beautiful tower, meets its fey lord or lady, and stumbles into a pact without being fully aware of it. And sometimes, while poring over tomes of forbidden lore, a brilliant but crazed student’s mind is opened to realities beyond the material world and to the alien beings that dwell in the outer void.
# \n\n
# Once a pact is made, a warlock’s thirst for knowledge and power can’t be slaked with mere study and research. No one makes a pact with such a mighty patron if he or she doesn’t intend to use the power thus gained. Rather, the vast majority of warlocks spend their days in active pursuit of their goals, which typically means some kind of adventuring. Furthermore, the demands of their patrons drive warlocks toward adventure."
# h4_title = "Creating a Warlock"
# h4 = "As you make your warlock character, spend some time thinking about your patron and the obligations that your pact imposes upon you. What led you to make the pact, and how did you make contact with your patron? Were you seduced into summoning a devil, or did you seek out the ritual that would allow you to make contact with an alien elder god? Did you search for your patron, or did your patron find and choose you? Do you chafe under the obligations of your pact or serve joyfully in anticipation of the rewards promised to you?
# \n\n
# Work with your DM to determine how big a part your pact will play in your character’s adventuring career. Your patron’s demands might drive you into adventures, or they might consist entirely of small favors you can do between adventures.
# \n\n
# What kind of relationship do you have with your patron? Is it friendly, antagonistic, uneasy, or romantic? How important does your patron consider you to be? What part do you play in your patron’s plans? Do you know other servants of your patron?
# \n\n
# How does your patron communicate with you? If you have a familiar, it might occasionally speak with your patron’s voice. Some warlocks find messages from their patrons etched on trees, mingled among tea leaves, or adrift in the clouds — messages that only the warlock can see. Other warlocks converse with their patrons in dreams or waking visions, or deal only with intermediaries."
# c.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)

# # WIZARD
# c = ClassList.find_by(name: 'Wizard')
# h1_title = "Wizard"
# h1 = "Clad in the silver robes that denote her station, an elf closes her eyes to shut out the distractions of the battlefield and begins her quiet chant. Fingers weaving in front of her, she completes her spell and launches a tiny bead of fire toward the enemy ranks, where it erupts into a conflagration that engulfs the soldiers.
# \n\n
# Checking and rechecking his work, a human scribes an intricate magic circle in chalk on the bare stone floor, then sprinkles powdered iron along every line and graceful curve. When the circle is complete, he drones a long incantation. A hole opens in space inside the circle, bringing a whiff of brimstone from the otherworldly plane beyond.
# \n\n
# Crouching on the floor in a dungeon intersection, a gnome tosses a handful of small bones inscribed with mystic symbols, muttering a few words of power over them. Closing his eyes to see the visions more clearly, he nods slowly, then opens his eyes and points down the passage to his left.
# \n\n
# Wizards are supreme magic-users, defined and united as a class by the spells they cast. Drawing on the subtle weave of magic that permeates the cosmos, wizards cast spells of explosive fire, arcing lightning, subtle deception, and brute-force mind control. Their magic conjures monsters from other planes of existence, glimpses the future, or turns slain foes into zombies. Their mightiest spells change one substance into another, call meteors down from the sky, or open portals to other worlds."

# h2_title = "Scholars of the Arcane"
# h2 = "Wild and enigmatic, varied in form and function, the power of magic draws students who seek to master its mysteries. Some aspire to become like the gods, shaping reality itself. Though the casting of a typical spell requires merely the utterance of a few strange words, fleeting gestures, and sometimes a pinch or clump of exotic materials, these surface components barely hint at the expertise attained after years of apprenticeship and countless hours of study.
# \n\n
# Wizards live and die by their spells. Everything else is secondary. They learn new spells as they experiment and grow in experience. They can also learn them from other wizards, from ancient tomes or inscriptions, and from ancient creatures (such as the fey) that are steeped in magic."
# h3_title = "The Lure of Knowledge"
# h3 = "Wizards’ lives are seldom mundane. The closest a wizard is likely to come to an ordinary life is working as a sage or lecturer in a library or university, teaching others the secrets of the multiverse. Other wizards sell their services as diviners, serve in military forces, or pursue lives of crime or domination.
# \n\n
# But the lure of knowledge and power calls even the most unadventurous wizards out of the safety of their libraries and laboratories and into crumbling ruins and lost cities. Most wizards believe that their counterparts in ancient civilizations knew secrets of magic that have been lost to the ages, and discovering those secrets could unlock the path to a power greater than any magic available in the present age."
# h4_title = "Creating a Wizard"
# h4 = "Creating a wizard character demands a backstory dominated by at least one extraordinary event. How did your character first come into contact with magic? How did you discover you had an aptitude for it? Do you have a natural talent, or did you simply study hard and practice incessantly? Did you encounter a magical creature or an ancient tome that taught you the basics of magic?
# \n\n
# What drew you forth from your life of study? Did your first taste of magical knowledge leave you hungry for more? Have you received word of a secret repository of knowledge not yet plundered by any other wizard? Perhaps you’re simply eager to put your newfound magical skills to the test in the face of danger."
# c.update(h1: h1, h2: h2, h3: h3, h4: h4, h1_title: h1_title, h2_title: h2_title, h3_title: h3_title, h4_title: h4_title)

# # ADDING THE DESCRIPTION FIELD FOR CLASS AND ATTACHING PHOTOS TO CLASSES
# cl = ClassList.find_by(name: "Barbarian")
# ClassList.find_by(name: "Barbarian").update(description: "A fierce warrior who relies on their strength and rage to overcome their foes.")
# file = URI.open("https://www.seekpng.com/png/full/141-1413984_barbarian-d-d-barbarian.png")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!
# cl = ClassList.find_by(name: "Bard")
# ClassList.find_by(name: "Bard").update(description: "A jack-of-all-trades who uses their charm, wit, and magic to support their allies and confound their enemies.")
# file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1678554309/development/bard_jfzncf.png")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!
# cl = ClassList.find_by(name: "Cleric")
# ClassList.find_by(name: "Cleric").update(description: "A holy warrior who channels divine power to heal and protect their allies or smite their enemies.")
# file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1678554326/development/cleric_cu0wtu.png")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!
# cl = ClassList.find_by(name: "Druid")
# ClassList.find_by(name: "Druid").update(description: "A shapeshifting nature mage who can call upon the power of the elements and animals to defend their allies and harm their enemies.")
# file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1678554247/development/druid_visy0g.png")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!
# cl = ClassList.find_by(name: "Fighter")
# ClassList.find_by(name: "Fighter").update(description: "A versatile warrior who can specialize in a variety of combat styles and weapons.")
# file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1678554227/development/fighter_cz4db3.png")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!
# cl = ClassList.find_by(name: "Monk")
# ClassList.find_by(name: "Monk").update(description: "A disciplined martial artist who uses their body and mind to overcome their opponents.")
# file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1678554596/development/paladin_xyfrq1.png")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!
# cl = ClassList.find_by(name: "Paladin")
# ClassList.find_by(name: "Paladin").update(description: "A holy knight who uses their faith and fighting prowess to defend the innocent and vanquish evil.")
# file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1678554596/development/paladin_xyfrq1.png")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!
# cl = ClassList.find_by(name: "Ranger")
# ClassList.find_by(name: "Ranger").update(description: "A skilled hunter and tracker who uses their knowledge of the wilderness and deadly marksmanship to protect their allies and take down their foes.")
# file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1678554202/development/ranger_oirgkj.png")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!
# cl = ClassList.find_by(name: "Rogue")
# ClassList.find_by(name: "Rogue").update(description: "A stealthy thief and assassin who excels at sneaking, picking locks, and dealing massive damage with their sneak attacks.")
# file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1678556120/development/rogue_xnpvkl.png")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!
# cl = ClassList.find_by(name: "Sorcerer")
# ClassList.find_by(name: "Sorcerer").update(description: "A spellcaster who has an innate magical talent and can unleash powerful spells using their raw magic.")
# file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1678554410/development/sorcerer_o6gbpj.png")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!
# cl = ClassList.find_by(name: "Warlock")
# ClassList.find_by(name: "Warlock").update(description: "A spellcaster who gains their magic from a powerful patron and can unleash unique and devastating spells.")
# file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1678554056/development/Warlock_zqaupo.webp")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!
# cl = ClassList.find_by(name: "Wizard")
# ClassList.find_by(name: "Wizard").update(description: "A highly educated and versatile spellcaster who can learn and cast a wide variety of spells from their spellbook.")
# file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1678554049/development/wizard_aiqbb2.png")
# cl.photo.attach(io: file, filename: "class", content_type: 'image/png')
# cl.save!

#   #SPELLS
# response = JSON.parse(HTTParty.get(base_url + "/api/spells").body)
# spells = response["results"]
# spells.each do |spell|
#   url = spell["url"]
#   details = JSON.parse(HTTParty.get(base_url + url).body)
#   name = details["name"]
#   description = details["desc"][0]
#   higher_level = details["higher_level"][0]
#   range = details["range"]
#   level = details["level"]
#   attack_type = details["attack_type"]
#   damage_type = details["damage"]["damage_type"]["name"] if (details["damage"] && details["damage"]["damage_type"])
#   school = details["school"]["name"]
#   verbal_component = true if details["components"].include?("V")
#   somatic_component = true if details["components"].include?("S")
#   material_component = true if details["components"].include?("M")
#   duration = details["duration"]
#   concentration = details["concentration"]
#   casting_time = details["casting_time"]
#   ritual = details["ritual"]
#   material = details["material"]
#   if details['area_of_effect']
#     area_of_effect = "#{details['area_of_effect']['size']} feat #{details['area_of_effect']['type']}"
#   end

#   if details["damage"] && details["damage"]["damage_at_slot_level"]
#     dmg_at_lvl_1 = details["damage"]["damage_at_slot_level"]["1"]
#     dmg_at_lvl_2 = details["damage"]["damage_at_slot_level"]["2"]
#     dmg_at_lvl_3 = details["damage"]["damage_at_slot_level"]["3"]
#     dmg_at_lvl_4 = details["damage"]["damage_at_slot_level"]["4"]
#     dmg_at_lvl_5 = details["damage"]["damage_at_slot_level"]["5"]
#     dmg_at_lvl_6 = details["damage"]["damage_at_slot_level"]["6"]
#     dmg_at_lvl_7 = details["damage"]["damage_at_slot_level"]["7"]
#     dmg_at_lvl_8 = details["damage"]["damage_at_slot_level"]["8"]
#     dmg_at_lvl_9 = details["damage"]["damage_at_slot_level"]["9"]
#   elsif details["damage"] && details["damage"]["damage_at_character_level"]
#     dmg_at_character_lvl_1 = details["damage"]["damage_at_character_level"]["1"]
#     dmg_at_character_lvl_5 = details["damage"]["damage_at_character_level"]["5"]
#     dmg_at_character_lvl_11 = details["damage"]["damage_at_character_level"]["11"]
#     dmg_at_character_lvl_17 = details["damage"]["damage_at_character_level"]["17"]
#   end
#   spell_instance = Spell.create(
#       name: name,
#       description: description,
#       higher_lvl: higher_level,
#       range: range,
#       lvl: level,
#       attack_type: attack_type,
#       dmg_type: damage_type,
#       school: school,
#       verbal_component: verbal_component,
#       somatic_component: somatic_component,
#       material_component: material_component,
#       duration: duration,
#       concentration: concentration,
#       casting_time: casting_time,
#       ritual: ritual,
#       dmg_at_lvl_1: dmg_at_lvl_1,
#       dmg_at_lvl_2: dmg_at_lvl_2,
#       dmg_at_lvl_3: dmg_at_lvl_3,
#       dmg_at_lvl_4: dmg_at_lvl_4,
#       dmg_at_lvl_5: dmg_at_lvl_5,
#       dmg_at_lvl_6: dmg_at_lvl_6,
#       dmg_at_lvl_7: dmg_at_lvl_7,
#       dmg_at_lvl_8: dmg_at_lvl_8,
#       dmg_at_lvl_9: dmg_at_lvl_9,
#       area_of_effect: area_of_effect,
#       material: material
#     )

#   puts "Added #{spell_instance.name} spell."

#   details["classes"].each do |cl| # finding each class and binding it through the join table
#     name = cl["name"]
#     class_instance = ClassList.find_by(name: name)
#     SpellClassListJoin.create(class_list: class_instance, spell: spell_instance)
#   end
# end
# puts "\nFinished with spells. Total: #{Spell.count}\n"

# #FEATURES
# response = JSON.parse(HTTParty.get(base_url + "/api/features").body)
# features = response["results"]

# features.each do |feature|
#   url = feature["url"]
#   details = JSON.parse(HTTParty.get(base_url + url).body)
#   name = details["name"]
#   class_name = details["class"]["name"]
#   description = details["desc"][0]
#   lvl = details["level"]
#   if details["parent"]
#     parent_name = details["parent"]["name"]
#   end

#   parent_feat = Feat.find_by(name: parent_name)
#   feat = Feat.create(name: name, description: description, lvl: lvl, parent_feat: parent_feat)

#   puts "Added #{feat.name} feat."

#   class_list = ClassList.find_by(name: class_name)
#   FeatClassListJoin.create(class_list: class_list, feat: feat)
# end
# puts "\nFinished with feat. Total: #{Feat.count}\n"

# # LEVELS FOR THE CLASS, TABLE INFO
# response = JSON.parse(HTTParty.get(base_url + "/api/classes").body)
# class_lists = response["results"]
# class_lists.each do |class_list|
#   url = class_list["url"]
#   details = JSON.parse(HTTParty.get(base_url + url).body)
#   url = details["class_levels"]
#   details = JSON.parse(HTTParty.get(base_url + url).body)
#   class_instance = ClassList.find_by(name: details[0]["class"]["name"])
#   details.each do |detail|
#     lvl = detail["level"]
#     ability_score_bonuses = detail["ability_score_bonuses"]
#     prof_bonus = detail["prof_bonus"]
#     class_specific = detail["class_specific"]
#     if detail["spellcasting"]
#       spellcasting = true
#       cantrips_known = detail["spellcasting"]["cantrips_known"]
#       spells_known = detail["spellcasting"]["spells_known"]
#       spell_slots_lvl_1 = detail["spellcasting"]["spell_slots_level_1"]
#       spell_slots_lvl_2 = detail["spellcasting"]["spell_slots_level_2"]
#       spell_slots_lvl_3 = detail["spellcasting"]["spell_slots_level_3"]
#       spell_slots_lvl_4 = detail["spellcasting"]["spell_slots_level_4"]
#       spell_slots_lvl_5 = detail["spellcasting"]["spell_slots_level_5"]
#       spell_slots_lvl_6 = detail["spellcasting"]["spell_slots_level_6"]
#       spell_slots_lvl_7 = detail["spellcasting"]["spell_slots_level_7"]
#       spell_slots_lvl_8 = detail["spellcasting"]["spell_slots_level_8"]
#       spell_slots_lvl_9 = detail["spellcasting"]["spell_slots_level_9"]
#     end
#     l = Level.create(
#       class_list: class_instance,
#       lvl: lvl,
#       ability_score_bonuses: ability_score_bonuses,
#       prof_bonus: prof_bonus,
#       spellcasting: spellcasting,
#       cantrips_known: cantrips_known,
#       spells_known: spells_known,
#       spell_slots_lvl_1: spell_slots_lvl_1,
#       spell_slots_lvl_2: spell_slots_lvl_2,
#       spell_slots_lvl_3: spell_slots_lvl_3,
#       spell_slots_lvl_4: spell_slots_lvl_4,
#       spell_slots_lvl_5: spell_slots_lvl_5,
#       spell_slots_lvl_6: spell_slots_lvl_6,
#       spell_slots_lvl_7: spell_slots_lvl_7,
#       spell_slots_lvl_8: spell_slots_lvl_8,
#       spell_slots_lvl_9: spell_slots_lvl_9,
#       class_specific: class_specific
#     )
#     detail["features"].each do |feat|
#       f = Feat.find_by(name: feat["name"])
#       LevelFeatJoin.create(feat: f, level: l)
#     end
#   end
# end

# #LANGUAGES

# response = JSON.parse(HTTParty.get(base_url + "/api/languages").body)
# languages = response["results"]

# languages.each do |language|
#   url = language["url"]
#   details = JSON.parse(HTTParty.get(base_url + url).body)
#   name = details["name"]
#   Language.create(name: name)
# end
# puts "\nFinished with languages. Total: #{Language.count}\n"

# #TRAITS
# response = JSON.parse(HTTParty.get(base_url + "/api/traits").body)
# traits = response["results"]

# traits.each do |trait|
#   url = trait["url"]
#   details = JSON.parse(HTTParty.get(base_url + url).body)
#   name = details["name"]
#   description = details["desc"]
#   proficiency_choice_number = details["proficiency_choices"]["choose"] if details["proficiency_choices"]
#   t = Trait.create(name: name, description: description, proficiency_choice_number: proficiency_choice_number)
#   puts "Added #{t.name} trait."

#   details["proficiencies"].each do |proficiency| # Populating the join table for the proficiencies automatically granted
#     Proficiency.find_by(name: proficiency["name"])
#     TraitProficiencyGrantedJoin.create(trait: t, proficiency: p)
#   end

#   if details["proficiency_choices"]
#     details["proficiency_choices"]["from"]["options"].each do |proficiency| # Populating the table with lists of choices for proficiencies
#       p = Proficiency.find_by(name: proficiency["name"])
#       TraitProficiencyChoiceJoin.create(trait: t, proficiency: p)
#     end
#   end
# end

# puts "\nFinished with traits. Total: #{Trait.count}\n"

# # RACES
# response = JSON.parse(HTTParty.get(base_url + "/api/races").body)
# races = response["results"]

# races.each do |race|
#   url = race["url"]
#   details = JSON.parse(HTTParty.get(base_url + url).body)
#   name = details["name"]
#   speed = details["speed"]
#   alignment = details["alignment"]
#   age = details["age"]
#   size = details["size"]
#   size_description = details["size_description"]
#   language_description = details["language_desc"]
#   proficiency_choice_number = details["starting_proficiency_options"]["choose"] if details["starting_proficiency_options"]

#   r = Race.create(
#     name: name,
#     speed: speed,
#     alignment: alignment,
#     age: age,
#     size: size,
#     size_description: size_description,
#     language_description: language_description,
#     proficiency_choice_number: proficiency_choice_number,
#   )
#   puts "Added #{r.name} race."

#   details["ability_bonuses"].each do |ab|
#     ab_name = ab["ability_score"]["name"]
#     ab_bonus = ab["bonus"]
#     AbilityBonuse.create(ability_name: ab_name, bonus: ab_bonus, race: r)
#   end

#   details["starting_proficiencies"].each do |prof|
#     prof_name = prof["name"]
#     p = Proficiency.find_by(name: prof_name)
#     RaceProficiencyGrantedJoin.create(proficiency: p, race: r)
#   end

#   if details["starting_proficiency_options"]
#     details["starting_proficiency_options"]["from"]["options"].each do |prof|
#     p = Proficiency.find_by(name: prof["item"]["name"])
#     RaceProficiencyChoiceJoin.create(proficiency: p, race: r)
#     end
#   end

#   details["languages"].each do |lang|
#     l = Language.find_by(name: lang["name"])
#     RaceLanguageJoin.create(language: l, race: r)
#   end

#   details["traits"].each do |trait|
#     t = Trait.find_by(name: trait["name"])
#     RaceTraitJoin.create(race: r, trait: t)
#   end
# end
# puts "\nFinished with races. Total: #{Race.count}\n"

monk = ClassList.find_by(name: 'Monk')
file = URI.open("https://res.cloudinary.com/dnorlz2hl/image/upload/v1680349512/production/monk-class_wreeca.png")
monk.photo.attach(io: file, filename: "class", content_type: 'image/png')
monk.save!
