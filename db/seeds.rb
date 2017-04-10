# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do  User.create!(
  username: Faker::Name.name,
  email: Faker::Internet.email,
  password: 'password'
  )
end


10.times do  Post.create!(
  author_id: [1,2,3,4,5,6,7,8,9,10].sample,
  title: Faker::Book.title,
  text: Faker::Lorem.paragraph,
  published?: Faker::Boolean.boolean
  )
end

10.times do Vote.create!(
  voter_id: [1,2,3,4,5,6,7,8,9,10].sample,
  votable_id: [1,2,3,4,5,6,7,8,9,10].sample,
  votable_type: ['Comment', 'Post'].sample
  )
end

rowling = JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/harry-potter.json"))
shakespeare = JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/shakespeare.json"))
martin = JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/game-of-thrones.json"))

authors = ['William Shakespeare', 'J-K Rowling', 'George R.R. Martin']

authors.each {|author| Author.create!(name: author)}

start_time = Time.now

j = 0
Work.bulk_insert(:previous_term, :next_word, :probability, :author_id) do |works|
  shakespeare.each do |previous_term, probable_terms|
    puts "Currently on iteration #{j} of shakespeare"
    probable_terms.each do |next_word, probability|
      works.add previous_term: previous_term, next_word: next_word, probability: probability, author_id: 1
    end
    j += 1
  end
end

i = 0
Work.bulk_insert(:previous_term, :next_word, :probability, :author_id) do |works|
  rowling.each do |previous_term, probable_terms|
    puts "Currently on iteration #{i} of rowling"
    probable_terms.each do |next_word, probability|
      works.add previous_term: previous_term, next_word: next_word, probability: probability, author_id: 2
    end
    i += 1
  end
end


k = 0
Work.bulk_insert(:previous_term, :next_word, :probability, :author_id) do |works|
  martin.each do |previous_term, probable_terms|
    puts "Currently on iteration #{k} of martin"
    probable_terms.each do |next_word, probability|
      works.add previous_term: previous_term, next_word: next_word, probability: probability, author_id: 3
    end
    k += 1
  end
end

end_time = Time.now

puts (end_time - start_time)/60