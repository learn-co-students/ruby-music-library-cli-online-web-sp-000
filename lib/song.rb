class Song
  attr_accessor :name, :genre, :artist
  #attr_reader :artist#, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist
    self.genre = genre
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
    @@all << song
    song
  end

  def artist=(artist)
    if artist
      @artist = artist
      artist.add_song(self)
    end

  end

  def genre=(genre)
    if genre
      @genre = genre
      genre.add_song(self)
    end
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      Song.create(name)
    end
  end

  def new_from_filename(filename)
    
  end

  def create_from_filename(filename)

  end

end
