class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
    self
  end
  
  def add_song(song)
    if song.genre == nil
      song.genre = self
    end
    if !songs.include?(song)
      songs << song
    end
  end
  
  def artists
    songs.map { |song| song.artist }.uniq
  end
  
  def self.create(name)
    new(name).save
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end