class CharactersController < ApplicationController
  before_action :authenticate_user!
  def index
    @campaign = Campaign.find(params[:campaign_id])
    @characters = Character.where(encounter_id: nil).paginate(page: params[:page], per_page: 7)
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @campaign = Campaign.find(params[:campaign_id])
    @character.campaign = @campaign
    @character.save
    redirect_to campaign_character_path(@campaign, @character)
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
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
