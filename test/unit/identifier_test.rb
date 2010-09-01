require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class FunctionCallTest < Test::Unit::TestCase

  include KoiReferenceParser

  test "should parse all lowercase identifier" do
    tree = Parser.parse('test = "test"')
    assert_identifier(tree)
  end

  test "should parse identifier with trailing numeral" do
    tree = Parser.parse('test1 = "test"')
    assert_identifier(tree)
  end
  
  test "should parse identifier with leading capital letter" do
    tree = Parser.parse('Test = "test"')
    assert_identifier(tree)
  end
  
  test "should parse identifier that contains an underscore" do
    tree = Parser.parse('test_test = "test"')
    assert_identifier(tree)
  end
  
  test "should parse single character identifier" do
    tree = Parser.parse('x = "test"')
    assert_identifier(tree)
  end
  
  test "should parse identifier with leading $" do
    tree = Parser.parse('$test = "test"')
    assert_identifier(tree)
  end

end