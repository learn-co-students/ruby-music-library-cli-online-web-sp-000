class Song
  attr_accessor :name, :genre, :artist
  #attr_reader :artist#, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def artist=(artist)
    if artist
      @artist = artist
      artist.add_song(self)
    end

  end

  def genre=(genre)
    if genre
      @genre = genre
      genre.add_song(self)

      # if artist
      #   genre.artist
      # end
    end
  end

end
