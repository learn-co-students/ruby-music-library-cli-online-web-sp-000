class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
      @name = name
      @songs = []
      save
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

    def self.create(genre)
      newgenre = self.new(genre)
    end

    def add_song(song)
      if song.genre == nil
        song.genre = self
      end
      if !@songs.include?(song)
        @songs << song
      end
    end

    def artists
      songs.collect do |song|
        song.artist
      end.uniq
      end
end
