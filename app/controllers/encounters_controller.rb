class EncountersController < ApplicationController
  before_action :set_campaign
  def index
    @encounters = Encounter.all
  end

  def new
  end

  def show
    @encounter = Encounter.find(params[:id])
    @characters = @encounter.characters.paginate(page: params[:page], per_page: 1)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @era = params[:era]
    @theme = params[:theme]
    @players = params[:players]
    @lvl = params[:lvl]
    @description = params[:description]

    RandomEncounter.perform_later(@era, @theme, @players, @lvl, @description, @campaign, current_user.id)
    redirect_to campaign_encounters_path(@campaign)
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
