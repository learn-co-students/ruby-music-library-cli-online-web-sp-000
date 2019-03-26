module Concerns::Findable

  def self.find_by_name(name)
    all.detect { |a| a.name == name }
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) or self.create(song)
  end
end
