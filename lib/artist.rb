class Artist < Song
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if @songs.include?(song) == false
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end
end
