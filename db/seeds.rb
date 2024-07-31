# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Property.find_or_create_by!({
    name: 'Hotel Taj',
    headline: 'Sample',
    description: 'Luxurious',
    address_1: 'Coastal road',
    city: 'Mumbai',
    state: 'Maharastra',
    country: 'India'
})
Property.find_or_create_by!({
    name: 'Hilton',
    headline: 'Sample',
    description: 'Luxurious',
    address_1: 'Guindy',
    city: 'Chennai',
    state: 'Tamilnadu',
    country: 'India'
})
Property.find_or_create_by!({
    name: 'Burj khalifa',
    headline: 'Sample',
    description: 'Luxurious',
    address_1: 'Rashed',
    city: 'Downtown Dubai',
    state: 'Dubai',
    country: 'UAE'
})