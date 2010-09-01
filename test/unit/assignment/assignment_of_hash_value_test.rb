require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class AssignmentOfHashValueTest < Test::Unit::TestCase

  include KoiReferenceParser
  
  test "assignment of hash key" do
    tree = Parser.parse('test = test[1]')
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of Assignment, tree.elements.first.elements.first
    assert_kind_of Identifier, tree.elements.first.elements.first.elements[0]
    assert_kind_of Expression, tree.elements.first.elements.first.elements[2]
    assert_kind_of HashAccess, tree.elements.first.elements.first.elements[2].elements.first
    assert_kind_of Identifier, tree.elements.first.elements.first.elements[2].elements.first.elements[0]
    assert_kind_of HashAccessorList, tree.elements.first.elements.first.elements[2].elements.first.elements[1]
  end
  
end