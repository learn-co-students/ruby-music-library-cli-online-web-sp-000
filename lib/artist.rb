class Artist
  attr_accessor :name; :genre

 @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    newArtist = Artist.new(name)
    newArtist.save
    newArtist
  end

  def songs
    @songs
  end

  def add_song(song)
    # assigns current artist to song's artist property
    song.artist = self if song.artist == nil
    songs << song if !songs.detect {|s| s.name == song.name}
  end

  def genres
    list = []
    songs.each do |s|
      # binding.pry
      list << s.genre.name if list.none?(s.genre.name)
    end
    list
  end
end
