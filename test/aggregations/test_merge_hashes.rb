require 'minitest/autorun'
require 'enzymator'

class TestMergeHashes < Minitest::Test

  def test_merge_hashes
    hashes = [ { 'a' => 1, 'b' => 2, 'c' => 3 }, { 'd' => 4 }, { 'e' => 5 } ]
    expected = { 'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5 }

    actual = Enzymator::Aggregations::MergeHashes.new.run_on(hashes)

    assert_equal expected, actual
  end

end