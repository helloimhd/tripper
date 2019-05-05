require 'open-uri'
require 'json'

class FlightsController < ApplicationController

  def index
  end

  def new
    data = open('https://api.skypicker.com/airlines').read
    @responses = JSON.parse(data)
    p @responses[0][:name]

  end
end