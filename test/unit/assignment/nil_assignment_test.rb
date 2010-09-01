require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class NilAssignmentTest < Test::Unit::TestCase

  include KoiReferenceParser
  
  test "assignment of nil" do
    tree = Parser.parse('test = nil')
    assert_assigns_expression(NilLiteral, nil, tree)
  end
  
end