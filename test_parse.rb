require 'json'

test = %Q[      {
  "Name": "Rescue mission in Suzail's Prisons",
  "Description": "As the players delve deeper into the Suzail's prisons, they hear the echoes of heavy footsteps and rattling chains. Soon, they come across a group of prison guards escorting a group of dangerous criminals. Among the prisoners, they spot their comrade who was imprisoned for public nudity. The guards seem to be heavily armed and ready to fight.",
  "Tactics": "The guards will attempt to surround the players and use their shields to protect themselves while their crossbow-wielding comrades fire from a distance. Meanwhile, the prisoners will try to break free and attack the players using improvised weapons. The guards will prioritize targeting the player who seems to be the biggest threat, while the prisoners will go after the player who is closest to them.",
  "Enemies": {
    "Prison Guard":{
      "Prompt": "",
      "Amount": 4,
      "Total HP": 32,
      "Armor Class": 15,
      "Attacks and Spellcasting": {
        "Rapier": {
          "attack_modifier": "+6",
          "damage": "1d8+4",
          "damage_type": "piercing damage",
          "range": "0"
      },
        "Shortbow": {
          "attack_modifier": "+6",
          "damage": "1d6+4",
          "damage_type": "piercing damage",
          "range": "80/320"
        }
      },
      "Features and Traits": {
          "Darkvision": "You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light.",
          "Fey Ancestry": "You have advantage on saving throws against being charmed, and magic can't put you to sleep.",
          "Criminal Contact": "You have a reliable and trustworthy contact who acts as your liaison to a network of other criminals.",
          "Sneak Attack": "Once per turn, you can deal an extra 1d6 damage to one creature you hit with an attack if you have advantage on the attack roll. The attack must use a finesse or a ranged weapon.",
          "Thieves' Cant": "You know the secret language of thieves."
      },
      "Basic Information": {
        "Character Name": "Erevan Moonshadow",
        "Race": "Elf",
        "Class": "Rogue",
        "Background": "Criminal",
        "Alignment": "Chaotic Neutral",
        "Level": 3,
        "Speed": 30,
        "Initiative": 2,
        "Armor Class": 15
      },
      "Ability Scores": {
        "STR": 10,
        "DEX": 18,
        "CONST": 14,
        "INT": 12,
        "WIS": 10,
        "CHA": 14
      },
      "Spells": [],
      "Proficiencies and Skills": {
        "Proficiency Bonus": "+2",
        "Skills": {
          "Acrobatics": {
            "proficient": true,
            "ability score bonus": 4,
            "bonus other": 0
          }
        },
        "Saving Throws": {
          "Dexterity": "+6",
          "Intelligence": "+1"
        }
      }
    }
  }
}]

hash = JSON.parse(test)
puts hash
