module Concerns::HasManySongs
  def add_song(song, own_name)
    @songs << song unless @songs.include?(song)
    song.send("#{own_name}=", self) unless song.send(own_name)
  end

  def through_songs_has_many(objects)
    @songs.map(&objects).uniq
  end
end
