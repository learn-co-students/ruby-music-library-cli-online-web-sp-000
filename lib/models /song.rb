class Song 
  
  attr_accessor :name
  
  @@all = []
  
    def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    self.new(name).tap do|song|
      song.save
    end
  end 
  
  def artist=(artist)
    if @artist == nil 
      @artist = artist 
    else 
      @artist = @artist 
    end 
    if self.artist != nil 
      @artist.add_song(self)
    end 
    @artist 
  end 
    
  def artist 
    @artist
  end 
  
  def genre=(genre)
    if @genre == nil 
      @genre = genre 
    else 
      @genre = @genre 
    end 
    if self.genre != nil 
      @genre.add_song(self)
    end 
    @genre 
  end 
  
  def genre 
    @genre 
  end 
  
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name 
    end 
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end 
  
  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)
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
end 