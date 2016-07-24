require 'minitest/autorun'
require 'enzymator'

class TestSum < Minitest::Test

  def test_sum
    numbers = (1..10).to_a
    expected = (1..10).reduce(:+)

    actual = Enzymator::Aggregations::Sum.new.run_on(numbers)

    assert_equal expected, actual
  end

end