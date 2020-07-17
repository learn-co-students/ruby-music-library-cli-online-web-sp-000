class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
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
  
  def add_song(song)
    if song.genre 
    else song.genre = self
    end
    if @songs.include?(song)
    else @songs << song
    end
  end
  
  def self.create(name)
    created_genre = self.new(name)
    created_genre.save
    created_genre
  end
  
  def artists
    artist_array = []
    songs.each do |song|
      if artist_array.include?(song.artist)
      else artist_array << song.artist
      end
    end
    artist_array
  end
  
end