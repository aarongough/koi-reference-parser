require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class FloatAssignmentTest < Test::Unit::TestCase

  include KoiReferenceParser
  
  test "assignment of float" do
    tree = Parser.parse('test = 99.0009')
    assert_assigns_expression(FloatLiteral, '99.0009', tree)
  end
  
  test "assignment of explicitly positive float" do
    tree = Parser.parse('test = +99.0009')
    assert_assigns_expression(FloatLiteral, '+99.0009', tree)
  end
  
  test "assignment of explicitly negative float" do
    tree = Parser.parse('test = -99.0009')
    assert_assigns_expression(FloatLiteral, '-99.0009', tree)
  end
  
end