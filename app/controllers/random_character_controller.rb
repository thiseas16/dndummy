require 'openai'
require 'json'

class RandomCharacterController < ApplicationController
  before_action :authenticate_user!, :set_campaign
  def new
  end

  def create
    @prompt = params[:prompt]
    RandomCharacter.perform_later(@prompt, @campaign, current_user.id)
    redirect_to campaign_characters_path(@campaign)
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
