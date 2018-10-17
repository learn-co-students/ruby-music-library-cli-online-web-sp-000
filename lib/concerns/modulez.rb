module Concerns::Findable

  def find_by_name(name)
    return_item = nil
      self.all.each do |item|
        if item.name == name
          return_item = item
        end
      end
    return_item
  end

  def find_or_create_by_name(name)
    if find_by_name(name) == nil
      new_item = self.create(name)
    else
      find_by_name(name)
    end
  end

  

end
