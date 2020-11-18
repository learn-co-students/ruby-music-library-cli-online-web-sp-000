require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist != nil
      self.artist=(artist)
    end

    if genre != nil
      self.genre=(genre)
    end

  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def artist=(this_artist)
      @artist = this_artist
      @artist.add_song(self)
  end


  def save
    @@all << self
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create(name)
    end

  end

end
