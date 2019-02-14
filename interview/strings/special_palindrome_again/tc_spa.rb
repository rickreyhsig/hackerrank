require_relative "spa"
require "test/unit"

class TestSpecialPalindrome < Test::Unit::TestCase
    def test_simple
        s = SpecialPalindrome.new
        assert_equal(3, s.substrCount(3, 'abc'))
        assert_equal(12, s.substrCount(8, 'mnonopoo'))
        assert_equal(7, s.substrCount(5, 'asasd'))
        assert_equal(10, s.substrCount(7, 'abcbaba'))
        assert_equal(10, s.substrCount(4, 'aaaa'))

    end
end
