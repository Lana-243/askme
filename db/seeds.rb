# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create!([
                       { name: 'Mike', nickname: 'Mikey', email: 'hey@gmail.com', password: '123' },
                       { name: 'Delon', nickname: 'Delon123', email: 'h1@gmail.com', password: '1234' },
                       { name: 'Martha', nickname: 'martha', email: 'h2@gmail.com', password: '12d356' },
                       { name: 'Nick', nickname: 'original_Nickname', email: 'h3@gmail.com', password: '12f356' },
                       { name: 'Anne', nickname: 'LittleAnnie', email: 'annie@gmail.com', password: '12f3d56' },
                       { name: 'Sidney', nickname: 'Sherlock', email: 'hsdf@gmail.com', password: '1235ss6' }
                     ])

Question.create!([
                   { body: 'What is your favorite language?', user: users[0], author: users[2],
                     answer: 'Ruby, #duh #Ruby' },
                   { body: 'Do you like podcasts?', user: users[0], author: users[2],
                     answer: 'Yeah, especially podcasts #podcasts_love of travelers' },
                   { body: 'What is your favorite dish? #food #yummy', user: users[1], author: users[0] },
                   { body: 'Among all of your friends, what are you best known for?', user: users[3],
                     author: users[1] },
                   { body: 'Do you enjoy grocery shopping?', user: users[2], author: users[4],
                     answer: 'Only if I can buy something for dessert' },
                   { body: 'Is there a food you don’t eat? #food', user: users[1], author: users[4],
                     answer: 'Caviar. But I can get by, I guess' },
                   { body: 'What do you think a caterpillar would taste like? #weird_stuff',
                     user: users[1], author: users[5] },
                   { body: 'When you were a child, what TV shows did you watch?', user: users[5],
                     author: users[3] }
                 ])
