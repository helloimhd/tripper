require 'rubygems'
require 'amadeus'
require 'altflights'
class FlightsController < ApplicationController


  def new
    amadeus = Amadeus::Client.new({
      client_id: 'euGf23AuQx9eaWvhGmNJi5dJ5Rc5ij8r',
      client_secret: 'MStAXGhNGTBlAwfE'
    })

    begin
      p amadeus.shopping.flight_destinations.get(origin: 'MAD')
    rescue Amadeus::ResponseError => error
      puts error
    end
  end

end