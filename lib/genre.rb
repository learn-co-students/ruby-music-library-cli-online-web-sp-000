require 'pry'

#genres have many songs and are initialized with an empty list of songs.
class Genre
  attr_accessor :name, :musiclibrarycontroller, :musicimporter
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

#empty its @@all array via class method destroy all.
  def self.destroy_all
    @@all.clear
  end

#adds genre instance to the @@all class variable
  def save
    @@all << self
  end

#initializes and saves the genre
  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end

  def songs
    @songs
  end

#genres have many artists through their songs.
  def artists
    @new_array_of_artists = [] #returns a new collection of artists for all of the genre's songs
    @songs.each do |song| #iterates through each song
      if @new_array_of_artists.include?(song.artist) #does not return duplicate artsits if genre has more than one song by artist
        nil
      else
        @new_array_of_artists << song.artist #collects artists through its songs. shovels new artists into new array of artists if not already there
      end
    end
    @new_array_of_artists #returns new array of artists for all of genre's songs
  end


end
