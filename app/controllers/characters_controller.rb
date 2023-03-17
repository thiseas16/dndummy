class CharactersController < ApplicationController
  def index
    @characters = Character.all
    @campaign = Campaign.find(params[:campaign_id])
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.campaign = Campaign.find(params[:campaign_id])
    @character.save
    redirect_to campaign_characters_path
  end

  def show
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
  end

  private

  def character_params
    params.require(:character).permit(:name, :level, :alignment, :exp, :total_hp, :current_hp, :temp_hp, :personality_traits, :ideals, :bonds, :flaws, :speed, :armor_class, :inititiave, :backstory, :appearance, :age, :height, :weight, :eyes, :skin, :hair, :dex, :str, :const, :cha, :int, :wis, :race, :class_list)
  end
end
