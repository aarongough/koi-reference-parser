require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class AssignmentTest < Test::Unit::TestCase

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
  
  test "assignment of float" do
    tree = Parser.parse('test = 99.0009')
    assert_assigns_expression(FloatLiteral, '99.0009', tree)
  end
  
  test "assignment of explicitly positive float" do
    tree = Parser.parse('test = +99.0009')
    assert_assigns_expression(FloatLiteral, '+99.0009', tree)
  end
  
  test "assignment of explicitly negative float" do
    tree = Parser.parse('test = -99.0009')
    assert_assigns_expression(FloatLiteral, '-99.0009', tree)
  end
  
  test "assignment of string" do
    tree = Parser.parse('test = "test_string"')
    assert_assigns_expression(StringLiteral, '"test_string"', tree)
  end
  
  test "assignment of string containing escaped quote" do
    tree = Parser.parse('test = "test_\"string"')
    assert_assigns_expression(StringLiteral, '"test_\"string"', tree)
  end
  
  test "assignment of function definition" do
    tree = Parser.parse('test = function(args) blah = 1 end')
    assert_assigns(FunctionDefinition, nil, tree)
  end
  
  test "assignment of result of function call" do
    tree = Parser.parse('test = function(args)')
    assert_assigns_expression(FunctionCall, nil, tree)
  end
  
  test "assignment of nil" do
    tree = Parser.parse('test = nil')
    assert_assigns_expression(NilLiteral, nil, tree)
  end
  
  test "assignment of boolean true" do
    tree = Parser.parse('test = true')
    assert_assigns_expression(TrueLiteral, nil, tree)
  end
  
  test "assignment of boolean false" do
    tree = Parser.parse('test = false')
    assert_assigns_expression(FalseLiteral, nil, tree)
  end
  
  test "assignment of empty hash literal" do
    tree = Parser.parse('test = {}')
    assert_assigns(HashLiteral, nil, tree)
  end
  
  test "assignment of hash literal with single key-value pair" do
    tree = Parser.parse('test = { 1 => 2 }')
    assert_assigns(HashLiteral, nil, tree)
  end
  
  test "assignment of hash literal with 2 key-value pairs" do
    tree = Parser.parse('test = { 1 => 2, 2 => 2 }')
    assert_assigns(HashLiteral, nil, tree)
  end
  
  test "assignment of hash literal with 3 key-value pairs" do
    tree = Parser.parse('test = { 1 => 2, 2 => 2, 3 => 2 }')
    assert_assigns(HashLiteral, nil, tree)
  end
  
  private
  
    def assert_assigns(node_type, value, tree)
      assert_kind_of Block, tree
      assert_kind_of Statement, tree.elements.last
      assert_kind_of Assignment, tree.elements.last.elements.last
      assert_kind_of Identifier, tree.elements.last.elements.last.elements[0]
      assert_kind_of AssignmentOperator, tree.elements.last.elements.last.elements[1]
      assert_kind_of node_type, tree.elements.last.elements.last.elements[2]
      assert_equal value, tree.elements.last.elements.last.elements[2].text_value unless(value.nil?)
    end
    
    def assert_assigns_expression(node_type, value, tree)
      assert_kind_of Block, tree
      assert_kind_of Statement, tree.elements.last
      assert_kind_of Assignment, tree.elements.last.elements.last
      assert_kind_of Identifier, tree.elements.last.elements.last.elements[0]
      assert_kind_of AssignmentOperator, tree.elements.last.elements.last.elements[1]
      assert_kind_of Expression, tree.elements.last.elements.last.elements[2]
      assert_kind_of node_type, tree.elements.last.elements.last.elements[2].elements.first
      assert_equal value, tree.elements.last.elements.last.elements[2].elements.first.text_value unless(value.nil?)
    end

end