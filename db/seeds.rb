# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([
                                        { name: "Mike", nickname: 'M', email: 'hey@gmail.com', password: '123' },
                                        { name: "Delon", nickname: 'T', email: 'h1@gmail.com', password: '1234' },
                                        { name: "Martha", nickname: 'M12', email: 'h2@gmail.com', password: '12356' }
                                      ])
