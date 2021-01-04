class Artist
  extend Concerns::Findable

  attr_accessor :name, :song, :genre

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def self.create(name)
      @name = name
      artist = Artist.new(name)
      artist.save
      artist
    end

    def save
      self.class.all << self
    end

    def self.all
      @@all
    end

    def self.destroy_all
      self.all.clear
    end

    def songs
      @songs
    end

    def genres
      songs.collect { |s| s.genre }.uniq
      #Genre.all.collect { |genre| genre.artist == self }
    end

    def add_song(song)
      song.artist = self unless song.artist
      songs << song unless songs.include?(song)
    end

end
