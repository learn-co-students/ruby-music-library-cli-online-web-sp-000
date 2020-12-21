class Genre

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
        genre = Genre.new(name)
        genre.save
        genre
    end

    def artists
        @collection_of_artists = []
        @songs.each do |song|
            if @collection_of_artists.include?(song.artist)
                nil
            else
                @collection_of_artists << song.artist
            end
        end
        @collection_of_artists
    end
end