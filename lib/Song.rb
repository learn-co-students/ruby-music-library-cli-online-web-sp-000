require 'pry'
class Song
  include Comparable

  attr_accessor :name

  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = "n/a", genre = "n/a")
    @name = name
    self.artist= artist
    self.genre= genre
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    if artist != "n/a"
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if !genre.is_a?(Genre)
      g = Genre.create(genre)
      genre = g
    end
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def <=>(song)
    if @name < song.name
      -1
    elsif @name > song.name
      1
    else
      0
    end
  end

  def self.new_from_filename(fname)
    chars = fname.split(/[-.]/)
    song = Song.create(chars[1].strip)
    #binding.pry
    song.artist= Artist.find_or_create_by_name(chars[0].strip)
    if chars[2].strip == "hip" && chars[3].strip =="hop"
      song.genre= Genre.find_or_create_by_name("hip-hop")
    else
      song.genre= Genre.find_or_create_by_name(chars[2].strip)
    end
    return song
  end

  def self.create_from_filename(fname)
    song = Song.new_from_filename(fname)
    song.save
  end

  def self.find_by_name(name)
    found = @@all.select {|x| x.name == name}
    found.first
  end

  def self.find_or_create_by_name(name)
    found = Song.find_by_name(name)
    if !found.nil?
      return found
    else
      Song.create(name)
    end
  end

  def self.create(name)
    s = Song.new(name)
    s.save
    s
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
