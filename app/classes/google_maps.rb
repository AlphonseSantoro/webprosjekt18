# frozen_string_literal: true

class GoogleMaps
  def initialize(params)
    @travel = params
  end

  def origin
    @travel[:from]
  end

  def destination
    @travel[:to]
  end

  def places(from, to)
    uri = URI("http://reisapi.ruter.no/Travel/GetTravels?fromPlace=#{from}&toPlace=#{to}&isafter=true")
    puts uri
    result = Net::HTTP.get_response(uri)
    JSON.parse(result.body)
  end

  def city_bikes(coordinate)
    center = [coordinate[:long], coordinate[:lat]]
    box = Geocoder::Calculations.bounding_box(center, 0.2)
    uri = URI("http://reisapi.ruter.no/Place/GetCityBikeStations?longmin=#{box[0]}&longmax=#{box[2]}&latmin=#{box[1]}&latmax=#{box[3]}")
    {
      body: JSON.parse(Net::HTTP.get(uri)),
      center: center
    }
  end
end
