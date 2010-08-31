require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class SyntaxNodeToHashTest < Test::Unit::TestCase

  include KoiReferenceParser

  test "should convert SyntaxNode to hash" do
    input = "test = 1"
    tree = Identifier.new(input, 0...4)
    hash = tree.to_hash
    assert_equal( {
      :elements => nil,
      :offset => 0,
      :name => "Identifier",
      :text_value => "test"
    }, hash )
  end
  
  test "should convert SyntaxNode to hash including elements" do
    input = "test = 1"
    tree = Assignment.new(input, 0...8, [
      Identifier.new(input, 0...4)
    ])
    hash = tree.to_hash
    built_hash = {
      :elements => nil,
      :offset => 0,
      :name => "Assignment",
      :text_value => "test = 1"
    }
    built_hash[:elements] = [
      {
      :elements => nil,
      :offset => 0,
      :name => "Identifier",
      :text_value => "test"
      }
    ]
    assert_equal( built_hash, hash )
  end
  

end