require 'openai'
require 'json'

# OpenAI.configure do |config|
#   config.api_key = "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"
# end

# client = OpenAI::Client.new

messages = [{
  role: "system", content: "You are a helpful asistant" # here we can change the asistant to another thing, so ChatGpt will answer like he was in this case asistant
}]

client = OpenAI::Client.new(access_token: "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")
message1 = %Q[Take this example of a hash, representing a character in dnd 5e. Generate a new one in the same format, with only these predefined: (If nothing is mentioned, generate a random character)
  {
    "Basic Information": {
      "Character Name": "Erevan Moonshadow",
      "Race": "Elf",
      "Class": "Rogue",
      "Background": "Criminal",
      "Alignment": "Chaotic Neutral",
      "Experience Points (XP)": 0,a
      "Speed": 30,
      "Initiative": 2,
    },
    "Ability Scores": {
      "Strength (STR)": 10,
      "Dexterity (DEX)": 18,
      "Constitution (CON)": 14,
      "Intelligence (INT)": 12,
      "Wisdom (WIS)": 10,
       "Charisma (CHA)": 14
    },
    "Proficiencies and Skills": {
      "Proficiency Bonus": "+2",
      "Skills": {
        "Acrobatics": {
          "proficient": true,
          "ability score bonus": 4,
          "bonus other": 0
        }
        Fill the rest of the skills in the same format as it is in Acrobatics
      },
      "Saving Throws": {
        "Dexterity": "+6",
        "Intelligence": "+1"
      }
    }
  }]

question = { role: "user", content: message1 }

messages << question

response1 = client.chat(
  parameters: {
    model: "gpt-3.5-turbo", # Required.
    messages: messages, # Required.
    temperature: 0.7
  }
)

puts response1.dig("choices", 0, "message", "content")
answer = { role: "assistant", content: response1.dig("choices", 0, "message", "content") }

messages << answer

responsehash = JSON.parse(response1.dig("choices", 0, "message", "content"))
# puts responsehash
puts messages

message2 = %Q[For the character that you just created, prvide me extra information on the following format:
  {
    "Features and Traits": {
      "Darkvision": "You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light.",
      "Fey Ancestry": "You have advantage on saving throws against being charmed, and magic can't put you to sleep.",
      "Criminal Contact": "You have a reliable and trustworthy contact who acts as your liaison to a network of other criminals.",
      "Sneak Attack": "Once per turn, you can deal an extra 1d6 damage to one creature you hit with an attack if you have advantage on the attack roll. The attack must use a finesse or a ranged weapon.",
      "Thieves' Cant": "You know the secret language of thieves."
      },
      "Proficiencies and Languages": {
        "Armor": "Light armor",
        "Weapons": "Simple weapons, hand crossbows, longswords, rapiers, shortswords",
        "Tools": "Thieves' tools",
        "Languages": ["Common", "Elvish"]
      },
      "Spells": [
          Fill with the names of the spells inside this array if your character knows or has access to, if applicable.
        ],
      "Background Information": {
        "Backstory": "Erevan was born into a family of thieves and grew up learning how to survive on the streets. He quickly developed a talent for stealing and became a skilled pickpocket and burglar. Erevan eventually joined a gang of thieves and worked his way up the ranks, earning the respect and trust of his fellow criminals. However, he eventually grew restless and decided to strike out on his own, using his skills to make a name for himself as a freelance thief and adventurer.",
        "Personality Traits": "I always have a plan for what to do when things go wrong. I am always calm, no matter what the situation. ",
        "Ideals": "Freedom. Chains are meant to be broken, as are those who would forge them. (Chaotic)",
        "Bonds": "I owe everything to my mentor—a horrible person who’s probably rotting in jail somewhere.",
        "Flaws": "When I see something valuable, I can’t think about anything but how to steal it."
      }
  }]

question = { role: "user", content: message2 }

messages << question

response2 = client.chat(
  parameters: {
    model: "gpt-3.5-turbo", # Required.
    messages: messages, # Required.
    temperature: 0.7
  }
)

