Sham.define do
  username   { Faker::Internet.user_name }
  first_name { Faker::Name.first_name }
  last_name  { Faker::Name.last_name } 
  password   { (1..10).map { ('a'..'z').to_a.rand }.join }
  email      { Faker::Internet.email }
  title      { Faker::Lorem.words(3).join(' ') }
  body       { Faker::Lorem.words(8).join(' ') }
  tag_name   { Faker::Lorem.words(1).join }
end

User.blueprint do
  username               { Sham.username }
  github_username        { Sham.username }
  first_name             { Sham.first_name }
  last_name              { Sham.last_name }
  email                  { Sham.email }
  password               { 'testyy' }
  password_confirmation  { 'testyy' }
end

PresentationRequest.blueprint do
  content { Sham.body }
  user    { User.make }
end
