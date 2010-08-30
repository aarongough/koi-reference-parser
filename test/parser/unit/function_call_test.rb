require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class FunctionCallTest < Test::Unit::TestCase

  include MinKoi

  test "should parse function call with no arguments" do
    tree = Parser.parse('test()')
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of FunctionCall, tree.elements.first.elements.last
    assert_kind_of Identifier, tree.elements.first.elements.last.elements.first
  end
  
  test "should parse function call with identifier as argument" do
    tree = Parser.parse('test(blah)')
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of FunctionCall, tree.elements.first.elements.last
    assert_kind_of Identifier, tree.elements.first.elements.last.elements[0]
    assert_kind_of Expression, tree.elements.first.elements.last.elements[1]
  end
  
  test "should parse function call with multiple arguments" do
    tree = Parser.parse('test(blah, blah2)')
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of FunctionCall, tree.elements.first.elements.last
    assert_kind_of Identifier, tree.elements.first.elements.last.elements[0]
    assert_kind_of Expression, tree.elements.first.elements.last.elements[1]
    assert_kind_of Expression, tree.elements.first.elements.last.elements[2]
  end
  
  test "should parse function call with expression as argument" do
    tree = Parser.parse('test(1 * 2)')
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of FunctionCall, tree.elements.first.elements.last
    assert_kind_of Identifier, tree.elements.first.elements.last.elements[0]
    assert_kind_of Expression, tree.elements.first.elements.last.elements[1]
  end
  
  test "should parse function call with function call as argument" do
    tree = Parser.parse('test( call())')
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of FunctionCall, tree.elements.first.elements.last
    assert_kind_of Identifier, tree.elements.first.elements.last.elements[0]
    assert_kind_of Expression, tree.elements.first.elements.last.elements[1]
  end

end