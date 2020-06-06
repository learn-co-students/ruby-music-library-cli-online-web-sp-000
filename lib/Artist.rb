require "pry"
class Artist
  attr_accessor :name
  @@all=[]
  extend Concerns::Findable

  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all
    @@all
  end

  def save
    @@all<<self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    artist=new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist.nil?
      song.artist=self
    end
    if !songs.include?(song)
      songs<<song
    end
  end



  def songs
    @songs
  end

  def genres

    songs.map {|song| song.genre}.uniq.compact

  end

end
