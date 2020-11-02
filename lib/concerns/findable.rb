module Concerns
  module Findable
    def find_by_name(search_name)
      self.all.detect do |s|
        s.name == search_name
      end
    end

    def find_or_create_by_name(search_name)
      self.find_by_name(search_name) == nil ? search_name = self.create(search_name) : self.find_by_name(search_name)
    end

  end
end
