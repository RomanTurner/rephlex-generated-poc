require_relative "../../../../test_helper"
require_relative "../views/components/hello"

class TestAccount < Minitest::Test
  include Phlex::Testing::Nokogiri::DocumentHelper

  def test_example
    output = render Users::Accounts::Components::Hello.new("Joel")
    assert_equal "Hello Joel", output.css("h1").text
  end
end
