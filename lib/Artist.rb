require_all 'lib'
require 'pry'
class Artist
  extend Concerns::Findable
  include Comparable

  attr_accessor :name

  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    if song.artist == "n/a"
      song.artist= self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    genray = []
    @songs.each  do |x|
      #binding.pry
      is = 0
      genray.each do |y|
        if y.name==x.genre.name
          is = 1
        end
      end
      if is!=1
        genray<<x.genre
      end
    end
    genray
  end

  def <=>(other)
    if @name < other
      -1
    elsif @name > other
      1
    else
      0
    end
  end

  def self.create(name)
    a = Artist.new(name)
    a.save
    a
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
