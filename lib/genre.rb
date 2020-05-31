class Genre
    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end

    def initialize(name)
        @name=name
        @songs = []
    end

    def save
        self.class.all << self
    end

    def artists
        songs.collect {|s| s.artist}.uniq
    end

    def add_song(song)
        if !self.songs.include?(song)
            self.songs << song
        end
    end


end