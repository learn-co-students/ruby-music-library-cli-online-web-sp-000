class Artist
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
    end

    def add_song(song)
        song.artist = self unless song.artist
    end

    def songs
        Song.all.select{|s| s.artist == self}
    end

    def genres
        song.collect{|s| s.genre}.uniq
    end
end
