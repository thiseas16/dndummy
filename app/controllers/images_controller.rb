class ImagesController < ApplicationController
  require 'httparty'
  require 'json'
  require 'base64'
  require 'fileutils'

  def home
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @image = Image.new
  end

  def new_portrait
  end

  def create_portrait
    @campaign = Campaign.find(params[:campaign_id])
    @character = Character.find(params[:character_id])
    @prompt = "(#{@character.class}), (#{@character.race}), ((#{@character.eyes} eyes)), (#{@character.hair} hair), (#{@character.skin} skin)"
    @style = "test dnd portrait"
    call_sd_api
    save_image
    file = File.open('app/assets/images/image.jpg', 'rb')
    @character.photo.attach(io: file, filename: 'filename', content_type: 'image/jpeg')
    @character.save!
    redirect_to campaign_character_path(@campaign, @character)
  end

  def create
    @image = Image.new
    @prompt = params[:image][:prompt]
    @style = "test dnd abstract"
    @image.prompt = @prompt
    @campaign = Campaign.find(params[:campaign_id])
    @image.campaign = @campaign
    call_sd_api
    save_image
    file = File.open('app/assets/images/image.jpg', 'rb')
    @image.photo.attach(io: file, filename: 'filename', content_type: 'image/jpeg')
    @image.save!
    redirect_to campaign_all_images_path(@campaign)
  end

  def index
    @campaign = Campaign.find(params[:campaign_id])
  end

  def all
    @images = Image.all
    @campaign = Campaign.find(params[:campaign_id])
  end

  private

  def call_sd_api
    body = {
      "prompt": @prompt,
      "steps": 10,
      "styles": [
        @style
      ]
    }

    response = HTTParty.post('https://b215982c-6440-4331.gradio.live/sdapi/v1/txt2img', body: body.to_json, headers: { 'Content-Type' => 'application/json' })
    response_hash = JSON.parse(response.body)
    @base64_string = response_hash["images"].first
  end

  def save_image
    decoded_data = Base64.decode64(@base64_string)

    # Save the decoded data as an image
    File.open("app/assets/images/image.jpg", "wb") do |f|
      f.write(decoded_data)
    end
  end
end
