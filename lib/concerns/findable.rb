module Concerns
  module Findable
    def find_by_name(name)
      all.find { |object| object.name == name }
    end

    def find_or_create_by_name(name)
      object = find_by_name(name)
      object = create(name) if object == nil
      object
    end
  end
end
