# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts "Cleaning database..."
Task.destroy_all
List.destroy_all

puts "Creating lists and tasks..."

100.times do
  list = List.create!(
    title: Faker::Lorem.words(number: 2).join(" ").titleize,
    description: Faker::Lorem.sentence
  )

  rand(3..7).times do
    list.tasks.create!(
      title: Faker::Lorem.words(number: 3).join(" ").titleize,
      description: Faker::Lorem.sentence,
      completed: [ true, false ].sample
    )
  end
end

puts "Created #{List.count} lists and #{Task.count} tasks!"
