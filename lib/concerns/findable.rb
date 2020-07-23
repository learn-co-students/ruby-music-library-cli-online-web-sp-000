module Concerns::Findable
  def find_by_name(name)
    self.all.find {|obj| obj.name == name}
  end

  def find_or_create_by_name(name)
    obj = self.find_by_name(name)
    obj = self.create(name) if obj.nil?
    obj
  end

  def create(name)
    new_obj = self.new(name)
    new_obj.save
    new_obj
  end

end
