class Artist
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @@all = []
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(new_artist)
    artist = Artist.new(new_artist)
    artist.save
    artist
  end
  
  def add_song(song)
    if song.artist != self
    song.artist = self
    @songs << song
    end
  end
  

  def genres 
    genres_array = []  

    self.songs.each do |song|  # (artist has many genres through songs)
      
    if genres_array.include?(song.genre) # ????
     genres_array << song.genre
    end
  end
      genres_array

  end


=begin 
 
  def songsy
    Song.all.select do |song|
      song.artist == self
    end
  end
 
  def genres
    array = []
    songsy.map do |genr|
      array << genr.genre
    end
    array
  end  
=end  
end