answer = { role: "assistant", content: response2.dig("choices", 0, "message", "content") }

messages << answer

# responsehash2 = JSON.parse(response2.dig("choices", 0, "message", "content"))
# puts responsehash2
puts messages

message3 = %Q[For the character that you just created, prvide me extra information on the following format:
  {
    "Total Hit Points": 32,
    "Armor Class": 15,
    "Attacks and Spellcasting": {
        "Rapier": {
          "attack_modifier": "+6",
          "damage": "1d8+4",
          "damage_type": "piercing damage"
        },
        "Shortbow": {
          "attack_modifier": "+6",
          "damage": "1d6+4",
          "damage_type": "piercing damage"
        }
    },
    "Equipment": {
        "Rapier": 1,
        "Shortbow": 1,
        "Arrow": 20,
        "Leather Armor": 1,
        "Thieves' Tools": 1,
        "Crowbar": 1,
        "Rope, hempen (50 feet)": 1,
        "Backpack with 10 days of Rations",
        "Bedroll": 1,
        "Water Skin": 1,
        "Gold Pieces": 10
    },
    "Appearance": {
      "Age": 23,
      "Height": "186cm",
      "Weight": "90kg",
      "Eyes": "Piercing Green",
      "Skin": "Smooth and pale ivory",
      "Hair": "Long, flowing silver"
      "Description": "Erevan Moonshadow is a lean elf with silver hair, green eyes, and a roguish demeanor. He wears dark, form-fitting leather armor, carries sleek weapons, and moves with a graceful fluidity. He exudes confidence and control."
    }
  }]

question = { role: "user", content: message3 }

messages << question

response3 = client.chat(
  parameters: {
    model: "gpt-3.5-turbo", # Required.
    messages: messages, # Required.
    temperature: 0.7
  }
)

answer = { role: "assistant", content: response3.dig("choices", 0, "message", "content") }

messages << answer

# responsehash3 = JSON.parse(response3.dig("choices", 0, "message", "content"))
# puts responsehash3

puts messages


