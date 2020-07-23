class Artist
    attr_accessor :name, :song, :music_library_controller, :music_importer
    extend Concerns::Findable
    extend Persistable::ClassMethods

    def initialize(name)
        @name = name
        @songs = []
        save
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
        a = self.new(name)
        a.save
        a
    end

    def songs
        @songs
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
        @array = []
        @songs.each do |song|
            if @array.include?(song.genre)
                nil
            else
                @array << song.genre
            end
        end
        @array
    end

end