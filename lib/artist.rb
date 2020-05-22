require 'pry'
class Artist
  attr_accessor :name, :song, :genre
  @@all = []

  def initialize(name)
      @name = name
      @songs = [] 
    
  end

  def songs
        @songs
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

  def genres
    arr = []
       self.songs.collect do |song|
       song.genre == self
        #  binding.pry
       if arr.detect {|i| i == song.genre}
        break
       else
       arr << song.genre
      # binding.pry 
      end
      end
      arr
      
  end

  def add_song(name)
    if name.artist == nil
      name.artist = self
    end

    if self.songs.include?(name)
      return
    else
    @songs << name  
  end
 
end

  def find_by_name(name)
      Artist.all.detect {|song| song.name == name}
  end

  def find_or_create_by_name(name)
      a = self.find_by_name
      binding.pry
      if !a    
      Song.new(name)
      else
        a
        end
        binding.pry

  end

end
