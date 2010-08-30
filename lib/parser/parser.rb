class Parser

  require 'treetop'
  Treetop.load(File.expand_path(File.join(File.dirname(__FILE__), 'min-koi.treetop')))
  @@parser = MinKoiParser.new
  
  def self.parse(data)
    tree = @@parser.parse(data)
    
    if(tree.nil?)
      if( data.length > 80 )
        error_detail = "\n\n" + data.slice(@@parser.index - 120, 80).gsub("\n", ";")
        error_detail += "\n" + data.slice(@@parser.index - 40, 80).gsub("\n", ";")
        error_detail += "\n" + " "*40 + "^\n"
      else
        error_detail = "\n\n" + data.gsub("\n", ";")
        error_detail += "\n" + " " * @@parser.index + "^\n"
      end
      raise ParseError, "Parse error at index: #{@@parser.index}#{error_detail}"
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
      root_node.elements.delete_if{|node| node.class.name == "MinKoi::Whitespace" }
      root_node.elements.each {|node| self.clean_whitespace(node) }
    end

end