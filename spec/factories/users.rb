FactoryBot.define do
  factory :user do
    name { Faker::Name.name}
    password 'foobar'
    email {Faker::Internet.email }
    image nil
  end
end