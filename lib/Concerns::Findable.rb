module Concerns::Findable
  
  def find_by_name(to_find)
    to_return = ""
    self.all.each do |instance|
      if instance.name == to_find
        to_return = instance
      else
        to_return = nil
      end
    end
    to_return
  end
  
  def find_or_create_by_name(to_find_or_create)
    if find_by_name(to_find_or_create) == nil || find_by_name(to_find_or_create) == ""
     create(to_find_or_create)
    else
      find_by_name(to_find_or_create)
    end
  end
  
  
end