class Song

    attr_accessor :name

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist != nil
            self.artist=artist
        end
        if genre != nil
            self.genre=genre
        end
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

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def artist
        @artist
    end

    def genre=(genre)
        @genre = genre
        if !genre.songs.include?(self)
            genre.songs << self
        end
    end

    def genre
        @genre
    end

    def self.find_by_name(song_name)
        @@all.each do |song|
            if song.name == song_name
            song
            end
            nil
        end
        # @@all.detect {|song| song.name == song_name}
    end

end