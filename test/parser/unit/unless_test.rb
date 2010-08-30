require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class UnlessTest < Test::Unit::TestCase

  include MinKoi

  test "should parse unless statement" do
    tree = Parser.parse("unless(1 == 1)\n test = 1\nend")
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of Unless, tree.elements.first.elements.first
    assert_kind_of Expression, tree.elements.first.elements.first.elements.first
    assert_kind_of Block, tree.elements.first.elements.first.elements.last
  end
  
  test "should parse single line unless statement" do
    tree = Parser.parse("unless(1 == 1) test = 1; end")
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of Unless, tree.elements.first.elements.first
    assert_kind_of Expression, tree.elements.first.elements.first.elements.first
    assert_kind_of Block, tree.elements.first.elements.first.elements.last
  end

end