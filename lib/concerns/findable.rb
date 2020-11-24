module Concerns::Findable
  #class methods
    def find_by_name(name)
      all.find { |instance| instance.name == name }
    end

    def find_or_create_by_name(name)
      if find_by_name(name) != nil
        find_by_name(name)
      else
        create(name)
      end
    end

end
