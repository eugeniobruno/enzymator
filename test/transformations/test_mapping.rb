require 'minitest/autorun'
require 'enzymator'

class TestMapping < Minitest::Test

  def test_map
    ary = (1..9).to_a
    expected = ary.map { |n| n + 1 }
    actual = Enzymator::Transformations::Functor::Mapping.new({
      map: ->(n) { n + 1 }
    }).run_on(ary)

    assert_equal expected, actual
  end

end