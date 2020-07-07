#class is a blueprint for the creation of objects
#All objects are bundles of data and logic––or attributes and behavior
# A class can also vbe considered an object

class Song

  extend Concerns::Findable

  #creates reader and writer
  attr_accessor :name
  attr_reader :artist, :genre
  # which is the same as

  # def name=(name) => writer
  #   @name = name
  # end

  # def name =>reader
  #  @name
  # end

  #class variable
  @@all = []

  #called upon at instantiation or the creation of an object
  def initialize(name, artist = nil, genre = nil)

  	#An instance variable is responsible for holding information regarding an
  	#instance of a class and is accessible only to that instance of the class
  	 @name = name
  	 self.artist = artist if artist
  	 self.genre = genre if genre
  end

  def artist=(artist)
  	@artist = artist
  	artist.add_song(self)
  end


  def genre=(genre)
  	@genre = genre
  	@genre.songs << self unless @genre.songs.include?(self)
  end

  def self.all
  	#A class variable is responsible for holding information regarding an
  	#the entire class not the instance of a class

  	#A class method is reponsible for enacting methods on itself and is reposnsible for the
  	#the entire class and not just instances of the class
  	@@all
  end

  def self.destroy_all
  	@@all = []
  end

  def save
  	@@all << self
  end

  def self.create(name)
  	@song = Song.new(name)
  	@song.save
  	@song
  end

  # def find_by_name(name)
  # end

  # def find_or_create_by_name(name)
  # end

  def self.new_from_filename(filename)
    artist, name, genre = filename.chomp(".mp3").split(" - ")
    # artist = filename.split("-")[0].strip
    # name = filename.split("-")[1].strip
    # genre = filename.split.last.chomp(".mp3")


    song = create(name)
    song.artist = artist_name(artist)
    song.genre = genre_type(genre)
    song
  end

  def self.artist_name(artist)
    Artist.find_or_create_by_name(artist)
  end

  def self.genre_type(genre)
    Genre.find_or_create_by_name(genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

end
