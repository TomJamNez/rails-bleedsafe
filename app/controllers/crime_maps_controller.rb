require "json"
require "open-uri"

class CrimeMapsController < ApplicationController

  def index
    if params[:query].present?
     address_query_url = "https://api.mapbox.com/search/geocode/v6/forward?q=#{params[:query]}&access_token=#{ENV['MAPBOX_API_KEY']}"
     address_serialised = URI.parse(address_query_url).read
     @address = JSON.parse(address_serialised)
     @address_latitude = @address["features"][0]["properties"]["coordinates"]["latitude"]
     @address_longitude = @address["features"][0]["properties"]["coordinates"]["longitude"]
     @address_used = @address["features"][0]["properties"]["full_address"]
     @poly_map_string = poly_map(@address_latitude, @address_longitude)
     @crime_lookups = police_data(@poly_map_string)
           @markers = @crime_lookups.map do |crime_lookup|
        {
          lat: crime_lookup["location"]["latitude"],
          lng: crime_lookup["location"]["longitude"]
        }
      end

    else
     @address_latitude = current_user.latitude
     @address_longitude = current_user.longitude
     @address_used = current_user.address
     @poly_map_string = poly_map(@address_latitude, @address_longitude)
     @crime_lookups = police_data(@poly_map_string)
      @markers = @crime_lookups.map do |crime_lookup|
        {
          lat: crime_lookup["location"]["latitude"],
          lng: crime_lookup["location"]["longitude"]
        }
      end

    end
  end

private
def police_data(geolocation)
     crime_lookups_url = "https://data.police.uk/api/crimes-street/all-crime?poly=#{geolocation}"
     crime_lookups_serialised = URI.parse(crime_lookups_url).read
     results = JSON.parse(crime_lookups_serialised)
end




def poly_map(latitude, longitude)
  degree_factor = CrimeMapConfig.find_by(key: "crime_distance").value * CrimeMapConfig.find_by(key: "degree_conversion").value
  north_lat = (CrimeMapConfig.find_by(key: "north_lat_adjustment").value * degree_factor) + latitude
  north_lng = (CrimeMapConfig.find_by(key: "north_lng_adjustment").value * degree_factor) + longitude
  north = "#{north_lat},#{north_lng}"
  north_east_lat = (CrimeMapConfig.find_by(key: "north_east_lat_adjustment").value * degree_factor) + latitude
  north_east_lng = (CrimeMapConfig.find_by(key: "north_east_lng_adjustment").value * degree_factor) + longitude
  north_east = "#{north_east_lat},#{north_east_lng}"
  east_lat = (CrimeMapConfig.find_by(key: "east_lat_adjustment").value * degree_factor) + latitude
  east_lng = (CrimeMapConfig.find_by(key: "east_lng_adjustment").value * degree_factor) + longitude
  east = "#{east_lat},#{east_lng}"
  south_east_lat = (CrimeMapConfig.find_by(key: "south_east_lat_adjustment").value * degree_factor) + latitude
  south_east_lng = (CrimeMapConfig.find_by(key: "south_east_lng_adjustment").value * degree_factor) + longitude
  south_east = "#{south_east_lat},#{south_east_lng}"
  south_lat = (CrimeMapConfig.find_by(key: "south_lat_adjustment").value * degree_factor) + latitude
  south_lng = (CrimeMapConfig.find_by(key: "south_lng_adjustment").value * degree_factor) + longitude
  south = "#{south_lat},#{south_lng}"
  south_west_lat = (CrimeMapConfig.find_by(key: "south_west_lat_adjustment").value * degree_factor) + latitude
  south_west_lng = (CrimeMapConfig.find_by(key: "south_west_lng_adjustment").value * degree_factor) + longitude
  south_west = "#{south_west_lat},#{south_west_lng}"
  west_lat = (CrimeMapConfig.find_by(key: "west_lat_adjustment").value * degree_factor) + latitude
  west_lng = (CrimeMapConfig.find_by(key: "west_lng_adjustment").value * degree_factor) + longitude
  west = "#{west_lat},#{west_lng}"
  north_west_lat = (CrimeMapConfig.find_by(key: "north_west_lat_adjustment").value * degree_factor) + latitude
  north_west_lng = (CrimeMapConfig.find_by(key: "north_west_lng_adjustment").value * degree_factor) + longitude
  north_west = "#{north_west_lat},#{north_west_lng}"
  polymap = "#{north}:#{north_east}:#{east}:#{south_east}:#{south}:#{south_west}:#{west}:#{north_west}"
  end
end
