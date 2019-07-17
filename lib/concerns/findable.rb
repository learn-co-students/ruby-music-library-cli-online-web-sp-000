module Concerns::Findable             #defines a module named Concerns::Findable
  def find_by_name(name)
  self.all.detect{|s| s.name == name}       #uses the .all method defined by the class to find an instance of the class by name.
end

def find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
end

end
