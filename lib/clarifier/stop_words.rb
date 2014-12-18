module Clarifier
  class StopWords

    attr_accessor :stopwords

    @@lists = {}

    def self.lists
      @@lists
    end

    def initialize(desired_stopwords = nil, training_threshold = 0.8)
      if desired_stopwords.kind_of?(Array)
        @stopwords = desired_stopwords
      elsif @@lists[desired_stopwords]
        @stopwords = @@lists[desired_stopwords]
      else
        @stopwords = @@lists[:en_gb_basic]
      end
      @training_threshold = training_threshold
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

    def reset
      @word_counts = Hash.new(0)
      @training_doc_count = 0
      @stopwords = []
    end

    def refine(doc)
      @word_counts ||= Hash.new(0)
      @training_doc_count ||= 0
      @training_doc_count += 1
      words = doc.split
      words.uniq!
      words.each do |word|
        @word_counts[word] += 1
      end
      select_stopwords_from_training
    end

    def train(docs, threshold = @training_threshold)
      @word_counts = Hash.new(0)
      @training_doc_count = 0
      @training_threshold = threshold
      docs.each do |doc|
        refine(doc)
      end
    end

    def select_stopwords_from_training
      @stopwords = []
      @word_counts.each do |word, count|
        if count.to_f / @training_doc_count >= @training_threshold
          @stopwords << word
        end
      end
    end

  end
end




