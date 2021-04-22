10.times do |user|
  User.create(
    email: Faker::Internet.email,
    password: "123456789",
    password_confirmation: "123456789",
    fullname: Faker::Name.name_with_middle,
    username: Faker::Name.first_name.downcase,
    bio: Faker::Lorem.sentence,
    location: Faker::Address.state,
    website: Faker::Internet.url,
    profile_img: Faker::Avatar.image, 
    background_img: "https://images.unsplash.com/photo-1619090248278-52a392aae286?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    birthday: Faker::Date.between(from: 20.years.ago, to: Date.today))
end