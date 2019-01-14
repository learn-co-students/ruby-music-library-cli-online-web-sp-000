module Concerns::Findable

  def find_by_name(name)
    self.all.find {|obj| obj.name == name}
  end

  def find_or_create_by_name(name)
    obj = self.find_by_name(name)
    if !obj
      obj = self.create(name)
    end
    obj
  end
end
