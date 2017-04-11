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

rowling = [
  JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/harry-potter-n-1.json")),
  JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/harry-potter-n-2.json")),
  JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/harry-potter-n-3.json"))
]
shakespeare = [
  JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/shakespeare-n-1.json")),
  JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/shakespeare-n-2.json")),
  JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/shakespeare-n-3.json"))
]
martin = [
  JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/game-of-thrones-n-1.json")),
  JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/game-of-thrones-n-2.json")),
  JSON.parse(File.read("#{File.expand_path File.dirname(__FILE__)}/corpus_files/game-of-thrones-n-3.json"))
]

authors = ['William Shakespeare', 'J-K Rowling', 'George R.R. Martin']

authors.each {|author| Author.create!(name: author)}

start_time = Time.now

j = 0
Work.bulk_insert(:previous_term, :next_word, :probability, :author_id, :n_size, set_size: 1000) do |works|
  shakespeare.each_with_index do |file, index|
    file.each do |previous_term, probable_terms|
      puts "Currently on iteration #{j} of shakespeare"
      probable_terms.each do |next_word, probability|
        works.add previous_term: previous_term, next_word: next_word, probability: probability, author_id: 1, n_size: (index + 1)
      end
      j += 1
    end
  end
end

i = 0
Work.bulk_insert(:previous_term, :next_word, :probability, :author_id, :n_size, set_size: 1000) do |works|
  rowling.each_with_index do |file, index|
    file.each do |previous_term, probable_terms|
      puts "Currently on iteration #{i} of rowling"
      probable_terms.each do |next_word, probability|
        works.add previous_term: previous_term, next_word: next_word, probability: probability, author_id: 2, n_size: (index + 1)
      end
      i += 1
    end
  end
end


k = 0
Work.bulk_insert(:previous_term, :next_word, :probability, :author_id, :n_size, set_size: 1000) do |works|
  martin.each_with_index do |file, index|
    file.each do |previous_term, probable_terms|
      puts "Currently on iteration #{k} of martin"
      probable_terms.each do |next_word, probability|
        works.add previous_term: previous_term, next_word: next_word, probability: probability, author_id: 3, n_size: (index + 1)
      end
      k += 1
    end
  end
end


end_time = Time.now

puts (end_time - start_time)/60