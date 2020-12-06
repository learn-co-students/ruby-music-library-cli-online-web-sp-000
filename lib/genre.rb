class Genre 
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name 
  @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
    end


  def self.all 
    return @@all 
  end 
  
  def songs 
    return @songs 
  end
  
  def add_song(song)
    if(!songs.include?(song))
      songs.push(song)
    end
    if(song.genre == nil)
      song.genre = self 
    end
    return song
  end
  
  def artists
    return songs.collect{|song| song.artist}.uniq
  end 
    
end
    
  