# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
Product.destroy_all
User.destroy_all
owner = User.create!(email: "owner@owner.com", password: "123456")
client = User.create!(email: "user@user.com", password: "123456")

file1 = URI.open("https://img.irroba.com.br/fit-in/900x700/filters:format(webp):fill(fff):quality(80)/levbaaia/catalog/e-bike/ebike-preta-lado-alta.jpg")
product1 = Product.new(subject: "E-BIKE Lev", description: 'Moto bonita')
# product1.photo.attach(io: file1, filename: "nes.png", content_type: "image/png")
product1.save!
