class Genre
  
  attr_accessor :name, :songs, :song
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
  
  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end
  
  # def genre_songs
  #   Song.all.select {|song| song.genre == self} 
  # end
  
  def artists
    @songs.map {|song| song.artist}.uniq 
  end
  
end