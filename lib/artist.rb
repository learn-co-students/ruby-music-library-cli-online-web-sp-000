class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :genres

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

  def self.create(name)
    created_artist = self.new(name)
    created_artist.save
    created_artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if @songs.include?(song) == false
      @songs << song
    end
  end

  def genres
    artist_genres = []
    @songs.each do |song|
      if artist_genres.include?(song.genre) == false
        artist_genres << song.genre
      end
    end
    return artist_genres
    #artist songs are stored in @songs as an array
    #each song within this array, we are able to call on the .genre method with Song class
    #.genre method returns instance of the class which is what we want
  end

end
