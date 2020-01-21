# Implement a generic #find_or_create_by_name method that uses the .all method defined by the class to find an instance of the class by name and to create a new instance if a match is not found.


module Concerns::Findable
  # Implement a generic #find_by_name method that uses the .all method
  # defined by the class to find an instance of the class by name.
  def find_by_name(name)
    self.all.find {|i| i.name == name}
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

end
