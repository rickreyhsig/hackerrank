require_relative "alternating_characters"
require "test/unit"

class TestAlternatingCharacters < Test::Unit::TestCase
    def test_simple
        a = AlternatingCharacters.new
        assert_equal(3, a.alternatingCharacters('AAAA'))
        assert_equal(4, a.alternatingCharacters('BBBBB'))
        assert_equal(0, a.alternatingCharacters('ABABABAB'))
        assert_equal(0, a.alternatingCharacters('BABABA'))
        assert_equal(4, a.alternatingCharacters('AAABBB'))
    end
end
