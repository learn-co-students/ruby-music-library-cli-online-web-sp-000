require 'pry'

class Genre
    extend Concerns::Findable
    
    attr_accessor :name
    attr_reader :songs, :artists

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(name)
        name = Genre.new(name)
        name.save
        name
    end

    def artists
        self.songs.collect {|song| song.artist}.uniq
    end
end