require_relative 'test_helper'

module MESH
  describe 'Testing Clarifier::StopWords' do

    it 'should use a default English stopword set' do
      sw = Clarifier::StopWords.new
      input = 'The quick brown fox jumped over the lazy dog.'
      expected = 'quick brown fox jumped over lazy dog.'
      assert_equal expected, sw.clarify(input)
    end

    it 'should derive a stopword list from a document set' do

    end


  end

end