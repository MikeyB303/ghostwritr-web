# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10 * User.create!(
  username: Faker::Name.name
  email: Faker::Internet.email
  password: 'password'
  )


10 * Post.create!(
  author_id: [1,2,3,4,5,6,7,8,9,10].sample
  title: Faker::Book.title
  text: Faker::Lorem.paragraph
  published?: Faker::Boolean.boolean
  )

10 * Vote.create!(
  voter_id: [1,2,3,4,5,6,7,8,9,10].sample
  votable_id: [1,2,3,4,5,6,7,8,9,10].sample
  votable_type: ['comment', 'post'].sample
  )