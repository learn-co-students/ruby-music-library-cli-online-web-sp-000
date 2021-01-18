class Song 
  extend Concerns::Findable
  attr_accessor :name, :song
  attr_reader :genre, :artist
 
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    save
  end 
  
  def artist=(artist)
    @artist = artist 
     artist.add_song(self)
  end 
    
  def genre=(genre)
    if @genre == nil
      @genre = genre
      @genre.add_song(self)
    end
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
  
  def self.create(name)
    song = Song.new(name)
  end 
  
  def self.find_by_name(name)
   Song.all.find do |song| 
     song if song.name == name
   end 
  end 
  
  def self.find_or_create_by_name(name)
    var = Song.find_by_name(name) 
    if var == nil 
      Song.create(name)
    else
      var
    end 
  end 
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")

    song_name = array[1]
    artist_name = array[0]
    genre_name = array[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
  var = Song.new_from_filename(filename)
  end
end 
