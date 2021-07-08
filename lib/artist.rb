class Artist
  extend Concerns::Findable
  attr_accessor :name

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
    newArtist = Artist.new(name)
    newArtist.save
    newArtist
  end

  def songs
    @songs
  end

  def add_song(song)
      if song.artist != nil && self.songs.find {|artists_song| artists_song.name == song.name } == nil
        self.songs << song
      end
      if song.artist == nil || song.artist != self
        song.artist = self
      end
  end

  def genres # Returns an Artist's genres
    @artist_genres = []
    @songs.each do |song|
      @artist_genres << song.genre
    end
   @artist_genres.uniq
  end

end
