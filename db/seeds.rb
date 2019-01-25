# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 种子数据
# 100.times do |i|
#   Category.create(:name => Faker::Artist.name)
#   Account.create(:name => Faker::Name.unique.name, :age => rand(60), :address => Faker::Address.full_address)
# end

# 10.times do |i|
#   Balance.create(:income => rand(1000), :expense => rand(1000),:account_id => rand(10))
# end

User.all.each do |u|
  u.name  = Faker::Name.first_name.slice(0,5)
  email   = Faker::Internet.email
  u.email = email
  u.email_confirmation    = email
  u.alisa_name            = ('a'..'z').to_a.sample(4).join
  u.terms_of_service      = true
  u.role                  = 'admin'
  u.age                   = rand(30)
  u.home_page_urls        = '/'
  u.guid                  = SecureRandom.uuid.delete('-')
  u.password              = '123456'
  u.password_confirmation = '123456'
  u.save!
  puts '成功修复一条'
end

User.create!(name: 'dmy', email: '123@qq.com', alisa_name: 'sddf', terms_of_service: true, role: 'admin', age: 25, password: '123456', password_confirmation: '123456', email_confirmation: '123@qq.com', home_page_urls: '/')
Product.create!(user_id: 1, name: '苹果', price: 15.6)