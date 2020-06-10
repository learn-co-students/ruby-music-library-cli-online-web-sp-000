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
        song = self.new(name)
        song.save
        song    
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
        # @@all.each do |song|
        #     if song.name == song_name
        #     song
        #     end
        #     nil
        # end
        # @@all.find {|song| song.name == song_name}
        self.all.find {|song| song.name == song_name}
    end

    def self.find_or_create_by_name(song_name)
        if self.find_by_name(song_name)
            self.find_by_name(song_name)
        else
            self.create(song_name)
        end
    end

        def self.new_from_filename(filename)
            split_filename = filename.split("-")
            collected_filename = split_filename.collect {|e| e.strip}
            artist = Artist.find_or_create_by_name(collected_filename[0])
            genre = Genre.find_or_create_by_name(collected_filename[2].gsub(/.mp3/, ""))
            song = Song.new(collected_filename[1], artist, genre)
            artist.add_song(song)
            # song.save
            song
            # binding.pry
        end

        def self.create_from_filename(filename)
            self.new_from_filename(filename).save
        end

end