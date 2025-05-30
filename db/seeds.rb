# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "deleting FAQs"
Faq.destroy_all

answer = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

puts "creating FAQs"
Faq.create!(order: 1, question:"Can I use BleedSafe instead of calling 999", answer: answer)
Faq.create!(order: 2, question:"I cannot see any bleed kits in my area?", answer: answer)
Faq.create!(order: 3, question:"Can I use BleedSafe if I have no internet access?", answer: answer)

puts "completed FAQs seeding"
