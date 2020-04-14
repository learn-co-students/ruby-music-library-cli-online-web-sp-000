class Genre
  
  @@all = []
  
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end
  
  def add_song(song)
    if song.genre != self
      song.genre = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

end