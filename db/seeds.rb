# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 种子数据
100.times do |i|
  Category.create(:name => Faker::Artist.name)
  Account.create(:name => Faker::Name.unique.name, :age => rand(60), :address => Faker::Address.full_address)
end

10.times do |i|
  Balance.create(:income => rand(1000), :expense => rand(1000),:account_id => rand(10))
end
