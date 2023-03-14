require 'net/http'
require 'uri'
require 'json'

class CharactersController < ApplicationController
  def create
    name = params[:name]
    age = params[:age]
    character_class = params[:character_class]

    messages = [
      { "role" => "system",
        "content" => "You are a helpful assistant"},
      { "role" => "user",
        "content" => "#{character_class} #{name} #{age}"}
    ]

    uri = URI.parse("https://api.openai.com/v1/chat/completions")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Authorization"] = "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"
    request.body = JSON.dump({
      "model" => "gpt-3.5-turbo",
      "messages" => messages
    })
    req_options = {
      use_ssl: uri.scheme == "https",
    }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response_hash = JSON.parse(response.body)
    response_string = response_hash["choices"].first["message"]["content"]

    character = {
      name: name,
      age: age,
      character_class: character_class,
      response: response_string
    }

    render json: character
  end
end
