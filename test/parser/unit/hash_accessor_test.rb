require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class HashAccessorTest < Test::Unit::TestCase

  include MinKoi

  test "assignment to hash key" do
    tree = Parser.parse('test[1] = 1')
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of HashAssignment, tree.elements.first.elements.first
    assert_kind_of Identifier, tree.elements.first.elements.first.elements.first
    assert_kind_of HashAccessorList, tree.elements.first.elements.first.elements[1]
    assert_kind_of HashAccessor, tree.elements.first.elements.first.elements[1].elements.first
    assert_equal 1, tree.elements.first.elements.first.elements[1].elements.length
  end
  
  test "assignment to a chain of hash key" do
    tree = Parser.parse('test[1][2][3] = 1')
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of HashAssignment, tree.elements.first.elements.first
    assert_kind_of Identifier, tree.elements.first.elements.first.elements.first
    assert_kind_of HashAccessorList, tree.elements.first.elements.first.elements[1]
    assert_kind_of HashAccessor, tree.elements.first.elements.first.elements[1].elements.first
    assert_equal 3, tree.elements.first.elements.first.elements[1].elements.length
  end
  
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