class Genre

  attr_accessor :name, :songs

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

  def self.create(genre)
    genre = self.new(genre)
    @@all << genre
    genre
  end

  # returns a collection of artists for all of the genre's songs (genre has many artists through songs)
  # does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)
  # collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)
  def artists
    @artist_array = []
    @songs.each do |song|
      if @artist_array.include?(song.artist)
        nil
      else
        @artist_array << song.artist
      end
    end
    @artist_array
  end

end
