require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class BooleanAssignmentTest < Test::Unit::TestCase

  include KoiReferenceParser
  
  test "assignment of boolean true" do
    tree = Parser.parse('test = true')
    assert_assigns_expression(TrueLiteral, nil, tree)
  end
  
  test "assignment of boolean false" do
    tree = Parser.parse('test = false')
    assert_assigns_expression(FalseLiteral, nil, tree)
  end
  
end