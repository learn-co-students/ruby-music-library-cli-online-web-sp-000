class Song 
  
  attr_accessor :name, :artist, :genre  
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all = []
  end 
  
  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save 
    song  
  end 
  
  def save 
    @@all << self 
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre=(genre)
    #binding.pry
    @genre = genre 
    genre.songs << self if genre.songs.include?(self) == false
  end
  
  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) != nil ? self.find_by_name(song_name) : self.create(song_name)
  end 
  
  def self.new_from_filename(song_file)
    song_name = song_file.split(" - ")[1]
    song_artist = Artist.find_or_create_by_name(song_file.split(" - ")[0])
    song_genre = Genre.find_or_create_by_name(song_file.split(" - ")[2].gsub("\.mp3",""))
    self.new(song_name,song_artist,song_genre)
  end 
  
  def self.create_from_filename(song_file)
    song = self.new_from_filename(song_file).save
    song
  end 
  
end 







