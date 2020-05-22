require 'pry'
class Genre
  attr_accessor :name, :artist, :song
  @@all = []

  def initialize(name)
      @name = name
      @@all
      @songs = []
  end

  def save
      @@all << self
  end

  def self.all
      @@all
  end

  def self.destroy_all
      @@all.clear
  end

  def self.create(name)
      a = self.new(name)
      @@all << a
      a
  end

  def artists
    a = songs.collect do |song|
      
          song.artist
      end
     
      a.uniq
b =     a.collect{|song| song}
      b.uniq
 
end

  def find_by_name(name)
      self.all.detect {|song| song.name == name}
end

  def songs
    # Song.all.select do |song|
    #   song.genre = self
    @songs

    # end
  end

  def find_or_create_by_name(name)
      a = self.all.detect {|song| song.name == name}
      if a == nil 
      Song.new(name)
      else
        a
        end
  end
end
