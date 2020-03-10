
class Song
  attr_accessor :name, :artist
  attr_reader

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
    artist.add_song(name)
  end

  def save
    @@all << self
  end

  def self.create(name)
    #create an instance of said song
    song = Song.new(name)
    #save said instance
    song.save
    song
  end
end
