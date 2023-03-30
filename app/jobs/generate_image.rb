class GenerateImage < ActiveJob::Base
  include Rails.application.routes.url_helpers
  def perform(task, argument, campaign, user_id)
    if task == 'portrait'
      @character = argument
      @prompt = "((#{@character.class_list.downcase})), (#{@character.race.downcase}), ((#{@character.eyes.downcase} eyes)), ((#{@character.hair.downcase} hair)), ((#{@character.skin.downcase} skin))"
      @style = "test dnd portrait"
      api_call
      save_image
      character_photo_attach
      message = "The character portrait has been successfully generated!"
      redirect = campaign_character_path(campaign, @character)
    else
      @prompt = argument
      @image = Image.new
      @style = "test dnd abstract"
      @image.prompt = @prompt
      @image.campaign = campaign
      api_call
      save_image
      image_photo_attach
      message = "The requested image has been successfully generated!"
      redirect = campaign_all_images_path(campaign)
    end
    ActionCable.server.broadcast(
      user_id, { message: message, redirect: redirect }
    )
  end

  def api_call
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
  end

  def save_image
    decoded_data = Base64.decode64(@base64_string)

    # Save the decoded data as an image
    File.open("app/assets/images/image.jpg", "wb") do |f|
      f.write(decoded_data)
    end
  end

  def character_photo_attach
    file = File.open('app/assets/images/image.jpg', 'rb')
    @character.photo.attach(io: file, filename: 'filename', content_type: 'image/jpeg')
    @character.save!
  end

  def image_photo_attach
    file = File.open('app/assets/images/image.jpg', 'rb')
    @image.photo.attach(io: file, filename: 'filename', content_type: 'image/jpeg')
    @image.save!
  end
end
