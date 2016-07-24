require 'minitest/autorun'
require 'enzymator'

class TestCount < Minitest::Test

  def test_count
    numbers = (1..10).to_a
    expected = numbers.length

    actual = Enzymator::Aggregations::Count.new.run_on(numbers)

    assert_equal expected, actual
  end

end