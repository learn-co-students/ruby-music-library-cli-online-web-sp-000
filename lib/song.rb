#require_relative "../lib/music.rb"

class Song 

attr_accessor :name, :artist, :genre  

@@all = []

def initialize(name, artist_given = '', genre_given = '')

    @name = name
  
  
  if artist_given != ''
    artist = artist_given
    artist_given.add_song(self)
  end
  
    if genre_given != ''
    genre = genre_given
    genre_given.add_song(self)
  end
end


def Song.create(name)
    Song.new(name).tap {|song| song.save}
end


def save
  @@all << self
end

def self.artist
  @artist
end


def genre=(genre)
  @genre = genre 
  genre.add_song(self)
end
  
def artist=(artist)
     @artist = artist
      artist.add_song(self) 
end
  

def self.destroy_all
  @@all.clear
end

def self.all
  @@all
end

def Song.find_by_name(name)
self.all.find {|song| song.name == name}
end 


  def self.name 
    @name
  end
  
def Song.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
end

   def self.new_from_filename(filename)
     elements = filename.split(" - ")
    artist_name, song_name, genre_name = elements[0], elements[1], elements[2].chomp(".mp3")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

 def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |song| song.save }
  end

end