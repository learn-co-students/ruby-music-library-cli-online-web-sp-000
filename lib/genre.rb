class Genre
    attr_accessor :name, :music_importer, :music_library_controller
    extend Concerns::Findable
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def save
        @@all << self
    end

    def self.create(name)
        #binding.pry
        g = self.new(name)
        g.save
        g
    end

    def songs
        @songs
    end

    def artists
        @array = []
        @songs.each do |song|
            if @array.include?(song.artist)
                nil
            else
                @array << song.artist
            end
        end
        @array
    end

    def add_song(song)
        if song.genre == nil
            song.genre = self
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


end