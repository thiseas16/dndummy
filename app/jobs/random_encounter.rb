class RandomEncounter < ActiveJob::Base
  include Rails.application.routes.url_helpers
  def perform(era, theme, players, lvl, description, campaign, user_id)
    message = "Encounter is now being generated..."
    ActionCable.server.broadcast(
      user_id, { message: message, redirect: "#" }
    )
    @era = era
    @theme = theme
    @players = players
    @lvl = lvl
    @description = description
    @campaign = campaign

    api_call

    @encounter = Encounter.new(
      title: @responsehash["Name"],
      description: @responsehash["Description"],
      tactics: @responsehash["Tactics"]
    )
    @encounter.campaign = @campaign
    @encounter.save
    @responsehash["Enemies"].each do |enemy|
      i = 0
      enemy[1]["Amount"].times do
        i += 1
        @character = Character.new(
          name: "#{enemy[0]} #{i}",
          level: enemy[1]["Basic Information"]["Level"],
          alignment: enemy[1]["Basic Information"]["Alignment"],
          total_hp: enemy[1]["Total HP"],
          current_hp: enemy[1]["Total HP"],
          temp_hp: 0,
          speed: enemy[1]["Basic Information"]["Speed"],
          armor_class: enemy[1]["Armor Class"],
          inititiave: enemy[1]["Basic Information"]["Initiative"],
          dex: enemy[1]["Ability Scores"]["DEX"],
          str: enemy[1]["Ability Scores"]["STR"],
          const: enemy[1]["Ability Scores"]["CONST"],
          cha: enemy[1]["Ability Scores"]["CHA"],
          int: enemy[1]["Ability Scores"]["INT"],
          wis: enemy[1]["Ability Scores"]["WIS"],
          race: enemy[1]["Basic Information"]["Race"],
          class_list: enemy[1]["Basic Information"]["Class"]
        )
        @character.campaign = @campaign
        @character.encounter = @encounter
        @character.save
        # enemy[1]["Attacks and Spellcasting"].each do |attack|
        #   @attack = Attack.new(
        #     weapon: attack[0],
        #     attack_modifier: attack[1]["attack_modifier"],
        #     dmg: attack[1]["damage"],
        #     dmg_type: attack[1]["damage_type"],
        #     range: attack[1]["range"]
        #   )
        #   @attack.character = @character
        #   @attack.save
        end
      end
    end
    message = "Encounter has been successfully generated!"
    redirect = campaign_encounter_path(campaign, @encounter)
    ActionCable.server.broadcast(
      user_id, {message: message, job: "encounter", redirect: redirect}
    )
  end

  def api_call
    messages = [{
      role: "system", content: "You are a helpful asistant" # here we can change the asistant to another thing, so ChatGpt will answer like he was in this case asistant
    }]

    OpenAI.configure do |config|
      config.access_token = ENV.fetch('OPENAI_ACCESS_TOKEN')
    end

    client = OpenAI::Client.new

    message = %Q[Generate a dnd 5e encounter for me. Some information about the encounter: Era is #{@era}, theme is #{@theme}, Number of players to fight the encounter #{@players}, average level of players #{@lvl}. A small description that led to the encounter follows (if empty, assume there is none and generate a random encoutner).#{@description}. Provide me with some general information for the tactics that the enemies will use. Provide me with the type and amount of enemies in the encounter. No extra text or content. Total HP represents the INDIVIDUAL MAX HP of each enemy. For the spells, fill them in an array of string formats, IF APPLICABLE. You should populate with ALL the skills, with the same format as acrobatics in the sample below.The prompt field, should be filled with a good prompt to be used in stable diffusion, that describes the speficic enemy. Your response format should look exactly like the hash that follows (treat the values as example).

      {
        "Name": "Rescue mission in Suzail's Prisons",
        "Description": "As the players delve deeper into the Suzail's prisons, they hear the echoes of heavy footsteps and rattling chains. Soon, they come across a group of prison guards escorting a group of dangerous criminals. Among the prisoners, they spot their comrade who was imprisoned for public nudity. The guards seem to be heavily armed and ready to fight.",
        "Tactics": "The guards will attempt to surround the players and use their shields to protect themselves while their crossbow-wielding comrades fire from a distance. Meanwhile, the prisoners will try to break free and attack the players using improvised weapons. The guards will prioritize targeting the player who seems to be the biggest threat, while the prisoners will go after the player who is closest to them.",
        "Total Experience Points": 1500,
        "Enemies": {
          "Prison Guard":{
            "Prompt": "",
            "Amount": 4,
            "Total HP": 32,
            "Armor Class": 15,
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
            }
          }
        }
      }
    ]
    # "Attacks and Spellcasting": {
    #   "Rapier": {
    #     "attack_modifier": "+6",
    #     "damage": "1d8+4",
    #     "damage_type": "piercing damage",
    #     "range": "0"
    # },
    #   "Shortbow": {
    #     "attack_modifier": "+6",
    #     "damage": "1d6+4",
    #     "damage_type": "piercing damage",
    #     "range": "80/320"
    #   }
    # },
    # "Features and Traits": {
    #     "Darkvision": "You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light.",
    #     "Fey Ancestry": "You have advantage on saving throws against being charmed, and magic can't put you to sleep.",
    #     "Criminal Contact": "You have a reliable and trustworthy contact who acts as your liaison to a network of other criminals.",
    #     "Sneak Attack": "Once per turn, you can deal an extra 1d6 damage to one creature you hit with an attack if you have advantage on the attack roll. The attack must use a finesse or a ranged weapon.",
    #     "Thieves' Cant": "You know the secret language of thieves."
    # },
    # ,
    #         "Spells": [],
    #         "Proficiencies and Skills": {
    #           "Proficiency Bonus": "+2",
    #           "Skills": {
    #             "Acrobatics": {
    #               "proficient": true,
    #               "ability score bonus": 4,
    #               "bonus other": 0
    #             }
    #           },
    #           "Saving Throws": {
    #             "Dexterity": "+6",
    #             "Intelligence": "+1"
    #           }
    #         }
    question = { role: "user", content: message }
    messages << question
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: messages, # Required.
        temperature: 0.7,
        max_tokens: 2048
      }
    )

    @responsehash = JSON.parse(response.dig("choices", 0, "message", "content"))
  end
end
