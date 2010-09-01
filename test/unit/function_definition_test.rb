require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class FunctionDefinitionTest < Test::Unit::TestCase

  include KoiReferenceParser

  test "should parse function definition including it's statements" do
    tree = Parser.parse("test = function(args)\n  teest1 = 1\n  test2 = 2\nend")
    assert_kind_of Block, tree
    assert_kind_of Statement, tree.elements.first
    assert_kind_of Assignment, tree.elements.first.elements.first
    assert_kind_of FunctionDefinition, tree.elements.first.elements.first.elements.last
    assert_kind_of Identifier, tree.elements.first.elements.first.elements.last.elements.first
    assert_kind_of Block, tree.elements.first.elements.first.elements.last.elements.last
    assert_kind_of Statement, tree.elements.first.elements.first.elements.last.elements.last.elements[0]
    assert_kind_of Statement, tree.elements.first.elements.first.elements.last.elements.last.elements[1]
  end

end