module Concerns::Findable

  def find_by_name(name)
    self.all.find { |type| type.name == name }
  end

  def find_or_create_by_name(name)
    found_item = self.find_by_name(name)
    if found_item.nil?
      self.create(name)
    else
      return found_item
    end
  end

end
