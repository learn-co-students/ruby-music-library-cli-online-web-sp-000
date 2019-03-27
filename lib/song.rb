require "pry"

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = "", genre = "")

    @name = name

    if artist != ""
       artist.add_song(self)
      # binding.pry
    end

    if genre != ""
       self.genre = genre
    end

    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    # binding.pry
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    # binding.pry
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def artist=(name)
    @artist = name
    name.add_song(self)
  end

  def self.new_from_filename(filename)
    # binding.pry
    name = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    genre = filename.split(" - ")[2].gsub(".mp3", "")

    song = Song.find_or_create_by_name(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)

    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    # song.save  !!! What's the purpose of this line? What's the purpose of this method??
  end
end
