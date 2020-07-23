module Findable
  def find_by_name(given_name)
    self.all.detect {|element| element.name == given_name}
  end

  def find_or_create_by_name(name)
    match = find_by_name(name)
    match == nil ? self.create(name) : match
  end
end
