FactoryBot.define do
    factory :article do
        title { Faker::Lorem.word }
        content { Faker::Lorem.paragraphs(3) }
        created_by { Faker::Number.number(10) }
    end
end