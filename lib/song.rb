require "pry"
class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    new_song_ary = []
    new_song_ary = filename.split(/[-.]/)
    song = find_or_create_by_name(new_song_ary[1].strip)
    artist = Artist.find_or_create_by_name(new_song_ary[0].strip)
    genre = Genre.find_or_create_by_name(new_song_ary[2].strip)
    song = Song.new(new_song_ary[1].strip, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end


end
