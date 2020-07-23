class Artist < Music
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    songs.collect{ |song| song.genre }.uniq
  end

end
