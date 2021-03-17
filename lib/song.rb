class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []
    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist
            self.artist = artist
        end
        if genre
            self.genre = genre
        end
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        if !(genre.songs.include?(self))
            genre.songs << self
        end
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        song = new(name)
        song.save
        return song
    end

    def self.find_by_name(name)
        all.detect{ |s| s.name == name}
    end

    def self.find_or_create_by_name(name)
        if find_by_name(name)
            return find_by_name(name)
        else
            create(name)
        end
    end

    def self.new_from_filename(name)
        sections = name.split(" - ")
        artist = Artist.find_or_create_by_name(sections[0])
        genre = Genre.find_or_create_by_name(sections[2].gsub(".mp3", ""))
        new(sections[1], artist, genre)
    end

    def self.create_from_filename(name)
        new_from_filename(name).tap{ |s| s.save }
    end

end
