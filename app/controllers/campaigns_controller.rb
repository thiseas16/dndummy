class CampaignsController < ApplicationController
  def index
  end

  def dice
  end

  # def characters
  #   @character = Character.new
  # end

  # def create_character
  #   name = params[:character][:name]
  #   race = params[:character][:race]
  #   charClass = params[:character][:class]

  #   # Call the OpenAI API to generate the character based on the inputs provided
  #   openai = OpenAI.new(ENV['OPENAI_API_KEY'])
  #   response = openai.completions.create(
  #     engine: 'davinci-codex',
  #     prompt: "Create a character named #{name}, who is a #{race} #{charClass}.",
  #     max_tokens: 1024,
  #     n: 1,
  #     stop: ['\n\n']
  #   )
  #   backstory = response.choices.first.text.strip

  #   # Generate the rest of the character based on the hash provided earlier
  #   character_hash = {
  #     name: name,
  #     race: race,
  #     class: charClass,
  #     backstory: backstory,
  #     level: 1,
  #     strength: rand(1..20),
  #     dexterity: rand(1..20),
  #     constitution: rand(1..20),
  #     intelligence: rand(1..20),
  #     wisdom: rand(1..20),
  #     charisma: rand(1..20),
  #     equipment: [
  #       'Backpack',
  #       'Bedroll',
  #       'Rations (5 days)',
  #       'Torch',
  #       'Waterskin',
  #       '10 Gold Pieces'
  #     ],
  #     spells: [
  #       'Magic Missile',
  #       'Fireball',
  #       'Cure Wounds'
  #     ]
  #   }

  #   # Create a new character with the hash and save it to the database
  #   @character = Character.new(character_hash)
  #   if @character.save
  #     redirect_to campaigns_path, notice: 'Character was successfully created.'
  #   else
  #     render :characters
  #   end
  # end
end
