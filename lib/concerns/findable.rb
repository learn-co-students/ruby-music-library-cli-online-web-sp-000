module Concerns

  module Findable
    def find_by_name(x)
      self.all.detect {|i| i.name == x }
    end

    def find_or_create_by_name(x)
      self.find_by_name(x) || self.create(x)
    end
  end

end
