module Concerns
  module Findable
    def find_by_name(name_str)
      self.all.detect {|i| i.name == name_str}
    end
    
    def find_or_create_by_name(name_str)
      self.find_by_name(name_str)? self.find_by_name(name_str) : self.create(name_str)
    end
  end
end
    

# # rspec spec/008_findable_module_spec.rb
# # rspec spec/008_findable_module_spec.rb