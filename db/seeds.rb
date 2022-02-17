# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Cleaning..."
Movie.destroy_all

puts "Creating 4 movies..."
URL = "http://tmdb.lewagon.com/movie/top_rated?api_key=%3Cyour_api_key%3E"
json = URI.open(URL).read
results = JSON.parse(json)

results["results"].each do |result|
  Movie.create!(title: result["original_title"], overview: result["overview"], poster_url: "https://image.tmdb.org/t/p/w500#{result["poster_path"]}", rating: result["vote_average"])
end

puts "... created #{Movie.count} movies."
