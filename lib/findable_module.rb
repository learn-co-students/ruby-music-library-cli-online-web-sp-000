module Concerns
  module Findable
    def find_by_name(name)
      all.detect{|s| s.name == name}
    end
    def find_or_create_by_name(name)
      if find_by_name(name) != nil
        find_by_name(name)
      else
        create(name)
      end
    end
  end
end
