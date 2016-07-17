require 'minitest/autorun'
require 'enzymator'

class AggregationTest < Minitest::Test

  def test_sum_numbers
    numbers = (1..1000).to_a
    # to sum the numbers, you can just do
    expected_sum = numbers.reduce(:+)

    # but where's the fun in that...
    actual_sum = Enzymator::Aggregation.new({
      null_result:      lambda { 0 },
      map:              lambda { |n| n },
      reduce:           lambda { |acum, n, _| acum + n },
    }).run_on(numbers)

    assert_equal expected_sum, actual_sum
  end

  def test_count_words
    # Let's follow the herd of MapReduce preachers and count some words.
    words = %w(Hey! Are you the horse from Horsing Around? The word is you got fat.)

    # There is no built-in one-message-one-argument way this time...
    expected_hash = {
      'Hey!'    => 1,
      'Are'     => 1,
      'you'     => 2,
      'the'     => 1,
      'horse'   => 1,
      'from'    => 1,
      'Horsing' => 1,
      'Around?' => 1,
      'The'     => 1,
      'word'    => 1,
      'is'      => 1,
      'got'     => 1,
      'fat.'    => 1,
    }

    aggregation = Enzymator::Aggregation.new({
      null_result:      lambda { Hash.new(0) },
      map:              lambda { |w| w },
      reduce:           lambda { |acum, w, _| acum[w] += 1; acum }
    }).run_on!(words)
    # notice the bang

    actual_hash = aggregation.result

    assert_equal expected_hash, actual_hash

    # I'm thinking 'the' and 'The' should count as one word. Total case-insensitivity
    expected_hash['the'] = 2
    expected_hash.delete('The')
    expected_hash = expected_hash.map { |k, v| { k.downcase => v } }.reduce(&:merge)

    aggregation.patch_config( map: lambda { |w| w.downcase } )
    .run_on!(words)

    actual_hash = aggregation.result

    assert_equal expected_hash, actual_hash

  end

end