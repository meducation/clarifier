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

    def test_derive_a_stopword_list_from_a_document_set_with_a_threshold
      sw = Clarifier::StopWords.new([])
      sw.train(StopWordsTestDocs.docs, 0.2)
      expected = %w(today we are going to discuss about the heart disease first for a run of concept and then we'll see what is between but at actually three concepts number one should special type whole time with people magic this an class workers that have up infection mission let's take our book bad give here or really back in which end bikini can inside them does especially by let me tell you particular produced who it don't know occurs because these dot part i when grow on its free political so hard out air your into that's true indeed talking right now has be across done must not go girl did if more supreme some over pretty friend like as bed system next their it's working think will start doesn't off there area present from good they stop him those diagram news red blood cell size cells regular he caused either environment two examples even pick way his side years easy however test many again chronic body were peers six having work tonight defined high loss jeans term process involves nothing help yeah get put world getting I'm waking doing us how lives living I do arm almost things same such close life hands you're just possible they're gonna happen down choose other rest changed tend little bit want car look mom looking kids kinda each she's got leg trying very quickly thing anything sorta yet case use only nineteen seventy medical been school medicine center health access patients proud last we're near new eighty nine group question towards complicated sometimes called able consistent too goes different both say he's all bodies physiology personal eyes no person until past within conditions would point come levels identify essential court well state act another against sort own view i'll refer make important under sir challenge face understanding uh... might began critical much sixty minutes sells understand week talk study hopefully lecture why won't live long without normal kidney chapter gross aspects differences fluid thought talked was created lot quite means show may block blue box around you'll remember low cast nerve signal four cardiac muscle contract yes action brains am could knowing always keep difficult general excess somehow sure left ask after pass basically said involved my young become fine spreading I'll through change maybe okay research most where buildings sections example find terrible cold coast something seeing moving mention boy fibers clearly underneath nuclei middle better try nice ah... took closely also bridge jason contraction ever ice had top trailer behind press didn't realize later seven brain hook surgery spinal cord)
      assert_equal expected, sw.stopwords
    end

    def test_incrementally_derive_a_stopword_list_from_docs
      skip
    end

  end
end
