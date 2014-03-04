module Clarifier
  class StopWords

    @@lists = {}
    def self.lists
      @@lists
    end

    def initialize
      @stopwords = @@lists[:en_gb_basic]
    end

    def clarify(input)
      new_string = input.dup
      #new_string.downcase!
      #new_string.gsub!(/[[:punct:]]/, ' ')
      #new_string.gsub!(/\s+/, ' ')

      @stopwords.each do |word|
        new_string.sub!(/^#{word}\s/i, '') #beginning
        new_string.gsub!(/\s#{word}\s/i, ' ') #middle
        new_string.sub!(/\s#{word}$/i, '') #end
      end

      #new_string.gsub!(/\s+/, ' ')

      new_string
    end

  end
end




