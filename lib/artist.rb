# The requirements for each model are that they can
# accept a name upon initialization and set that property correctly.
# The name property should be readable and writable by the object.
# Additionally, each class should contain a class variable @@all that is set
# to an empty array and is prepared to store all saved instances of the class.
# This class variable should be accessible via the class method .all
# The class should be able to empty its @@all array via a class method .destroy_all.
# Finally, all classes should implement a custom constructor .create that instantiates
# an instance using .new but also invokes #save on that instance, forcing it to persist
# immediately.

class Artist
  attr_accessor :name, :song, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist 
    @songs << song unless @songs.include?(song)
  end

  def genres
    # returns a collection of genres for all of the artist's songs (artist has many genres through songs)
    # genres does not return duplicate genres if the artist has
    # more than one song of a particular genre
    # binding.pry
    self.songs.collect do |song|
      song.genre
    end.uniq
  end

end
