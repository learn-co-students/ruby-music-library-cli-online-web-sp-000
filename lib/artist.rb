class Artist
    extend Concerns::Findable
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods

    attr_accessor :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name        
    end

    def songs 
        Song.all.select { |s| s.artist == self }
    end

    def add_song(song)
        #add a song to self
        song.artist = self unless song.artist
    end

    def genres
        songs.collect{ |s| s.genre }.uniq
    end

end