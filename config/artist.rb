
class Artist 
  extend Concerns::Findable
  attr_accessor :name, :genres
  
  @@all = []
  
    def initialize(name)
    @name = name
    @songs = []
    save
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

  def self.create(artist)
    artist = self.new(artist)
  end

  def songs
    @songs
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
   arr = @songs.collect {|song|song.genre}
    arr.uniq
  end

end