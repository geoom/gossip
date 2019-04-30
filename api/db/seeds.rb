
first_user = User.create(name: 'pepito', email: 'user999@email.com', password: '12345678')

50.times do
    Article.create(
        title: Faker::Lorem.word, 
        content: Faker::Lorem.paragraphs(3),
        user_id: first_user.id
    )
end