class Song 
  attr_accessor :name, :artist, :genre, :musiclibrarycontroller

  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil

    end
  
  def save 
    @@all << self
  end
  
  def self.create(name) 
    song = Song.new(name)
    song.save
    song
  end
    
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all.clear
  end
  
  def artist=(artist)
    if artist.is_a?(Artist)
       @artist = artist
      artist.add_song(self)
    end
  end

  
  def genre=(genre)
    if genre.is_a?(Genre)
      @genre = genre
      genre.songs << self  unless genre.songs.include?(self)
    end
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    # binding.pry
     song = self.find_by_name(name)
    if !song
      song = self.create(name)
      song
    else
      song
    end
  end
  
  def self.new_from_filename(filename)
    file_array = filename.split("-")
    artist = file_array[0].strip
    song = file_array[1].strip
    genre = file_array[2].split(".")[0].strip
    genre == "hip" ? genre = "hip-hop" : genre = genre
    
    artist_obj = Artist.find_or_create_by_name(artist)
    genre_obj = Genre.find_or_create_by_name(genre)
    new_song = Song.new(song,artist_obj,genre_obj)
  end 
  
  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

end