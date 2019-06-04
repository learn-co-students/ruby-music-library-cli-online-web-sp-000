class Song

  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @@all
    self.artist=(artist) if artist != nil
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
   self.new(name).tap do|song|
     song.save
   end
 end

 def artist=(artist)
   @artist = artist
   artist.add_song(self)
 end

end
