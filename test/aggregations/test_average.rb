require 'minitest/autorun'
require 'enzymator'

class TestAverage < Minitest::Test

  def test_average
    numbers = (1..10).to_a
    expected = (1..10).reduce(:+) / 10

    actual = Enzymator::Aggregations::Average.new.run_on(numbers)

    assert_equal expected, actual
  end

end