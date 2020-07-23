require "pry"

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
      if genre != nil
        self.genre = genre
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
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !@genre.songs.include?(self)
      @genre.songs << self
    end
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    song = self.new(filename.split(" - ")[1])
    # song.name = Song.find_or_create_by_name(filename.split(" - ")[1])
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3", ""))
    # def files
    #   Dir["#{@path}/*"].map { |x| x.gsub("./spec/fixtures/mp3s/", "") }
    # end
    song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song
    #binding.pry
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end

#   # Song.artist = artist
#   # Artist.song << Song
#   # #if initialize is called with artist or genre arguments
