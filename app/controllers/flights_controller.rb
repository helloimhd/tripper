require 'open-uri'
require 'json'

require 'airports'

class FlightsController < ApplicationController

  def index
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def new
    data = open('https://api.skypicker.com/airlines').read
    @responses = JSON.parse(data)

    @responses = @responses.sort_by{ |e| e["name"]}

    puts "****************************"

    @airports = Airports.all
    @airports = @airports.sort_by{ |e| e.name}
  end


  def create
    @flight = Flight.new(flight_params)

    p @flight

    @flight.save
    redirect_to @flight
  end




  private
  def flight_params
    params.require(:flight).permit(:airline_code, :flight_no, :dept_date, :dept_time, :arr_date, :arr_time, :flight_type, :from, :to)
  end
end