class Song
  attr_accessor :name, :artist, :genre
  
  extend Modules::ClassMethods
  include Modules::InstanceMethods
  extend Concerns::Findable
  
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    super()
    @name = name
    self.artist = artist if !!artist
    self.genre = genre if !!genre
  end
  
  def self.all
    @@all
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(name)
    name = name.split(" - ")
    name.last.replace(name.last.split(".mp3").last)
    self.new(
      name[1],
      Artist.find_or_create_by_name(name[0]),
      Genre.find_or_create_by_name(name[2]))
  end

  def self.create_from_filename(name)
    self.new_from_filename(name)
  end
end