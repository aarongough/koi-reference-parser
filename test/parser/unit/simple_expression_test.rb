require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class SimpleExpressionTest < Test::Unit::TestCase

  include KoiReferenceParser

  ###############
  # ADDITION

  test "should parse simple addition expression with integers" do
    tree = Parser.parse('test = 1 + 1')
    assert_expression(tree, AdditionOperator)
  end
  
  test "should parse simple addition expression with floats" do
    tree = Parser.parse('test = 1.0 + 1.0')
    assert_expression(tree, AdditionOperator)
  end
  
  test "should parse simple addition expression with strings" do
    tree = Parser.parse('test = "1" + "1"')
    assert_expression(tree, AdditionOperator)
  end
  
  test "should parse simple addition expression with identifiers" do
    tree = Parser.parse('test = test1 + test2')
    assert_expression(tree, AdditionOperator)
  end
  
  
  ###############
  # SUBTRACTION
  
  test "should parse simple subtraction expression with integers" do
    tree = Parser.parse('test = 1 - 1')
    assert_expression(tree, SubtractionOperator)
  end
  
  test "should parse simple subtraction expression with floats" do
    tree = Parser.parse('test = 1.0 - 1.0')
    assert_expression(tree, SubtractionOperator)
  end
  
  test "should parse simple subtraction expression with strings" do
    tree = Parser.parse('test = "1" - "1"')
    assert_expression(tree, SubtractionOperator)
  end
  
  test "should parse simple subtraction expression with identifiers" do
    tree = Parser.parse('test = test1 - test2')
    assert_expression(tree, SubtractionOperator)
  end
  
  
  ###############
  # MULTIPLICATION
  
  test "should parse simple multiplication expression with integers" do
    tree = Parser.parse('test = 1 * 1')
    assert_expression(tree, MultiplicationOperator)
  end
  
  test "should parse simple multiplication expression with floats" do
    tree = Parser.parse('test = 1.0 * 1.0')
    assert_expression(tree, MultiplicationOperator)
  end
  
  test "should parse simple multiplication expression with strings" do
    tree = Parser.parse('test = "1" * "1"')
    assert_expression(tree, MultiplicationOperator)
  end
  
  test "should parse simple multiplication expression with identifiers" do
    tree = Parser.parse('test = test1 * test2')
    assert_expression(tree, MultiplicationOperator)
  end
  
  
  ###############
  # DIVISION
  
  test "should parse simple division expression with integers" do
    tree = Parser.parse('test = 1 / 1')
    assert_expression(tree, DivisionOperator)
  end
  
  test "should parse simple division expression with floats" do
    tree = Parser.parse('test = 1.0 / 1.0')
    assert_expression(tree, DivisionOperator)
  end
  
  test "should parse simple division expression with strings" do
    tree = Parser.parse('test = "1" / "1"')
    assert_expression(tree, DivisionOperator)
  end
  
  test "should parse simple division expression with identifiers" do
    tree = Parser.parse('test = test1 / test2')
    assert_expression(tree, DivisionOperator)
  end
  
  
  ###############
  # EQUALITY
  
  test "should parse simple equality expression with integers" do
    tree = Parser.parse('test = 1 == 1')
    assert_expression(tree, EqualityOperator)
  end
  
  test "should parse simple equality expression with floats" do
    tree = Parser.parse('test = 1.0 == 1.0')
    assert_expression(tree, EqualityOperator)
  end
  
  test "should parse simple equality expression with strings" do
    tree = Parser.parse('test = "1" == "1"')
    assert_expression(tree, EqualityOperator)
  end
  
  test "should parse simple equality expression with identifiers" do
    tree = Parser.parse('test = test1 == test2')
    assert_expression(tree, EqualityOperator)
  end
  
  
  ###############
  # INEQUALITY
  
  test "should parse simple inequality expression with integers" do
    tree = Parser.parse('test = 1 != 1')
    assert_expression(tree, InequalityOperator)
  end
  
  test "should parse simple inequality expression with floats" do
    tree = Parser.parse('test = 1.0 != 1.0')
    assert_expression(tree, InequalityOperator)
  end
  
  test "should parse simple inequality expression with strings" do
    tree = Parser.parse('test = "1" != "1"')
    assert_expression(tree, InequalityOperator)
  end
  
  test "should parse simple inequality expression with identifiers" do
    tree = Parser.parse('test = test1 != test2')
    assert_expression(tree, InequalityOperator)
  end
  
  
  ###############
  # GREATER THAN
  
  test "should parse simple 'greater than' expression with integers" do
    tree = Parser.parse('test = 1 > 1')
    assert_expression(tree, GreaterThanOperator)
  end
  
  test "should parse simple 'greater than' expression with floats" do
    tree = Parser.parse('test = 1.0 > 1.0')
    assert_expression(tree, GreaterThanOperator)
  end
  
  test "should parse simple 'greater than' expression with strings" do
    tree = Parser.parse('test = "1" > "1"')
    assert_expression(tree, GreaterThanOperator)
  end
  
  test "should parse simple 'greater than' expression with identifiers" do
    tree = Parser.parse('test = test1 > test2')
    assert_expression(tree, GreaterThanOperator)
  end
  
  
  ###############
  # LESS THAN
  
  test "should parse simple 'less than' expression with integers" do
    tree = Parser.parse('test = 1 < 1')
    assert_expression(tree, LessThanOperator)
  end
  
  test "should parse simple 'less than' expression with floats" do
    tree = Parser.parse('test = 1.0 < 1.0')
    assert_expression(tree, LessThanOperator)
  end
  
  test "should parse simple 'less than' expression with strings" do
    tree = Parser.parse('test = "1" < "1"')
    assert_expression(tree, LessThanOperator)
  end
  
  test "should parse simple 'less than' expression with identifiers" do
    tree = Parser.parse('test = test1 < test2')
    assert_expression(tree, LessThanOperator)
  end
  
  
  private
  
    def assert_expression(tree, operator = nil)
      assert_kind_of Block, tree
      assert_kind_of Statement, tree.elements.first
      assert_kind_of Assignment, tree.elements.first.elements.last
      assert_kind_of Identifier, tree.elements.first.elements.last.elements[0]
      assert_kind_of AssignmentOperator, tree.elements.first.elements.last.elements[1]
      assert_kind_of Expression, tree.elements.first.elements.last.elements[2]
      assert_equal 3, tree.elements.first.elements.last.elements[2].elements.first.elements.size
      assert_kind_of operator, tree.elements.first.elements.last.elements[2].elements.first.elements[1] unless(operator.nil?)
    end

end