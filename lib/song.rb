require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
      artist=(artist)
    end

    if genre
      self.genre = genre
      genre=(genre)
    end
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
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
    unless self.genre
      @genre = genre
    end

    unless genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.find_by_name(title)
    @@all.select {|e| return e if e.name == title}
  end

  def self.find_or_create_by_name(title)
    array = @@all.map {|e| e.name}

    if array.include?(title)
      self.find_by_name(title)
    else
      self.create(title)
    end

#binding.pry

  end

end
