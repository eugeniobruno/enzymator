require 'minitest/autorun'
require 'enzymator'

class TestJoin < Minitest::Test

  def test_join
    ary = [1, 2, [3, 4], [5], [6, [7, 8], 9]]
    expected = [1, 2, 3, 4, 5, 6, [7, 8], 9]
    actual = Enzymator::Transformations::Monad::Join.new.run_on(ary)

    assert_equal expected, actual
  end

end