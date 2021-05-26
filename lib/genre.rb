class Genre
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
    end

    def artists
        songs.collect{|s| s.artist}.uniq
    end

    def songs
        Song.all.select {|s| s.genre == self}
    end
end
