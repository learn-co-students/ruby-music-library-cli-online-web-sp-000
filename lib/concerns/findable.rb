module Concerns
  module Findable
    def find_by_name(name)
      self.all.find do |attribute|
        attribute.name == name
      end
    end

    def find_or_create_by_name(name)
      if find_by_name(name) != nil
        find_by_name(name)
      else
        self.create(name)
      end
    end

    def create(name)
      new_instance = self.new(name)
      new_instance.save
      new_instance
    end

  end
end 
