require_all 'lib'
require 'pry'
class Genre
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

  def artists
    artray = []

    @songs.each {|x|
      if !artray.include?(x.artist)
        artray << x.artist
      end
    }
    artray
  end

  def <=>(other)
    if @name < other.name
      -1
    elsif @name > other.name
      1
    else
      0
    end
  end


  def self.create(name)
    g  = Genre.new(name)
    is = 0
    is= 1 if name == "n/a"
    @@all.each do |x|
      if x.name == name
        is = 1
      end
    end
    g.save if is == 0
    g
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
