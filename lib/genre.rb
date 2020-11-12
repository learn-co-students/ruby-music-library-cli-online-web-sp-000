class Genre

    extend Concerns::Findable

    attr_accessor :name, :songs
    attr_reader :genre

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def songs
        @songs
    end

    def artists
        artists = []
        songs.each do |song|
            artists << song.artist
        end
        artists.uniq
    end

    def genre=(genre)
        @genre = genre
    end

    def save
        @@all << self
    end

    def add_song(song)
        song.genre = self unless song.genre
        songs << song  unless songs.include?(song)
    end


    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

end 