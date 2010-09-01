class Parser

  require 'treetop'
  Treetop.load(File.expand_path(File.join(File.dirname(__FILE__), 'koi-reference-parser.treetop')))
  @@parser = KoiReferenceParserParser.new
  
  def self.parse(data)
    tree = @@parser.parse(data)
    
    if(tree.nil?)
      raise ParseError, "Parse error at offset: #{@@parser.index}"
    end
    
    # clean up the tree by removing all nodes of default type 'SyntaxNode'
    self.clean_tree(tree)
    
    # clean up the tree further by removing all whitespace nodes
    self.clean_whitespace(tree)
    return tree
  end
  
  private
  
    def self.clean_tree(root_node)
      return if(root_node.elements.nil?)
      root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
      root_node.elements.each {|node| self.clean_tree(node) }
    end
    
    def self.clean_whitespace(root_node)
      return if(root_node.elements.nil?)
      root_node.elements.delete_if{|node| node.class.name == "KoiReferenceParser::Whitespace" }
      root_node.elements.each {|node| self.clean_whitespace(node) }
    end

end