class Song 

  attr_accessor :name 
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist 
    self.genre = genre if genre
    # @@all << self 
  end 

  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 

  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end 

  def self.all 
    @@all
  end 

  def self.destroy_all 
    Song.all.clear 
  end 

  def save
    @@all << self
  end 

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end 
  end 

  def self.find_or_create_by_name(name)
    find_by_name(name) || self.create(name)
  end 

  def self.new_from_filename(filename)
    song_data = filename.split(" - ")
    self.find_or_create_by_name(song_data[1]).tap do |song|
      song.artist = Artist.find_or_create_by_name(song_data[0])
      song.genre = Genre.find_or_create_by_name(song_data[2].sub(".mp3", ""))
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end 

end 