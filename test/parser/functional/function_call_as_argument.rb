require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'test_helper.rb'))

class FunctionCallAsArgumentTest < Test::Unit::TestCase

  include KoiReferenceParser
  
  test "should parse statement with function call as argument" do
    assert_nothing_raised do
      Parser.parse(<<-EOD)
      
        print( to_string( 1 ))
        
      EOD
    end
  end

end