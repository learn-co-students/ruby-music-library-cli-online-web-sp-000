module Concerns::Findable

  class MusicImporter
    def initialize(filename)
    end
  end

  def find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def find_or_create_by_name(name)
    if !find_by_name(name)
      self.create(name)
    else
      find_by_name(name)
    end
  end
end
