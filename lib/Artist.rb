class Artist

#  This can be put on a higher element for inheritance
  attr_accessor :name
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    self.save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    self.new(name)
  end
  

# Unique to Artist objects
  def add_song(song)
    if song.artist == nil
      song.artist=(self)
    end
    @songs.push(song)
    @songs.uniq!
  end
  
  def songs
    @songs
  end
  
  def genres
    song_genres = []
    Song.all.select do |s|
      if s.artist == self
        song_genres << s.genre
      end
    end
    song_genres.uniq!
    song_genres
  end
end
