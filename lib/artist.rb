class Artist

    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        self.new(name).save
        self
    end

    def songs
        @songs
    end

    def add_song(song)
        if song.artist == nil || song.artist == ""
            song.artist = self
        end
        self.song = song
        if @songs.any? {|s| s == song} == false
            @songs << song
        end
    end

    def genres
        genre_types = songs.map do |song|
            song.genre
        end
        genre_types.uniq
    end

end