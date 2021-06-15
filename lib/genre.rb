class Genre
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
        Song.all.select {|s| s.genre == self}
    end

    def artists
        songs.collect{ |s| s.artist }.uniq
    end

    
end