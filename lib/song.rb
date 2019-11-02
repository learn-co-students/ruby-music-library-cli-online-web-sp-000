require "pry"
# require './artist.rb'
# require './genre.rb'
class Song

  extend Findable::ClassMethods

  attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist
    self.genre= genre if genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(song)
    song = self.new(song)
    song.save
    return song
  end

  def artist=(artist)
    if @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  # def find_by_name(name)
  #   @@all.detect { |a| a.name == name }
  #   # binding.pry
  # end
  #
  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name)
  #       self.find_by_name(name)
  #     else
  #       self.create(name)
  #   end
  # end

  def self.destroy_all
    self.all.clear
  end
end
