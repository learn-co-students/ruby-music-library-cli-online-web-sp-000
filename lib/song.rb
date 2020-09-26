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




def self.new_by_filename(file)
    row = file
        data = row.split(" - ")
          artist_name = data[0]
          song_name = data[1].delete_suffix(".mp3").strip
          song = Song.new(song_name)
          song.artist_name = artist_name
          song
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

    #binding.pry
end
