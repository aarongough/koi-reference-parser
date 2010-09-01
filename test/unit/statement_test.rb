require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class StatementTest < Test::Unit::TestCase

  include KoiReferenceParser

  test "should parse statments on separate lines as separate" do
    tree = Parser.parse("test = 1\ntest = 1")
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements[0]
    assert_kind_of Statement, tree.elements[1]
  end
  
  test "should parse statements on same line separated by ';' as separate" do
    tree = Parser.parse("test = 1;test = 1")
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements[0]
    assert_kind_of Statement, tree.elements[1]
  end
  

end