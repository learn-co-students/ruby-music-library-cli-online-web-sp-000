require 'pry'


#the big Kaaaahuna
class Song


  #this is the hub to the wheel connects artist and genre together
  @@all = []
  attr_reader :artist, :genre
  attr_accessor :name


  #initialize as normal, but sets the default values on artist and genre as nil
  #essentially to make them an optional input, then checks if those are present
  #and assignes them as needed
    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
      save
    end


    #class methods
    def self.all
      @@all
    end

    def self.destroy_all
      @@all = []
    end

    def self.create(name)
      Song.new(name)
    end


    #custom constructors for name artist and genre which link them @ the same time
    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
    end

    def name=(name)
      @name = name
    end


    #instance methods
    def save
      @@all << self
    end

    def self.find_by_name(name)
      @@all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

    #parsing the file, checks for the hyphens and removes mp3, sets parsed info
    #as variable to use to create all of the expressed elements, sets up a new
    #connects song to the MusicImporter w/o touching artist or genre
    def self.new_from_filename(filename)
      name = filename.split(" - ")[1]
      artist = filename.split(" - ")[0]
      genre = filename.split(" - ")[2].gsub(".mp3", "")
      artist_name = Artist.find_or_create_by_name(artist)
      genre_name = Genre.find_or_create_by_name(genre)
      new(name, artist_name, genre_name)
    end

    def self.create_from_filename(filename)
      self.new_from_filename(filename)
    end





#thisone
end
