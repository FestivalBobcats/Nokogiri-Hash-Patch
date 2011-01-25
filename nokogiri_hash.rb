module Nokogiri::XML
  
  class Document
    
    def to_hash
      self.root.element? ? self.root.to_hash : {self.root.name => self.root.text}
    end
    
  end
  
  class Element
  
    def to_hash
      { self.name => self.collect_attributes }
    end
  
    def collect_attributes
      arr = []
      self.children.each do |child|
        next if child.name == 'text'
        hash = {}
        if child.element? && child.children.length > 1
          hash[child.name] = child.collect_attributes
        else
          hash[child.name] = child.text.strip
        end
        arr << hash
      end
      arr
    end
    
  end
  
end