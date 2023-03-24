class ImagesController < ApplicationController
  before_action :authenticate_user!
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
    @prompt = "((#{@character.class_list.downcase})), (#{@character.race.downcase}), ((#{@character.eyes.downcase} eyes)), ((#{@character.hair.downcase} hair)), ((#{@character.skin.downcase} skin))"
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
