class Artist

  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :song, :artist, :genre

  def initialize(name)
    @name = name
    @songs = []
    # save
  end

  def self.all
    @@all
  end

# Has many genres through songs
  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

# Instantiates an instance using .new, saves, returns new song
  def self.create(artist)
   artist = self.new(artist)
   artist.save
   artist
 end

 def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    if songs.include?(song)
      nil
    else
    self.songs << song
    end
  end
end
