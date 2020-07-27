require 'pry'
class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
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
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
      @artist = artist
      @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !@genre.songs.include?(self)
      @genre.songs << self
    end
  end


  def self.new_from_filename(filename)
    filename_withoutmp3 = filename.split(".mp3").join
    song = self.new(filename_withoutmp3.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(filename_withoutmp3.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(filename_withoutmp3.split(" - ").last)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
