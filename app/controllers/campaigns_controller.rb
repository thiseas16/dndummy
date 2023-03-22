class CampaignsController < ApplicationController
  before_action :authenticate_user!
  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user
    @campaign.save
    redirect_to campaigns_path
  end

  def dice
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :description, :photo)
  end
end
