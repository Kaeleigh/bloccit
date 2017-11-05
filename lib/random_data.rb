# #5 module random data defined
module RandomData
  # #6 defined random_paragraph, sentences is an array, loop through range 4-6 place results in sentences array, join turns sentences into a paragraph
  def self.random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end

    sentences.join(" ")
  end

  # #7 create a sentence with random words, strings is an array, capitalize sentence and add .
  def self.random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word
    end
    sentence = strings.join(" ")
    sentence.capitalize << "."
  end
  # #8 random_word is defined, letters is an array 
  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end
end
