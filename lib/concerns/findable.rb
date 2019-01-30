module Concerns::Findable
  def self.find_by_name(name)
    all.detect{ |element| element.name == name }
  end

  def self.find_or_create_by_name(name)
    all.find_by_name(name) || create(name)
  end

end
