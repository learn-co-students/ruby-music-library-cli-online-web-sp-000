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
   @genre = genre
   genre.songs << self unless genre.songs.include?(self)
 end

 # def self.find_by_name(name)
 #    self.all.detect{|song| song.name == name}
 # end

 # def self.find_or_create_by_name(name)
 #      #  returns (does not recreate) an existing song with the provided name if one exists in @@all
 #   if find_by_name(name) == nil
 #     create(name)
 #   else
 #     find_by_name(name)
 #   end
 # end

end
