class Genre
  require './lib/concerns/findable.rb'


    attr_accessor :name, :musiclibrarycontroller, :musicimporter
    extend Concerns::Findable  #class module
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

    def add_song(song)
      if song.genre = nil
        song.genre = self
      else
        nil
      end

      if @songs.include?(song)
        nil
      else
        @songs << song
      end
    end

    def songs
      @songs
      #Song.all.select do |song|
      #  song.genre = self
      #end
    end

    def artists
      artists = []

      @songs.each do |song|
        artists << song.artist
      end
      return artists.uniq
    end

    def self.create(name)
      genre = Genre.new(name)
      genre.save
      return genre
    end

    def self.destroy_all
      @@all = []
    end

    def self.new_from_filename(file)
      #Action Bronson - Larry Csonka - indie.mp3
      artist_name = file.split(" - ")[0]
      song_name = file.split(" - ")[1]
      genre_name = file.split(" - ")[2].chomp(".mp3")

      genre = self.find_or_create_by_name(genre_name)
      genre.song = Song.find_or_create_by_name(song_name)
      genre.artist = Artist.find_or_create_by_name(artist_name)

      return genre
    end

    def self.create_from_filename(file)
      new_from_filename(file)
    end

    def self.find_by_name(name)
        self.all.detect {|x| x.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

end
