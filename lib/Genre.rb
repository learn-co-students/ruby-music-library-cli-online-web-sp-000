class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :artist
  
  @@all = [ ]
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = [ ]
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = [ ]
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new_genre = Genre.new(name)
  end
  
  def artists
    to_return = [ ]
    self.songs.collect do |song|
      if to_return.include?(song.artist) == false
        to_return << song.artist
      end
    end
    to_return
  end
  
end