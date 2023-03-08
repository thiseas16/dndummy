class CampaignsController < ApplicationController
  def create
    @campaign = Campaign.new
  end

  def show
   @campaign = Campaign.find(params[:id])
   render :show
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to campaigns_path
  end
end
