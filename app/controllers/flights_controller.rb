require 'open-uri'
require 'json'

require 'airports'

class FlightsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trip = Trip.find(params[:trip_id])
    @flights = Flight.all.where(trip_id: @trip).order(:dept_date)
  end


  def show
    @flight = Flight.find(params[:id])
  end


  def new
    data = open('https://api.skypicker.com/airlines').read
    @responses = JSON.parse(data)

    @responses = @responses.sort_by{ |e| e["name"]}

    @airports = Airports.all
    @airports = @airports.sort_by{ |e| e.name}

    @trip = Trip.find(params[:trip_id])
  end


  def create
    @flight = Flight.new(flight_params)

    @flight.save
    redirect_to "/trips/#{@flight.trip_id}/flights"
  end


  def destroy
  @flight = Flight.find(params[:id])
  @flight.destroy

  redirect_to "/trips/#{@flight.trip_id}/flights"
  end


  def edit
    # for the from
    data = open('https://api.skypicker.com/airlines').read
    @responses = JSON.parse(data)

    @responses = @responses.sort_by{ |e| e["name"]}

    @airports = Airports.all
    @airports = @airports.sort_by{ |e| e.name}

    ########  to get all the current flight details
    @flight = Flight.find(params[:id])

    @from = Airports.find_by_iata_code(@flight.from).name
    @to = Airports.find_by_iata_code(@flight.to).name

    @airline_name = ""
    @responses.each do |response|
      if response["id"] == @flight.airline_code
        @airline_name = response["name"]
      end
    end

    # get the trip date range
    @trip = Trip.find(params[:trip_id])
  end

  def update
    @flight = Flight.find(params[:id])

    @flight.update(flight_params)
    redirect_to "/trips/#{@flight.trip_id}/flights"
  end


  private
  def flight_params
    params.require(:flight).permit(:airline_code, :flight_no, :dept_date, :dept_time, :arr_date, :arr_time, :from, :to, :trip_id)
  end
end