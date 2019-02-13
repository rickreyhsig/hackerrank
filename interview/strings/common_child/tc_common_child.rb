require_relative "common_child"
require "test/unit"

class TestCommonChild < Test::Unit::TestCase
    def test_simple
        c = CommonChild.new
        assert_equal(3, c.common_child('ABCD', 'ABDC'))
        assert_equal(2, c.common_child('HARRY', 'SALLY'))
        assert_equal(3, c.common_child('SHINCHAN', 'NOHARAAA'))
        assert_equal(0, c.common_child('AA', 'BB'))
    end

    def test_longer
        c = CommonChild.new
        assert_equal(15, c.common_child('WEWOUCUIDGCGTRMEZEPXZFEJWISRSBBSYXAYDFEJJDLEBVHHKS', 'FDAGCXGKCTKWNECHMRXZWMLRYUCOCZHJRRJBOAJOQJZZVUYXIC'))
    end
end
