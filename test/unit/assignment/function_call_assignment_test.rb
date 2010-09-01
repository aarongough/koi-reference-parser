require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class FunctionCallAssignmentTest < Test::Unit::TestCase

  include KoiReferenceParser
  
  test "assignment of result of function call" do
    tree = Parser.parse('test = function(args)')
    assert_assigns_expression(FunctionCall, nil, tree)
  end
  
end