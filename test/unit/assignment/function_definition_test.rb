require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class FunctionDefinitionAssignmentTest < Test::Unit::TestCase

  include KoiReferenceParser
  
  test "assignment of function definition" do
    tree = Parser.parse('test = function(args) blah = 1 end')
    assert_assigns(FunctionDefinition, nil, tree)
  end
  
end