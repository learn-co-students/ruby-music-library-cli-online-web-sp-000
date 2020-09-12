class Genre < Base
  
  attr_accessor :name, :songs, :artists
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end 
  
  def self.create(genre)
    new_genre = self.new(genre)
    new_genre.save
    new_genre
  end
  
  def songs
    @songs
  end
  
  def artists
    @artists = []
    @songs.each {|song| @artists.include?(song.artist) ? nil : @artists << song.artist }
    @artists
  end
end 