# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'httparty'
require 'json'

base_url = "https://www.dnd5eapi.co"

ClassListItemJoin.delete_all
ClassListProficiencyJoin.delete_all
SpellClassListJoin.delete_all
FeatClassListJoin.delete_all
TraitProficiencyChoiceJoin.delete_all
TraitProficiencyGrantedJoin.delete_all
RaceTraitJoin.delete_all
RaceLanguageJoin.delete_all
RaceProficiencyChoiceJoin.delete_all
RaceProficiencyGrantedJoin.delete_all
SavingThrow.delete_all
Spell.delete_all
Proficiency.delete_all
Item.delete_all
Feat.delete_all
ClassList.delete_all
Trait.delete_all
AbilityBonuse.delete_all
Race.delete_all

#PROFICIENCIES
response = JSON.parse(HTTParty.get(base_url + "/api/proficiencies").body)
proficiencies = response["results"]
proficiencies.each do |proficiency|
  url = proficiency["url"]
  details = JSON.parse(HTTParty.get(base_url + url).body)
  name = details["name"]
  type = details["type"]
  prof = Proficiency.create(name: name, prof_type: type)
  puts "Added #{prof.name} proficiency."
end
puts "\nFinished with proficiencies. Total: #{Proficiency.count}\n"

#ITEMS / EQUIPMENT
response = JSON.parse(HTTParty.get(base_url + "/api/equipment").body)
equipment = response["results"]
equipment.each do |item|
  url = item["url"]
  details = JSON.parse(HTTParty.get(base_url + url).body)
  name = details["name"]

  description = ""
  details["desc"].each do |desc| #filling description from desc array
    description = description + desc
  end

  weight = details["weight"]
  i = Item.create(name: name, description: description, weight: weight)
  puts "Added #{i.name} item."
end
puts "\nFinished with items. Total: #{Item.count}\n"

#CLASS
response = JSON.parse(HTTParty.get(base_url + "/api/classes").body)
class_lists = response["results"]
class_lists.each do |class_list|
  url = class_list["url"]
  details = JSON.parse(HTTParty.get(base_url + url).body)
  name = details["name"]
  hit_die = details["hit_die"]

  class_instance = ClassList.create(name: name, hit_die: hit_die)
  puts "Added #{class_instance.name} class."

  details["saving_throws"].each do |st| #creating saving throws for the calss
    st_name = st["name"]
    st = SavingThrow.create(name: st_name, class_list: class_instance)
  end

  details["proficiencies"].each do |proficiency| # binding each proficiency to the class through join table
    name = proficiency["name"]
    prof = Proficiency.find_by(name: name)
    ClassListProficiencyJoin.create(class_list: class_instance, proficiency: prof )
  end

  details["starting_equipment"].each do |equipment| # binding equipment to classthrough join table
    item_name = equipment["equipment"]["name"]
    item = Item.find_by(name: item_name)
    ClassListItemJoin.create(class_list: class_instance, item: item)
  end
end
puts "\nFinished with classes. Total: #{ClassList.count}\n"

#SPELLS
response = JSON.parse(HTTParty.get(base_url + "/api/spells").body)
spells = response["results"]
spells.each do |spell|
  url = spell["url"]
  details = JSON.parse(HTTParty.get(base_url + url).body)
  name = details["name"]
  description = details["desc"]
  higher_level = details["higher_level"]
  range = details["range"]
  level = details["level"]
  attack_type = details["attack_type"]
  damage_type = details["damage"]["damage_type"]["name"] if (details["damage"] && details["damage"]["damage_type"])
  school = details["school"]["name"]
  verbal_component = true if details["components"].include?("V")
  somatic_component = true if details["components"].include?("S")
  material_component = true if details["components"].include?("M")
  duration = details["duration"]
  concentration = details["concentration"]
  casting_time = details["casting_time"]
  ritual = details["ritual"]

  if details["damage"] && details["damage"]["damage_at_slot_level"]
    dmg_at_lvl_1 = details["damage"]["damage_at_slot_level"]["1"]
    dmg_at_lvl_2 = details["damage"]["damage_at_slot_level"]["2"]
    dmg_at_lvl_3 = details["damage"]["damage_at_slot_level"]["3"]
    dmg_at_lvl_4 = details["damage"]["damage_at_slot_level"]["4"]
    dmg_at_lvl_5 = details["damage"]["damage_at_slot_level"]["5"]
    dmg_at_lvl_6 = details["damage"]["damage_at_slot_level"]["6"]
    dmg_at_lvl_7 = details["damage"]["damage_at_slot_level"]["7"]
    dmg_at_lvl_8 = details["damage"]["damage_at_slot_level"]["8"]
    dmg_at_lvl_9 = details["damage"]["damage_at_slot_level"]["9"]
  elsif details["damage"] && details["damage"]["damage_at_character_level"]
    dmg_at_character_lvl_1 = details["damage"]["damage_at_character_level"]["1"]
    dmg_at_character_lvl_5 = details["damage"]["damage_at_character_level"]["5"]
    dmg_at_character_lvl_11 = details["damage"]["damage_at_character_level"]["11"]
    dmg_at_character_lvl_17 = details["damage"]["damage_at_character_level"]["17"]
  end
  spell_instance = Spell.create(
      name: name,
      description: description,
      higher_lvl: higher_level,
      range: range,
      lvl: level,
      attack_type: attack_type,
      dmg_type: damage_type,
      school: school,
      verbal_component: verbal_component,
      somatic_component: somatic_component,
      material_component: material_component,
      duration: duration,
      concentration: concentration,
      casting_time: casting_time,
      ritual: ritual,
      dmg_at_lvl_1: dmg_at_lvl_1,
      dmg_at_lvl_2: dmg_at_lvl_2,
      dmg_at_lvl_3: dmg_at_lvl_3,
      dmg_at_lvl_4: dmg_at_lvl_4,
      dmg_at_lvl_5: dmg_at_lvl_5,
      dmg_at_lvl_6: dmg_at_lvl_6,
      dmg_at_lvl_7: dmg_at_lvl_7,
      dmg_at_lvl_8: dmg_at_lvl_8,
      dmg_at_lvl_9: dmg_at_lvl_9,
    )

  puts "Added #{spell_instance.name} spell."

  details["classes"].each do |cl| # finding each class and binding it through the join table
    name = cl["name"]
    class_instance = ClassList.find_by(name: name)
    SpellClassListJoin.create(class_list: class_instance, spell: spell_instance)
  end