# HASH INSIDE A HASH
  # client = OpenAI::Client.new(access_token: "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")
  # message1 = %Q[Take this example of a hash, representing a character in dnd 5e. Generate a new one in the same format, with only these predefined: (If nothing is mentioned, generate a random character)
  #   {
  #     "Basic Information": {
  #       "Character Name": "Erevan Moonshadow",
  #       "Race": "Elf",
  #       "Class": "Rogue",
  #       "Background": "Criminal",
  #       "Alignment": "Chaotic Neutral",
  #       "Experience Points (XP)": "0"
  #     },
  #     "Ability Scores": {
  #       "Strength (STR)": "10",
  #       "Dexterity (DEX)": "18",
  #       "Constitution (CON)": "14",
  #       "Intelligence (INT)": "12",
  #       "Wisdom (WIS)": "10",
  #       "Charisma (CHA)": "14"
  #     },
  #     "Proficiencies and Skills": {
  #       "Proficiency Bonus": "+2",
  #       "Skills": {
  #         "Acrobatics": "+6",
  #         "Deception": "+4",
  #         "Insight": "+2",
  #         "Intimidation": "+4",
  #         "Investigation": "+3",
  #         "Perception": "+2",
  #         "Performance": "+4",
  #         "Persuasion": "+4",
  #         "Sleight of Hand": "+6",
  #         "Stealth": "+6"
  #       },
  #       "Saving Throws": {
  #         "Dexterity": "+6",
  #         "Intelligence": "+1"
  #       }
  #     }
  #   }]

  # response1 = client.chat(
  #   parameters: {
  #     model: "gpt-3.5-turbo", # Required.
  #     messages: [{ role: "user", content: message1}], # Required.
  #     temperature: 0.7
  #   }
  # )

  # # puts response1.dig("choices", 0, "message", "content")
  # # puts response1.dig("choices", 0, "message", "content").class

  # responsehash = JSON.parse(response1.dig("choices", 0, "message", "content"))

  # puts responsehash

  # message2 = %Q[Take this part, just as information,#{responsehash} representing a character in dnd 5e., and use the follow hash as an example to modify for the right values from the hash i provided here:
  #   {
  #     "Features and Traits": {
  #       "Darkvision": "You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light.",
  #       "Fey Ancestry": "You have advantage on saving throws against being charmed, and magic can't put you to sleep.",
  #       "Criminal Contact": "You have a reliable and trustworthy contact who acts as your liaison to a network of other criminals.",
  #       "Sneak Attack": "Once per turn, you can deal an extra 1d6 damage to one creature you hit with an attack if you have advantage on the attack roll. The attack must use a finesse or a ranged weapon.",
  #       "Thieves' Cant": "You know the secret language of thieves."
  #       },
  #       "Proficiencies and Languages": {
  #         "Armor": "Light armor",
  #         "Weapons": "Simple weapons, hand crossbows, longswords, rapiers, shortswords",
  #         "Tools": "Thieves' tools",
  #         "Languages": "Common, Elvish, Thieves' Cant"
  #       },
  #       "Spells": {
  #           Record the spells your character knows or has access to, if applicable.
  #       },
  #       "Background Information": {
  #         "Backstory": "Erevan was born into a family of thieves and grew up learning how to survive on the streets. He quickly developed a talent for stealing and became a skilled pickpocket and burglar. Erevan eventually joined a gang of thieves and worked his way up the ranks, earning the respect and trust of his fellow criminals. However, he eventually grew restless and decided to strike out on his own, using his skills to make a name for himself as a freelance thief and adventurer.",
  #         "Personality Traits": "I always have a plan for what to do when things go wrong. I am always calm, no matter what the situation. ",
  #         "Ideals": "Freedom. Chains are meant to be broken, as are those who would forge them. (Chaotic)",
  #         "Bonds": "I owe everything to my mentor—a horrible person who's probably rotting in jail somewhere.",
  #         "Flaws": "When I see something valuable, I can't think about anything but how to steal it."
  #       }
  #   }]

  # response2 = client.chat(
  #   parameters: {
  #     model: "gpt-3.5-turbo", # Required.
  #     messages: [{ role: "user", content: message2}], # Required.
  #     temperature: 0.7
  #   }
  # )


  # puts response2.dig("choices", 0, "message", "content")
  # puts response2.dig("choices", 0, "message", "content").class

  # responsehash2 = JSON.parse(response2.dig("choices", 0, "message", "content"))

  # puts responsehash2

  # responsetotal = responsehash.merge(responsehash2)
  # # puts responsetotal

  # puts responsetotal.dig("choices", 0, "message", "content")
  # puts responsetotal.dig("choices", 0, "message", "content").class

  # message3 = %Q[Take this part, just as information,#{responsetotal} representing a character in dnd 5e., and use the follow hash as an example to modify for the right values from the hash i provided here:
  #   {
  #     "Hit Points": {
  #         "Maximum Hit Points": "32",
  #         "Current Hit Points": "32",
  #         "Temporary Hit Points": ""
  #     },
  #     "Armor Class": "15",
  #     "Attacks and Spellcasting": {
  #         "Rapier": "+6 to hit, 1d8+4 piercing damage",
  #         "Shortbow": "+6 to hit, 1d6+4 piercing damage"
  #     },
  #     "Equipment": [
  #         "Rapier",
  #         "Shortbow with 20 arrows",
  #         "Leather Armor",
  #         "Thieves' Tools",
  #         "Crowbar",
  #         "50 feet of Hempen Rope",
  #         "Backpack with 10 days of Rations",
  #         "Bedroll",
  #         "Water Skin",
  #         "10 gold pieces"
  #       ]
  #   }]

  # response3 = client.chat(
  #   parameters: {
  #     model: "gpt-3.5-turbo", # Required.
  #     messages: [{ role: "user", content: message3}], # Required.
  #     temperature: 0.7
  #   }
  # )

  # # puts response3.dig("choices", 0, "message", "content")
  # # puts response3.dig("choices", 0, "message", "content").class

  # responsehash3 = JSON.parse(response3.dig("choices", 0, "message", "content"))

  # puts responsehash3
