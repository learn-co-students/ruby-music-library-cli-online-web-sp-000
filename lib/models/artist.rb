class Artist 

extend Persistable::ClassMethods 
extend Concerns::Findable 
include Persistable::InstanceMethods 

    @@all = []

    attr_accessor :name, :songs 

    def initialize(name)
        @name = name 
        @songs = []
    end     

    def self.all 
        @@all 
    end 

    def self.create(name) 
        new_artist = Artist.new(name)
        new_artist.save 
        new_artist
    end    

    def add_song(song) 
        if !song.artist
            song.artist = self
        end
        if !@songs.include?(song)
            @songs << song
        end
    end   

    def genres
        songs.collect{ |s| s.genre }.uniq
      end
end    
