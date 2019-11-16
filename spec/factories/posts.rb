FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word}
    body { Faker::Lorem.sentence}
    #email {Faker::Internet.email }
    user_id nil
  end
end