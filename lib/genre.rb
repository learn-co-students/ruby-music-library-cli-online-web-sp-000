class Genre

  extend Concerns::Findable

  attr_accessor :name, :song, :artist

  @@all = []

  def initialize(name)
    @name = name

    @songs = []
  end

def songs
  @songs
end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(genre)
    genre  = self.new(genre)
    genre.save
    genre
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    genres_artists = []
    songs.map {|song| genres_artists << song.artist}
    genres_artists.uniq
  end

end
