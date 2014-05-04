require 'open-uri'
require 'json'

class AddressesController < ApplicationController
  def fetch_coordinates
    @address = "1404 Shore Ct Wheeling, IL 60090"
    @url_safe_address = URI.encode(@address)

    # Your code goes here.
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=true"
    raw_data=open(url).read
    parsed_data=JSON.parse(raw_data)
    results=parsed_data["results"]
    first=results[0]
    geometry=first["geometry"]
    location=geometry["location"]
    @latitude=location["lat"]
    @longitude=location["lng"]
  end
end
