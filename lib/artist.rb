require 'pry'
class Artist

  extend Concerns::Findable
  attr_accessor :name, :songs, :musicimporter, :musiclibrarycontroller

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    @songs << song unless @songs.include?(song)
  end

  def genres
    answer = []
    @songs.each do |song|
      answer << song.genre unless answer.include?(song.genre)
    end
    answer
  end
#class Methods

  def self.create(name)
    new_arist = Artist.new(name)
    new_artist.save
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.create(song)
     new_artist = self.new(song)
     new_artist.save
     new_artist
  end

end
