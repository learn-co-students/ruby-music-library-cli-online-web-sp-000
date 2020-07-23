require 'pry'
class Song

  attr_accessor :name


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    save
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
    song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      self.create(name)
    else
      song
    end
  end

  def self.new_from_filename(filename)
    filename.slice!(".mp3")
    fn_array = filename.split(" - ")

    artist_name = fn_array[0]
    song_name = fn_array[1]
    genre_name = fn_array[2]

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  # def artist
  #   @artist
  # end
  #
  # def artist=(artist)
  #   @artist = artist
  #   self.artist.add_song(self)
  # end



end
