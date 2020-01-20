# Implement a generic #find_or_create_by_name method that uses the .all method defined by the class to find an instance of the class by name and to create a new instance if a match is not found.


module Concerns::Findable
  # Implement a generic #find_by_name method that uses the .all method
  # defined by the class to find an instance of the class by name.
  def self.find_by_name(name)
    Class.all.find {|i| i.name == name}
  end
end

# How it's written in Song
# def self.find_by_name(title)
  # @@all.find {|song| song.name == title}
# end
