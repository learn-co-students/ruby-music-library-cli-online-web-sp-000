class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
     song_name = Song.new(name)
     song_name.save
     song_name
   end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def artist
      @artist
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self)
    end


end
