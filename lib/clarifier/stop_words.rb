module Clarifier
  class StopWords

    attr_accessor :stopwords

    @@lists = {}

    def self.lists
      @@lists
    end

    def initialize(desired_stopwords = nil)
      if desired_stopwords.kind_of?(Array)
        @stopwords = desired_stopwords
      elsif @@lists[desired_stopwords]
        @stopwords = @@lists[desired_stopwords]
      else
        @stopwords = @@lists[:en_gb_basic]
      end
    end

    def clarify(input)
      new_string = input.dup

      @stopwords.each do |word|
        new_string.gsub!(/(^|\s)#{word}(\s|$)/i, '\1\2')
      end

      new_string.gsub!(/\s+/, ' ')
      new_string.strip!

      new_string
    end

    def train(docs, threshold = 0.8)
      word_counts = {}
      docs.each do |doc|
        words = doc.split
        words.uniq!
        words.each do |word|
          word_counts[word] ||= 0
          word_counts[word] += 1
        end
      end
      word_counts.each do |word,count|
        if count.to_f / docs.length >= threshold
          @stopwords << word
        end
      end
    end

  end
end




