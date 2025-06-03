# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


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

puts "creating admin user"
user = User.new
user.email = "admin@bleedsafe.com"
user.password = "something"
user.admin = true
user.latitude = 51.88093
user.longitude = 0.8788
user.address = "28 Audley Road, Colchester, CO3 3TY"
user.save!(validate: false)
puts "user created"
