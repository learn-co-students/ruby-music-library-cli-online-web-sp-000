module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def find_or_create_by_name(name)
    found = self.find_by_name(name)
    if found == nil
      found = self.create(name)
    else
    found
    end
  end
end