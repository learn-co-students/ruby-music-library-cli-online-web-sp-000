class Genre

    extend Concerns::Findable
    
    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = Array.new()
    end

    def save
        @@all << self
    end

    def self.create(name)
        g = Genre.new(name)
        g.save
        g
    end

    def artists
        Song.all.find_all { |song| song.genre == self }.map(&:artist).uniq
    end
    
end