require 'pry'
#an artist has many songs.
#artists have many genres through their songs.
class Artist
  attr_accessor :name, :song, :musiclibrarycontroller, :musicimporter
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = [] #(artist has many songs)
  end

  def self.all
    @@all
  end

#empty its @@all array via destroy all class method
  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

#initializes and saves the artist:
  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end

#associations: returns the artist's songs collection (has many songs)
  def songs
    @songs
  end

#add song method allows the artist to have many songs
#it allows this method by calling add song on an instance of the Artist class
  def add_song(song)
    if song.artist == nil #does not assign the song if the song already has an artist
      song.artist = self #assigns current artist to songs artist property
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song #adds song, does not add the song if already exists
    end
    song
  end

#genres method: artists have many genres through their songs.
  def genres
    @new_array_of_genres = []
    @songs.each do |song| #iterate through each song to find the genre 
      if @new_array_of_genres.include?(song.genre) #does not return duplicate genres
        nil
      else
        @new_array_of_genres << song.genre #collects genres through its songs
      end
    end
    @new_array_of_genres #returns a collection of genres for all of the artists songs
  end

end
