require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  # attr_reader
  @@all = Array.new

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      # puts "has artist"
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
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
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    # puts "adding artist"
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      Song.create(name)
    else
      find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    filename = filename.gsub(".mp3", "").split(" - ")
    Song.new(
      filename[1],
      Artist.find_or_create_by_name(filename[0]),
      Genre.find_or_create_by_name(filename[2])
    )
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end


end
