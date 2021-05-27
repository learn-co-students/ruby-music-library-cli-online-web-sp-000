class Artist
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end


    def save
        self.class.all << self
        self
    end

    def add_song(song)
        song.artist = self unless song.artist
    end

    def songs
        #binding.pry
        Song.all.select{|s| s.artist == self}
    end

    def genres
        #binding.pry
        songs.collect{|s| s.genre}.uniq
    end
end
