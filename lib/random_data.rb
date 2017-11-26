# # module random data defined
module RandomData

  # random_name method defined
  def self.random_name
    first_name = random_word.capitalize
    last_name = random_word.capitalize
    "#{first_name} #{last_name}"
  end

  # random_email method defined
  def self.random_email
    "#{random_word}@#{random_word}.#{random_word}"
  end

  # # defined random_paragraph, sentences is an array, loop through range 4-6 place results in sentences array, join turns sentences into a paragraph
  def self.random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end

    sentences.join(" ")
  end

  # # create a sentence with random words, strings is an array, capitalize sentence and add .
  def self.random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word
    end
    sentence = strings.join(" ")
    sentence.capitalize << "."
  end
  # # random_word is defined, letters is an array
  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end
end
