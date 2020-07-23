class Song
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.new_from_filename(file)
    s = self.find_or_create_by_name(file.split(" - ")[1])
    s.artist = Artist.find_or_create_by_name(file.split(" - ")[0])
    s.genre = Genre.find_or_create_by_name(file.split(" - ")[2].gsub(".mp3", ""))
    s
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
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

end
