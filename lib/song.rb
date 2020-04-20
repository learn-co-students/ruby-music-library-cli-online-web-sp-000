require "pry"

class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    Song.new(name).save
    Song.all.last
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
    
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.find_by_name(name)
    @@all.find {|songs| songs.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      Song.create(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2].split(".")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  
# binding.pry
  
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

# require "pry"

# class Song
  
#   attr_accessor :name, :artist, :genre
  
#   @@all = []
  
#   def initialize(name, artist = nil, genre = nil)
#     @name = name
#     if artist != nil
#       self.artist=(artist)
#     end
#     if genre != nil
#       self.genre=(genre)
#     end
#   end
  
#   def self.all
#     @@all
#   end
  
#   def save
#     @@all << self
#   end
  
#   def self.destroy_all
#     @@all.clear
#   end
  
#   def self.create(name)
#     Song.new(name).save
#     self
#   end
  
#   def artist=(artist)
#     @artist = artist
#     artist.add_song(self)
#   end
  
#   def genre=(genre)
#     @genre = genre
#     genre.add_song(self)
#   end
  
#   def self.find_by_name(name)
#     @@all.find {|songs| songs.name == name}.class
#   end
  
#   def self.find_or_create_by_name(name)
#       if self.find_by_name(name) == NilClass
#         self.create(name)
#       else
#         @@all.find {|songs| songs.name == name}.class
#     end
#   end
  
#   def self.new_from_filename(filename)
#     song_name = filename.split(" - ")[1]
#     artist_name = filename.split(" - ")[0]
#     genre_name = filename.split(" - ")[2].split(".")[0]
#     artist = Artist.find_or_create_by_name(artist_name)
#     genre = Genre.find_or_create_by_name(genre_name)
#     self.new(song_name, artist, genre)
#   end
  
# # binding.pry

# end

