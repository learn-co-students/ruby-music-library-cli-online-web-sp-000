module Concerns::Findable
  def find_by_name(name)
    self.all.each{|item| return item if item.name == name}
    return nil
  end

  def find_or_create_by_name(name)
    item = find_by_name(name)
    item == nil ? create(name) : item
  end
end
