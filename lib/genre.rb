require 'pry'

class Genre
  extend Concerns::Findable

  attr_accessor :name

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

    def songs
      @songs
    end

    def add_song(song)
      if (@songs.include? song) == false
        @songs << song
      end
    end

    #def songs
    #  Song.all.select do |song|
    #    song.genre == self
    #  end
    #end

    def artists
      unique_artists = []
      songs.each do |song|
        unique_artists << song.artist
      end
      unique_artists.uniq
    end

    def self.alphabetical
      self.all.sort_by {|genre| genre.name}
    end
end
