module KoiReferenceParser

  class Treetop::Runtime::SyntaxNode
  
    def to_hash(parent = nil)
      hash = {}
      hash[:parent] = parent
      hash[:offset] = self.interval.first
      hash[:text] = self.text_value
      hash[:name] = self.class.name.split("::").last
      unless( self.elements.nil? )
        hash[:elements] = self.elements.map {|element| element.to_hash(hash) }
      else
        hash[:elements] = nil
      end
      return hash
    end
  
  end

end