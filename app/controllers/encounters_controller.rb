class EncountersController < ApplicationController
  before_action :set_campaign
  def index
    @encounters = Encounter.all
  end

  def new
  end

  def show
    @encounter = Encounter.find(params[:id])
  end

  def create
    @era = params[:era]
    @theme = params[:theme]
    @players = params[:players]
    @lvl = params[:lvl]
    @description = params[:description]

    RandomEncounter.perform_later(@era, @theme, @players, @lvl, @description, @campaign)
    redirect_to campaign_encounters_path(@campaign)
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
