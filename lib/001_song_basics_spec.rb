require_relative './002_artist_basics_spec.rb'

class Song
  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
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
    genre.songs << self unless genre.songs.include? self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self if !(@@all.include?(self))
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    puts "Song created: #{song.name}."
    song
  end

  def self.find_by_name(name)
    return @@all.detect do |song| song.name == name end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
      #binding.pry
      #create(name)
  end

end
