class Genre
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :song, :artist

  def initialize(name)
    @name = name
    @songs = []
    # save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

# Instantiates an instance using .new, saves, returns new song
  def self.create(genre)
   genre = self.new(genre)
   genre.save
   genre
 end

   def artists
     self.songs.collect{|s| s.artist}.uniq
   end

 def songs
   @songs
 end

end
