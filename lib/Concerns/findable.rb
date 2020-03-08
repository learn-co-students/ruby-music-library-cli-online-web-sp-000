module Concerns
  module Findable
    def find_by_name(name)
      self.all.find {|object| object.name == name}
    end
    
    def find_or_create_by_name(name)
      selected_object = nil
      selected_object = self.find_by_name(name)
      if selected_object == nil
        selected_object = self.create(name)
      end
      selected_object
    end
  end
end