require 'minitest/autorun'
require 'enzymator'

class TestReduction < Minitest::Test

  def test_reduction_sum
    ary = (1..9).to_a
    expected = (1..9).to_a.reduce(:+)

    actual_explicit = Enzymator::Transformations::Foldable::Reduction.new({
      append: ->(acum, n) { acum + n }
    }).run_on(ary)

    actual_implicit = Enzymator::Transformations::Foldable::Reduction.new
    .run_on(ary)

    assert_equal expected, actual_explicit
    assert_equal expected, actual_implicit
  end

  def test_reduction_product
    ary = (1..9).to_a
    expected = (1..9).to_a.reduce(:*)

    absorbed = Enzymator::Transformations::Foldable::Reduction.new({
      append: ->(acum, n) { acum * n }
    }).run_on(ary)

    actual = Enzymator::Transformations::Foldable::Reduction.new({
      append: ->(acum, n) { acum * n },
      empty: 1
    }).run_on(ary)

    assert_equal 0, absorbed
    assert_equal expected, actual
  end

  def test_reduction_concat
    ary = (1..9).to_a.map { |n| [+n, -n] }
    expected = (1..9).to_a.map { |n| [+n, -n] }.reduce(:concat).to_a

    actual_explicit = Enzymator::Transformations::Foldable::Reduction.new({
      append: ->(acum, pair) { acum + pair },
    }).run_on(ary)

    actual_implicit = Enzymator::Transformations::Foldable::Reduction.new
    .run_on(ary)

    assert_equal expected, actual_explicit
    assert_equal expected, actual_implicit
  end

  def test_reduction_merge
    hashes = [ { 'a' => 1, 'b' => 2, 'c' => 3 }, { 'd' => 4 }, { 'e' => 5 } ]
    expected = { 'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5 }

    actual_explicit = Enzymator::Transformations::Foldable::Reduction.new({
      append: ->(acum, pair) { acum.merge pair },
      empty: { 'f' => 6 }
    }).run_on(hashes)

    actual_implicit = Enzymator::Transformations::Foldable::Reduction.new
    .run_on(hashes)

    assert_equal expected.merge({ 'f' => 6 }), actual_explicit
    assert_equal expected, actual_implicit
  end

end