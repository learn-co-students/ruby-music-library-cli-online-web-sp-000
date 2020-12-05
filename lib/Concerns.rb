module Concerns
  module Findable

    def find_by_name(name)
      return_item = self.all.find do |item| item.name == name
      end
      return_item
    end

    def find_or_create_by_name(name)
      item = find_by_name(name)
      if  item != nil
        item
      else
        self.create(name)
      end
    end

  end
end
