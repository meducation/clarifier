require_relative 'test_helper'
require_relative 'test_docs'

module Clarifier

  class ClarifierNGramsTest < Minitest::Test

    def test_creates_2_word_n_grams_by_default
      ng = Clarifier::NGrams.new
      input = 'The quick brown fox jumped over the lazy dog.'
      expected = ['The quick', 'quick brown', 'brown fox', 'fox jumped', 'jumped over', 'over the', 'the lazy', 'lazy dog']
      assert_equal expected, ng.n_grams(input)
    end

    def test_creates_3_word_n_grams
      ng = Clarifier::NGrams.new
      input = 'The quick brown fox jumped over the lazy dog.'
      expected = ['The quick brown', 'quick brown fox', 'brown fox jumped', 'fox jumped over', 'jumped over the', 'over the lazy', 'the lazy dog']
      assert_equal expected, ng.n_grams(input, 3)
    end

  end
end
