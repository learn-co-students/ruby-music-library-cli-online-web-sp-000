class Artist

    attr_accessor :name
    attr_reader :songs
    extend Concerns::Findable

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        all.clear
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save
        artist
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
          else
            nil
          end
          if @songs.include?(song)
            nil
          else
            @songs << song
          end
          song
    end

    def genres
        @collection_of_genres = []
        @songs.each do |song|
            if @collection_of_genres.include?(song.genre)
                nil
            else
                @collection_of_genres << song.genre
            end
        end
        @collection_of_genres
    end
end