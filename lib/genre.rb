class Genre
  attr_accessor :name
  attr_reader :songs, :artists
  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
    @artists = []
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
    genre = Genre.new(name)
    @@all << genre
    genre
  end

  def add_song(song)
    #@songs << song
    if !song.genre
      song.genre = self
    end

    if !@songs.include?(song)
      @songs << song
    end
  end

end
