require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

    @@all = []

    def initialize(name)
      @name = name
      @@all << self
      @songs = []
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

    def self.create(name)
      self.new(name)
    end

    def add_song(song)
      if song.artist == nil
        @songs << song
        song.artist = self
      end
    end

    def songs
      @songs
    end

    def songs_select
      Song.all.select do |song|
        song.artist == self
      end
    end

    def genres
      unique_genres = []
      songs_select.each do |song|
        unique_genres << song.genre
      end
      unique_genres.uniq
    end

    def self.alphabetical
      self.all.sort_by {|artist| artist.name}
    end
end
