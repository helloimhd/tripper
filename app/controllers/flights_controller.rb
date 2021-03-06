require 'open-uri'
require 'json'

require 'airports'
require 'countries/global'


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
    data = File.read("#{Rails.root}/public/airlines.json")

    # data = open('https://api.skypicker.com/airlines').read
    @responses = JSON.parse(data)
    p @responses

    @responses = @responses.sort_by{ |e| e[:name]}

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
    data = File.read("#{Rails.root}/public/airlines.json")
    # data = open('https://api.skypicker.com/airlines').read
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

  def emergency
    @trip = Trip.find(params[:trip_id])
    @flights = Flight.all.where(trip_id: @trip).order(:dept_date)

    @contacts = []

    @flights.each_with_index do |flight, index|

      # get isoCode
      @from = Airports.find_by_iata_code(flight.from).country
      isoCodeFrom = ISO3166::Country.find_country_by_name(@from)

      @to = Airports.find_by_iata_code(flight.to).country
      isoCodeTo = ISO3166::Country.find_country_by_name(@to)

      # get contact details by the isoCode
      begin
        fromData = open('http://emergencynumberapi.com/api/country/' + isoCodeFrom.number).read
        @emergencyFromData = JSON.parse(fromData)
      rescue OpenURI::HTTPError => error
        response = error.io
        @emergencyFromData = response.string
      end

      begin
        toData = open('http://emergencynumberapi.com/api/country/' + isoCodeTo.number).read
        @emergencyToData = JSON.parse(toData)
      rescue OpenURI::HTTPError => error
        response = error.io
        @emergencyToData = response.string
      end

      # puts @emergencyToData
      # puts @emergencyToData["error"]


      # put inside the hash
      @indvContact = {}

      # put from-destination detailss
      @indvContact[:from] = @from
      @indvContact[:iataCode_from] = flight.from

      # puts @emergencyFromData["error"]
      if @emergencyFromData["error"] != "error"
        @indvContact[:ambulance_from] = @emergencyFromData["data"]["ambulance"]["all"][0]
        @indvContact[:fire_from] = @emergencyFromData["data"]["fire"]["all"][0]
        @indvContact[:police_from] = @emergencyFromData["data"]["police"]["all"][0]
        @indvContact[:dispatch_from] = @emergencyFromData["data"]["dispatch"]["all"][0]
      else
        @indvContact[:ambulance_from] = ""
        @indvContact[:fire_from] = ""
        @indvContact[:police_from] = ""
        @indvContact[:dispatch_from] = ""
      end    # end of if statement to check null data for from

      # put to-destination details
      @indvContact[:to] = @to
      @indvContact[:iataCode_to] = flight.to

      if @emergencyToData["error"] != "error"
        @indvContact[:ambulance_to] = @emergencyToData["data"]["ambulance"]["all"][0]
        @indvContact[:fire_to] = @emergencyToData["data"]["fire"]["all"][0]
        @indvContact[:police_to] = @emergencyToData["data"]["police"]["all"][0]
        @indvContact[:dispatch_to] = @emergencyToData["data"]["dispatch"]["all"][0]
      else
        @indvContact[:ambulance_to] = ""
        @indvContact[:fire_to] = ""
        @indvContact[:police_to] = ""
        @indvContact[:dispatch_to] = ""
      end   # end of if statement to check null data for to

      # push in array
      @contacts.push(@indvContact)
    end   # end of flight with each index
  end

  private
  def flight_params
    params.require(:flight).permit(:airline_code, :flight_no, :dept_date, :dept_time, :arr_date, :arr_time, :from, :to, :trip_id)
  end
end