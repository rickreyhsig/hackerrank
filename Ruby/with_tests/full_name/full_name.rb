require "test/unit"

class FullName
  def full_name(first, *rest)
    fn = rest.unshift(first).join(' ')
  end
end

class TestFullName < Test::Unit::TestCase
  def test_full_name
    fni = FullName.new()
    assert_equal('Harsha Bhogle', fni.full_name('Harsha', 'Bhogle') )
    assert_equal('Pradeep Suresh Satyanarayana', fni.full_name('Pradeep', 'Suresh', 'Satyanarayana') )
    assert_equal('Horc G. M. Moon', fni.full_name('Horc', 'G.', 'M.', 'Moon') )
    assert_equal('Ricardo Stockmann Kreyhsig', fni.full_name('Ricardo', 'Stockmann', 'Kreyhsig') )
  end
end
