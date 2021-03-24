require 'pry'
require_relative './song.rb'

class Artist

    attr_accessor :name, :songs

    extend Concerns::Findable 

    @@all = []

    def initialize(name)
        @name = name
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

    def count
        self.all.size
    end

    def songs
        Song.all.select {|s| s.artist == self}
    end

    def genres
        songs.map{|g| g.genre}.uniq
    end

    def add_song(song)
        if !song.artist
            song.artist = self
        end
    end

end