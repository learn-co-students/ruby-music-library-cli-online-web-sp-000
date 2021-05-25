class Song

  attr_accessor :name

  @@all = []

  def artist
    @artist
  end
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    Genre.create(genre) if !genre
  end

  def self.find_by_name(name)
    Song.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !Song.find_by_name(name)
      Song.create(name) 
    else
      Song.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.split(" - ")
    genre_name = genre_name.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename)
  end

end