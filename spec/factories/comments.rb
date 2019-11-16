FactoryBot.define do
  factory :comment do
    content { Faker::StarWars.character }
    user_id nil
    post_id nil
  end
end