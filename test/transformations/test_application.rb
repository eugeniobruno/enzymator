require 'minitest/autorun'
require 'enzymator'

class TestApplication < Minitest::Test

  def test_application
    object = 26
    expected = 27

    actual = Enzymator::Transformations::Object::Application.new({
      function: ->(x) { x + 1 }
    }).run_on(object)

    assert_equal expected, actual
  end

end