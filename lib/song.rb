class Song 
  @@all = []
  attr_accessor :name, :artist, :genre
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
   # @@all << self
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save()
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    return song
  end
  
  def artist=(artist_obj)
    @artist = artist_obj
    @artist.add_song(self)
  end
  
  def genre=(genre_obj)
    @genre = genre_obj
    @genre.add_song(self)
  end
  
  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    
    if song 
      return song
    else
      song = self.create(name)
      return song 
    end
  end
  
  def self.new_from_filename(filename)
    song_arr = filename.split(" - ")
    song_arr[2].delete_suffix!(".mp3")
    
    
    new_artist = Artist.find_or_create_by_name(song_arr[0])
    new_genre = Genre.find_or_create_by_name(song_arr[2])
    new_song = Song.new(song_arr[1], new_artist, new_genre)
    
    return new_song
  end
  
  def self.create_from_filename (filename)
    self.all << self.new_from_filename(filename)
  end
  
  def self.alphabetical
    self.all.sort_by do |a|
      a.name
    end
  end
end