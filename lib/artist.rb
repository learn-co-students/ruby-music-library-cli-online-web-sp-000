class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    self.name = name
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
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end

    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    temp_genres = @songs.collect do |song|
      if song.genre
        song.genre
      end
    end
    temp_genres.uniq
  end

end
