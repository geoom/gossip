FactoryBot.define do
    factory :article do
        title { Faker::Lorem.words(3) }
        content { Faker::Lorem.paragraphs(3) }
        user_id { Faker::Number.number(10) }
    end
end