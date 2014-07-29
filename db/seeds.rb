# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   if User.find_by_email("brandon@sportsphotos.com").nil?
#     user1 = User.create(email: 'brandon@sportsphotos.com', password: 'popcorn1')
#     user1.skip_confirmation!
#     user1.save!
#   end
#
#   if User.find_by_email("bkschatz@greatwebdevelopment.com").nil?
#    user2 = User.create(email: 'bkschatz@greatwebdevelopment.com', password: 'popcorn1')
#    user2.skip_confirmation!
#    user2.save!
#   end

   ["Alt/Indie","World","Country","Singer-Songwriter","R&B/Soul","Rock","PopHip-Hop/Rap","Folk","Electronic/Dance","CountryGenre"].each do |name|
    Genre.create(:name => name)
   end
