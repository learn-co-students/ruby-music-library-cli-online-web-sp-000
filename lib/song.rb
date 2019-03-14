class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
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
    song = Song.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  
  def self.new_from_filename(file)
    info = file.split(" - ")
    info[2].chomp!(".mp3")
    
    artist = Artist.find_or_create_by_name(info[0])
    genre = Genre.find_or_create_by_name(info[2])
    Song.new(info[1], artist, genre) if !Song.find_by_name(info[1])
  end
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end
end

