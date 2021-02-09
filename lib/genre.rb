class Genre
  extend Concerns::Findable

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
    @@all.clear
  end

  def save
    @@all << self
  end

  def save_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
  end

  def self.create(name)
    created_genre = self.new(name)
    created_genre.save
    created_genre
  end

  def songs
    return @songs
  end

  def artists
    genre_artists = []
    @songs.each do |song|
      if genre_artists.include?(song.artist) == false
        genre_artists << song.artist
      end
    end
    return genre_artists
  end

end
