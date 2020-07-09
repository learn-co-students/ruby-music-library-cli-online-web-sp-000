require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = "na", genre = "na")
    @name = name
    self.artist= artist
    self.genre = genre
  end

  def artist=(artist)
    @artist = artist
    if artist != "na"
      if artist.songs.include?(self) == false
        artist.add_song(self)
      end
    end
  end

  def genre=(genre)
    @genre = genre
    if genre != "na"
      if genre.songs.include?(self) == false
        genre.add_song(self)
      end
    end
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
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    info2 = info[2].split(".")
    genre = info2[0]
    song = self.find_or_create_by_name(info[1])
    song.artist = Artist.find_or_create_by_name(info[0])
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
    song
  end
end
