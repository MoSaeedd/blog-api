FactoryBot.define do
  factory :tag do
    content { Faker::Lorem.word}
    post_id nil
  end
end