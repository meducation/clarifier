module Clarifier
  class NGrams

    def n_grams(input, size = 2)
      words = input.split(/\W+/)
      ngrams = []
      words.each_with_index do |word, i|
        upper_limit = i + size - 1
        ngrams << words[i..upper_limit].join(' ') unless upper_limit >= words.length
      end
      ngrams
    end

  end
end