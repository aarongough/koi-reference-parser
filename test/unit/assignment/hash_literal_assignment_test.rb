require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class HashLiteralAssignmentTest < Test::Unit::TestCase

  include KoiReferenceParser
  
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
  
end