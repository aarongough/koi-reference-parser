require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class SimpleProgramTest < Test::Unit::TestCase

  include KoiReferenceParser
  
  test "should parse simple program with 'if' flow control" do
    assert_nothing_raised do
      Parser.parse(<<-EOD)
      
        test = 1
      
        if(test == 1)
          test = "yay"
        end
        
      EOD
    end
  end
  
  test "should parse simple program with 'unless' flow control" do
    assert_nothing_raised do
      Parser.parse(<<-EOD)
      
        test = 1
      
        unless(test == 1)
          test = "yay"
        end
        
      EOD
    end
  end

end