require 'pry'
class Artist
 attr_accessor :name
 extend Concerns::Findable
 @@all = []

 def initialize(name)
   @name = name
   @songs = []
 end

 def self.all
   @@all
 end

 def songs
   @songs
 end
 def save
   @@all << self
 end

 def add_song(song)
   #binding.pry

   song.artist = self unless song.artist
   @songs << song unless @songs.include?(song)

 end

 def genres
   #binding.pry
   song_genres = @songs.map do |song|

     song.genre
  end
   song_genres.uniq
 end

 def self.destroy_all
   self.all.clear
 end

 def self.create(artist_name)
   artist = self.new(artist_name)
   artist.name = artist_name
   artist.save
   artist
 end
end
