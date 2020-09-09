module Concerns
  module Findable
  
    def find_by_name(name)
      all.find {|item| item.name == name}
    end
  
    def find_or_create_by_name(name)
      item = find_by_name(name)
      item.nil? ? create(name) : item
    end

  end
  
end