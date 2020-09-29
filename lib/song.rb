require "pry"

class Song

    extend Concerns::Findable

    @@all = []

    attr_accessor :artist, :name, :genre

    def initialize(name, artist=nil, genre=nil)
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
        @name = name

    end


def self.all
@@all
end

def self.create(name)
    
    song = Song.new(name) 
    song.save
    song
   
#if !self.all.include?(name)
end



def artist_name=(name)

    artist = Artist.find_or_create_by_name(name)

    self.artist = artist
end

def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
end

def self.find_by_name(name)
    @@all.find {|song|song.name == name}
  end


def self.find_or_create_by_name(name)
find_by_name(name) || create(name)
#binding.pry
end






def self.new_from_filename(filename)
    song_data = filename.split(" - ")
        song = song_data[1]
        artist_name = song_data[0]
        genre_name = song_data[2].split(".mp3").join
    
    
        artist_name = Artist.find_or_create_by_name(artist_name)
        genre_name = Genre.find_or_create_by_name(genre_name)
        self.new(song, artist_name, genre_name)
      end



      def self.create_from_filename(file)
        song = Song.new_from_filename(file)
        song.save
end
 
    def self.destroy_all
    @@all.clear
end

def save
    @@all << self
end


    def artist=(artist)
        @artist = artist
        self.artist.add_song(self)
    end
    
end
