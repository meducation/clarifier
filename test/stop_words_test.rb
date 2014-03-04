require_relative 'test_helper'
require_relative 'test_docs'

module Clarifier

  class ClarifierStopWordsTest < Minitest::Test


    def test_use_default_english_stopword_set
      sw = Clarifier::StopWords.new
      input = 'The quick brown fox jumped over the lazy dog.'
      expected = 'quick brown fox jumped over lazy dog.'
      assert_equal expected, sw.clarify(input)
    end

    def test_use_the_selected_stopword_list
      skip
    end

    def test_use_an_array_of_stopwords_if_provided
      sw = Clarifier::StopWords.new(%w(quick brown lazy))
      input = 'The quick brown fox jumped over the lazy dog.'
      expected = 'The fox jumped over the dog.'
      assert_equal expected, sw.clarify(input)
    end

    def test_use_an_empty_array_of_stopwords_if_provided
      sw = Clarifier::StopWords.new([])
      input = 'The quick brown fox jumped over the lazy dog.'
      expected = 'The quick brown fox jumped over the lazy dog.'
      assert_equal expected, sw.clarify(input)
    end

    def test_derive_a_stopword_list_from_a_document_set
      sw = Clarifier::StopWords.new([])
      sw.train(StopWordsTestDocs.docs)
      expected = %w(we are to the for a of and then is at one time with this that have here or in which can by you it these when on so your has be not if more some as there they)
      assert_equal expected, sw.stopwords
    end

  end
end
