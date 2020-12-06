class Artist 
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  extend Concerns::Findable
  attr_accessor :name, :songs
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
    if(song.artist == nil)
      song.artist = self 
    end
    return song
  end
  
  def genres 
    return songs.collect{|song| song.genre}.uniq
  end  
end
    
  