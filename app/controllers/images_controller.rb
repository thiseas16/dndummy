class ImagesController < ApplicationController
  before_action :authenticate_user!, :set_campaign
  require 'httparty'
  require 'json'
  require 'base64'
  require 'fileutils'

  def home
  end

  def new
    @image = Image.new
  end

  def new_portrait
  end

  def create_portrait
    @character = Character.find(params[:character_id])
    GenerateImage.perform_later('portrait', @character, @campaign, current_user.id)
    redirect_to campaign_character_path(@campaign, @character)
  end

  def create
    @prompt = params[:image][:prompt]
    GenerateImage.perform_later('image', @prompt, @campaign, current_user.id)
    redirect_to campaign_all_images_path(@campaign)
  end

  def index
  end

  def all
    @images = Image.all
    # Test.perform_later(current_user.id) #testing purposes
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def call_sd_api
    @start = Time.current
    body = {
      "prompt": @prompt,
      "steps": 10,
      "styles": [
        @style
      ]
    }

    response = HTTParty.post('http://sddndummy.ddns.net:7860/sdapi/v1/txt2img', body: body.to_json, headers: { 'Content-Type' => 'application/json' })
    response_hash = JSON.parse(response.body)
    @base64_string = response_hash["images"].first
    @end = Time.current
    puts "=====================================================================\n"
    puts "=====================================================================\n"
    puts "=====================================================================\n"
    puts "=====================================================================\n"
    puts @end - @start
  end

  def save_image
    @start = Time.current

    decoded_data = Base64.decode64(@base64_string)

    # Save the decoded data as an image
    File.open("app/assets/images/image.jpg", "wb") do |f|
      f.write(decoded_data)
    end
    @end = Time.current
    puts "=====================================================================\n"
    puts "=====================================================================\n"
    puts "=====================================================================\n"
    puts "=====================================================================\n"
    puts @end - @start
  end
end
