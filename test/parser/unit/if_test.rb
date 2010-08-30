require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class IfTest < Test::Unit::TestCase

  include KoiReferenceParser

  test "should parse if statement" do
    tree = Parser.parse("if(1 == 1)\n test = 1\nend")
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of If, tree.elements.first.elements.first
    assert_kind_of Expression, tree.elements.first.elements.first.elements.first
    assert_kind_of Block, tree.elements.first.elements.first.elements.last
  end
  
  test "should parse single line if statement" do
    tree = Parser.parse("if(1 == 1) test = 1; end")
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of If, tree.elements.first.elements.first
    assert_kind_of Expression, tree.elements.first.elements.first.elements.first
    assert_kind_of Block, tree.elements.first.elements.first.elements.last
  end

end