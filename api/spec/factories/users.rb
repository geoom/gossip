FactoryBot.define do
    factory :user do
        name { Faker::Name.name }
        email { 'somefakeemail@email.com' }
        password { 'thisisnotashorpass' }
    end
end