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
  
  def songs
    @songs
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def artists
    @artist
  end
  
  def self.create(name)
    new(name).tap{|a| a.save}
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def genres
    genres = @songs.map { |song| song.genre }
    genres.uniq
  end

  
end
