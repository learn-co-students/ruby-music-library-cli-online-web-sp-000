# The requirements for each model are that they can
# accept a name upon initialization and set that property correctly.
# The name property should be readable and writable by the object.
# Additionally, each class should contain a class variable @@all that is set
# to an empty array and is prepared to store all saved instances of the class.
# This class variable should be accessible via the class method .all
# The class should be able to empty its @@all array via a class method .destroy_all.
# Finally, all classes should implement a custom constructor .create that instantiates
# an instance using .new but also invokes #save on that instance, forcing it to persist immediately.

class Song
  extend Concerns::Findable
  attr_reader :artist, :genre
  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

 def artist=(artist)
   @artist = artist
   artist.add_song(self)
 end

 def genre=(genre)
   genre.songs << self unless genre.songs.include?(self)
   @genre = genre
 end

 def self.new_from_filename(filename)
   song_artist, song_name, song_genre = filename.chomp(".mp3").split(" - ")
   song = self.new(song_name)
   song.artist = Artist.find_or_create_by_name(song_artist)
   song.genre = Genre.find_or_create_by_name(song_genre)
   song
 end

 def self.create_from_filename(filename)
   song = new_from_filename(filename)
   song.save 
 end

end
