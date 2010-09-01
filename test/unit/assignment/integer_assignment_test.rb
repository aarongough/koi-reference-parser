require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class IntegerAssignmentTest < Test::Unit::TestCase

  include KoiReferenceParser
  
  test "assignment of integer" do
    tree = Parser.parse('test = 1')
    assert_assigns_expression(IntegerLiteral, '1', tree)
  end
  
  test "assignment of explicitly positive integer" do
    tree = Parser.parse('test = +1')
    assert_assigns_expression(IntegerLiteral, '+1', tree)
  end
  
  test "assignment of explicitly negative integer" do
    tree = Parser.parse('test = -1')
    assert_assigns_expression(IntegerLiteral, '-1', tree)
  end
  
end