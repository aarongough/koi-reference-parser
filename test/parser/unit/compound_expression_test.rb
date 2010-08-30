require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class SimpleExpressionTest < Test::Unit::TestCase

  include KoiReferenceParser

  test "should parse expression that contains function call as value" do
    tree = Parser.parse('test = blah(1) + 1')
    assert_kind_of Assignment, tree.elements.first.elements.last
    assert_kind_of Expression, tree.elements.first.elements.last.elements[2]
    assert_kind_of AdditiveExpression, tree.elements.first.elements.last.elements[2].elements.first
    assert_kind_of FunctionCall, tree.elements.first.elements.last.elements[2].elements.first.elements.first
  end
  
  test "should parse expression that contains sub-expression as value" do
    tree = Parser.parse('test = 2 * 3 * 2')
    assert_kind_of Assignment, tree.elements.first.elements.last
    assert_kind_of Expression, tree.elements.first.elements.last.elements[2]
    assert_kind_of MultitiveExpression, tree.elements.first.elements.last.elements[2].elements.first
    assert_kind_of IntegerLiteral, tree.elements.first.elements.last.elements[2].elements.first.elements[0]
    assert_kind_of MultiplicationOperator, tree.elements.first.elements.last.elements[2].elements.first.elements[1]
    assert_kind_of MultitiveExpression, tree.elements.first.elements.last.elements[2].elements.first.elements[2]
  end
  
  test "should parse expression that contains parenthesized sub-expression as value" do
    tree = Parser.parse('test = (2 * 3) * 2')
    assert_kind_of Assignment, tree.elements.first.elements.last
    assert_kind_of Expression, tree.elements.first.elements.last.elements[2]
    assert_kind_of MultitiveExpression, tree.elements.first.elements.last.elements[2].elements.first
    assert_kind_of Expression, tree.elements.first.elements.last.elements[2].elements.first.elements[0]
    assert_kind_of MultiplicationOperator, tree.elements.first.elements.last.elements[2].elements.first.elements[1]
    assert_kind_of IntegerLiteral, tree.elements.first.elements.last.elements[2].elements.first.elements[2]
  end

end