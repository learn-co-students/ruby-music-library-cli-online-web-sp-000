require 'pry'
require_relative "../lib/concerns/modules.rb"

class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all #refactor
        @@all
    end

    def save #refactor
        @@all << self
    end

    def self.create(name) #refactor
        song = self.new(name)
        song.save
        song
    end

    def self.destroy_all #refactor
        @@all = []
    end

    def artists
        self.songs.collect {|song| song.artist}.uniq
    end

end