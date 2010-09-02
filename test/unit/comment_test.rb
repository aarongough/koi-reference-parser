require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class CommentTest < Test::Unit::TestCase

  include KoiReferenceParser

  test "should parse comment" do
    tree = Parser.parse("# this is a comment\n")
    assert_kind_of Block, tree
    assert_equal 0, tree.elements.length
  end
  
  test "should parse comment with following statement" do
    tree = Parser.parse("# this is a comment\ntest = 1")
    assert_kind_of Block, tree
    assert_equal 1, tree.elements.length
  end
  
  test "should parse statement followed by comment" do
    tree = Parser.parse("test = 1\n# this is a comment")
    assert_kind_of Block, tree
    assert_equal 1, tree.elements.length
  end

end