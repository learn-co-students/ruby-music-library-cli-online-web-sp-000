module Concerns

  module Findable
    def find_by_name(name)
      self.all.find {|e| return e if e.name == name}
    end

    def find_or_create_by_name(name)
      if e = find_by_name(name)
        e
      else
        create(name)
      end
    end
  end

end
