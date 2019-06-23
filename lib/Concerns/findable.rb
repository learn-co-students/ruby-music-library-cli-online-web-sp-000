module Concerns::Findable
  def find_by_name(name)
    result = nil
    self.all.each do |item|
      if item.name == name
        result = item
      end
    end
    result
  end
  def find_or_create_by_name(name)
    result = find_by_name(name)
    if result == nil
      result = self.create(name)
    end
    result
  end
end
