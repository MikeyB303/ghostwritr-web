authors = ['William Shakespeare', 'J-K Rowling', 'George R.R. Martin']

authors.each {|author| Author.create!(name: author)}

Work.bulk_insert(:previous_term, :next_word, :probability, :author_id, :n_size, set_size: 1000) do |works|
  shakespeare.each_with_index do |file, index|
    file.each do |previous_term, probable_terms|
      probable_terms.each do |next_word, probability|
        works.add previous_term: previous_term, next_word: next_word, probability: probability, author_id: 1, n_size: (index + 1)
      end
    end
  end
end

Work.bulk_insert(:previous_term, :next_word, :probability, :author_id, :n_size, set_size: 1000) do |works|
  rowling.each_with_index do |file, index|
    file.each do |previous_term, probable_terms|
      probable_terms.each do |next_word, probability|
        works.add previous_term: previous_term, next_word: next_word, probability: probability, author_id: 2, n_size: (index + 1)
      end
    end
  end
end


Work.bulk_insert(:previous_term, :next_word, :probability, :author_id, :n_size, set_size: 1000) do |works|
  martin.each_with_index do |file, index|
    file.each do |previous_term, probable_terms|
      probable_terms.each do |next_word, probability|
        works.add previous_term: previous_term, next_word: next_word, probability: probability, author_id: 3, n_size: (index + 1)
      end
    end
  end
end
