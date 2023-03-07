class CampaignsController < ApplicationController
  def create
    @campaign = Campaign.new
  end

  def show
    @campaigns = Campaign.all
    @campaign = Campaign.new(campaign: @campaign)
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
  end
end
