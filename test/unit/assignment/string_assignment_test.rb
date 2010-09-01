require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class StringAssignmentTest < Test::Unit::TestCase

  include KoiReferenceParser
  
  test "assignment of string" do
    tree = Parser.parse('test = "test_string"')
    assert_assigns_expression(StringLiteral, '"test_string"', tree)
  end
  
  test "assignment of string containing escaped quote" do
    tree = Parser.parse('test = "test_\"string"')
    assert_assigns_expression(StringLiteral, '"test_\"string"', tree)
  end
  
end