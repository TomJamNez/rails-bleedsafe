# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# ___________________________________________CRIME MAP SEED DATA___________________________________________
puts "deleting CrimeMapConfig"
CrimeMapConfig.destroy_all
puts "deleting postcodes"
CrimePostcodeExclusion.destroy_all

puts "Creating crime map config"

CrimeMapConfig.create!(key:"crime_distance", value: 1000)
CrimeMapConfig.create!(key:"degree_conversion", value: 0.00001)
CrimeMapConfig.create!(key:"north_lat_adjustment", value: 1)
CrimeMapConfig.create!(key:"north_lng_adjustment", value: 0)
CrimeMapConfig.create!(key:"north_east_lat_adjustment", value: 0.8)
CrimeMapConfig.create!(key:"north_east_lng_adjustment", value: 0.8)
CrimeMapConfig.create!(key:"east_lat_adjustment", value: 0)
CrimeMapConfig.create!(key:"east_lng_adjustment", value: 1)
CrimeMapConfig.create!(key:"south_east_lat_adjustment", value: -0.8)
CrimeMapConfig.create!(key:"south_east_lng_adjustment", value: 0.8)
CrimeMapConfig.create!(key:"south_lat_adjustment", value: -1)
CrimeMapConfig.create!(key:"south_lng_adjustment", value: 0)
CrimeMapConfig.create!(key:"south_west_lat_adjustment", value: -0.8)
CrimeMapConfig.create!(key:"south_west_lng_adjustment", value: -0.8)
CrimeMapConfig.create!(key:"west_lat_adjustment", value: 0)
CrimeMapConfig.create!(key:"west_lng_adjustment", value: -1)
CrimeMapConfig.create!(key:"north_west_lat_adjustment", value: 0.8)
CrimeMapConfig.create!(key:"north_west_lng_adjustment", value: -0.8)

puts "Creating postcode exclusions"

CrimePostcodeExclusion.create!(postcode: "AB")
CrimePostcodeExclusion.create!(postcode: "DD")
CrimePostcodeExclusion.create!(postcode: "DG")
CrimePostcodeExclusion.create!(postcode: "EG")
CrimePostcodeExclusion.create!(postcode: "FK")
CrimePostcodeExclusion.create!(postcode: "G")
CrimePostcodeExclusion.create!(postcode: "HS")
CrimePostcodeExclusion.create!(postcode: "IV")
CrimePostcodeExclusion.create!(postcode: "KA")
CrimePostcodeExclusion.create!(postcode: "KW")
CrimePostcodeExclusion.create!(postcode: "KY")
CrimePostcodeExclusion.create!(postcode: "ML")
CrimePostcodeExclusion.create!(postcode: "PA")
CrimePostcodeExclusion.create!(postcode: "PH")
CrimePostcodeExclusion.create!(postcode: "TD")
CrimePostcodeExclusion.create!(postcode: "ZE")

puts "completed crime map config seeding"


# ___________________________________________FIRST AID MAP SEED DATA___________________________________________
puts "deleting FirstAidMap records"
FirstAidMap.destroy_all

puts "Creating FirstAidMap records for UK locations"
locations = [
  {
    name: "St Thomas' Hospital",
    address: "Westminster Bridge Rd, London SE1 7EH",
    category: "Hospital",
    description: "Major hospital with A&E department",
    latitude: 51.4988,
    longitude: -0.1196
  },
  {
    name: "Manchester Royal Infirmary",
    address: "Oxford Rd, Manchester M13 9WL",
    category: "Hospital",
    description: "Large teaching hospital",
    latitude: 53.4610,
    longitude: -2.2275
  },
  {
    name: "Edinburgh Royal Infirmary",
    address: "51 Little France Cres, Edinburgh EH16 4SA",
    category: "Hospital",
    description: "Main hospital in Edinburgh",
    latitude: 55.9230,
    longitude: -3.1592
  },
  {
    name: "Cardiff University Hospital",
    address: "Heath Park, Cardiff CF14 4XW",
    category: "Hospital",
    description: "Major teaching hospital in Wales",
    latitude: 51.5081,
    longitude: -3.1879
  },
  {
    name: "Belfast City Hospital",
    address: "Lisburn Rd, Belfast BT9 7AB",
    category: "Hospital",
    description: "Large hospital in Northern Ireland",
    latitude: 54.5781,
    longitude: -5.9547
  }
]

locations.each do |loc|
  FirstAidMap.create!(loc)
  puts "Created: #{loc[:name]}"
end

puts "Successfully created #{locations.size} UK locations!"

puts "creating admin user"
user = User.new
user.email = "admin@bleedsafe.com"
user.password = "something"
user.admin = true
user.latitude = 51.88093
user.longitude = 0.8788
user.address = "28 Audley Road, Colchester, CO3 3TY"
user.save(validate: false)
puts "user created"
