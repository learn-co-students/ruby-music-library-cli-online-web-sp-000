module Concerns::Findable

  def find_by_name(name)
    self.all.detect{ |song| song.name == name }
  end

  def find_or_create_by_name(name)
    the_song = self.find_by_name(name)
    if the_song == nil
      self.create(name)
    else
      the_song
    end
  end
end
