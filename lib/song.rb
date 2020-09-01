class Song
  
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre= (genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    self.new(name).save
  end

  def self.destroy_all
    @@all.clear
  end
  
  def self.new_from_filename(filename)
    array = filename.chomp(".mp3").split(" - ")

    song = array[1]
    artist = Artist.find_or_create_by_name(array[0])
    genre = Genre.find_or_create_by_name(array[2])
    
    self.new(song, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
