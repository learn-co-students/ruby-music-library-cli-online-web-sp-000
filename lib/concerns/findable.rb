module Concerns::Findable

# Do not call upon .self for this method when extending it
  def find_by_name(name)
    self.all.detect {|x| x.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