end
puts "\nFinished with spells. Total: #{Spell.count}\n"

#FEATURES
response = JSON.parse(HTTParty.get(base_url + "/api/features").body)
features = response["results"]

features.each do |feature|
  url = feature["url"]
  details = JSON.parse(HTTParty.get(base_url + url).body)
  name = details["name"]
  class_name = details["class"]["name"]
  description = details["desc"]
  lvl = details["level"]
  if details["parent"]
    parent_name = details["parent"]["name"]
  end

  parent_feat = Feat.find_by(name: parent_name)
  feat = Feat.create(name: name, description: description, lvl: lvl, parent_feat: parent_feat)

  puts "Added #{feat.name} feat."

  class_list = ClassList.find_by(name: class_name)
  FeatClassListJoin.create(class_list: class_list, feat: feat)
end
puts "\nFinished with feat. Total: #{Feat.count}\n"

#LANGUAGES

response = JSON.parse(HTTParty.get(base_url + "/api/languages").body)
languages = response["results"]

languages.each do |language|
  url = language["url"]
  details = JSON.parse(HTTParty.get(base_url + url).body)
  name = details["name"]
  Language.create(name: name)
end
puts "\nFinished with languages. Total: #{Language.count}\n"

#TRAITS
response = JSON.parse(HTTParty.get(base_url + "/api/traits").body)
traits = response["results"]

traits.each do |trait|
  url = trait["url"]
  details = JSON.parse(HTTParty.get(base_url + url).body)
  name = details["name"]
  description = details["desc"]
  proficiency_choice_number = details["proficiency_choices"]["choose"] if details["proficiency_choices"]
  t = Trait.create(name: name, description: description, proficiency_choice_number: proficiency_choice_number)
  puts "Added #{t.name} trait."

  details["proficiencies"].each do |proficiency| # Populating the join table for the proficiencies automatically granted
    Proficiency.find_by(name: proficiency["name"])
    TraitProficiencyGrantedJoin.create(trait: t, proficiency: p)
  end

  if details["proficiency_choices"]
    details["proficiency_choices"]["from"]["options"].each do |proficiency| # Populating the table with lists of choices for proficiencies
      p = Proficiency.find_by(name: proficiency["name"])
      TraitProficiencyChoiceJoin.create(trait: t, proficiency: p)
    end
  end
end

puts "\nFinished with traits. Total: #{Trait.count}\n"

# RACES
response = JSON.parse(HTTParty.get(base_url + "/api/races").body)
races = response["results"]

races.each do |race|
  url = race["url"]
  details = JSON.parse(HTTParty.get(base_url + url).body)
  name = details["name"]
  speed = details["speed"]
  alignment = details["alignment"]
  age = details["age"]
  size = details["size"]
  size_description = details["size_description"]
  language_description = details["language_desc"]
  proficiency_choice_number = details["starting_proficiency_options"]["choose"] if details["starting_proficiency_options"]

  r = Race.create(
    name: name,
    speed: speed,
    alignment: alignment,
    age: age,
    size: size,
    size_description: size_description,
    language_description: language_description,
    proficiency_choice_number: proficiency_choice_number,
  )
  puts "Added #{r.name} race."

  details["ability_bonuses"].each do |ab|
    ab_name = ab["ability_score"]["name"]
    ab_bonus = ab["bonus"]
    AbilityBonuse.create(ability_name: ab_name, bonus: ab_bonus, race: r)
  end

  details["starting_proficiencies"].each do |prof|
    prof_name = prof["name"]
    p = Proficiency.find_by(name: prof_name)
    RaceProficiencyGrantedJoin.create(proficiency: p, race: r)
  end

  if details["starting_proficiency_options"]
    details["starting_proficiency_options"]["from"]["options"].each do |prof|
    p = Proficiency.find_by(name: prof["item"]["name"])
    RaceProficiencyChoiceJoin.create(proficiency: p, race: r)
    end
  end

  details["languages"].each do |lang|
    l = Language.find_by(name: lang["name"])
    RaceLanguageJoin.create(language: l, race: r)
  end

  details["traits"].each do |trait|
    t = Trait.find_by(name: trait["name"])
    RaceTraitJoin.create(race: r, trait: t)
  end
end
puts "\nFinished with races. Total: #{Race.count}\n"
