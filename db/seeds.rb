# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.delete_all
Blogtext.delete_all
Comment.delete_all
Reply.delete_all


picturesArr =['connector.jpg','couple.jpeg', 'couple2.jpeg', 'couple3.jpeg', 'helping_you.png', 'istockphoto-665037818-612x612.jpg',
              'istockphoto-904172104-612x612.jpg', 'istockphoto-1009803562-612x612.jpg', 'istockphoto-1071104734-612x612.jpg', 'istockphoto-1297349747-612x612.jpg',
              'istockphoto-1322104312-612x612.jpg', 'istockphoto-1357145597-612x612.jpg', 'logo white.png', 'missing_link.png', 'missing_link_logo.png',
              'missing_link_transparent.jpg', 'stock_profile_picture.png']
adminUser = User.create!(email:"nashar101@gmail.com", password: "110303Gile@d", name:"Gilead", bio: Faker::Lorem.sentence(word_count: 500))
adminUser.profile_picture.attach( io: File.open(Rails.root.join('app/assets/images/connector.jpg')), filename: 'connector.jpg')

adminUser1 = User.create!(email:"testuser@gmail.com", password: "password", name:"TestUser", bio: Faker::Lorem.sentence(word_count: 500))
adminUser1.profile_picture.attach( io: File.open(Rails.root.join('app/assets/images/couple3.jpeg')), filename: 'couple3.jpg')

50.times do
  profile_picture = Faker::Number.between(from: 0, to: picturesArr.length-1)
  user = User.create!(email: Faker::Internet.email, password: Faker::Name.unique.name, name: Faker::Name.unique.name, bio: Faker::Lorem.sentence(word_count: 200))

  user.profile_picture.attach( io: File.open(Rails.root.join('app/assets/images/' + picturesArr[profile_picture])), filename: picturesArr[profile_picture])

end

100.times do
  start = User.first!.id
  end_user = User.last!.id
  user = User.find(Faker::Number.between(from: start, to: end_user))
  blog = Blogtext.create!(owner: user.name, title: Faker::Quote.famous_last_words, user_id: user.id, blogpost: Faker::Lorem.sentence(word_count: 500))
end

10000.times do
  start = User.first!.id
  end_user = User.last!.id

  start1 = Blogtext.first!.id
  end_user1 = Blogtext.last!.id
  user = User.find(Faker::Number.between(from: start, to: end_user))
  blog = Blogtext.find(Faker::Number.between(from: start1, to: end_user1))
  Comment.create!(username: user.name, comment: Faker::Lorem.sentence(word_count: Faker::Number.between(from: 1, to: 50)), blogtext_id: blog.id, user_id: user.id)
end

50000.times do
  start = User.first!.id
  end_user = User.last!.id
  start1 = Comment.first!.id
  end1 = Comment.last!.id
  user = User.find(Faker::Number.between(from: start, to: end_user))
  comment = Comment.find(Faker::Number.between(from: start1, to: end1))
  Reply.create!(username: user.name, reply: Faker::Lorem.sentence(word_count: Faker::Number.between(from: 1, to: 50)), user_id: user.id, comment_id: comment.id)
end