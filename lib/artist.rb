require 'pry'
class Artist
  extend Concerns::Findable
  extend Nameable::ClassMethods
  include Persistable::ClassMethods
  attr_accessor :name, :songs 
  @@all = []
  def initialize 
  @name = name
    @songs = []
end

    def self.all
      @@all.clear
    end
    
    def self.count
@@all.size
end

    def self.reset_all
      all.clear
    end
    
    def save
      @@all << self
    end
    
    def self.create(name)
      artist = new(name)
      artist.save
      artist
      end
    
    def self.find_by_name(name)
      @@all.detect{|artist| artist.name == name}
    end
  
    
    def add_song(song)
      if song.artist == nil
        song.artist = self unless song.artist
        @songs << song unless songs.include?(song)
      end
    end
    
    def genres
      songs.collect do |song|
        song.genre
    end
  end
  