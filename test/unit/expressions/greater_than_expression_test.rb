require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class GreaterThanExpressionTest < Test::Unit::TestCase

  include KoiReferenceParser
  
  test "should parse simple 'greater than' expression with integers" do
    tree = Parser.parse('test = 1 > 1')
    assert_expression(tree, ComparativeExpression, GreaterThanOperator)
  end
  
  test "should parse simple 'greater than' expression with floats" do
    tree = Parser.parse('test = 1.0 > 1.0')
    assert_expression(tree, ComparativeExpression, GreaterThanOperator)
  end
  
  test "should parse simple 'greater than' expression with strings" do
    tree = Parser.parse('test = "1" > "1"')
    assert_expression(tree, ComparativeExpression, GreaterThanOperator)
  end
  
  test "should parse simple 'greater than' expression with identifiers" do
    tree = Parser.parse('test = test1 > test2')
    assert_expression(tree, ComparativeExpression, GreaterThanOperator)
  end
  
end