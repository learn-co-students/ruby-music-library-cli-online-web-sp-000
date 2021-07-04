class Genre extend Concerns::Findable
  attr_accessor
  @@all = []
  def initialize (name)
    @name = name
    @songs = []
  end
  def name=(name)
    @name = name
  end
  def name
    @name
  end
  def save
    @@all << self
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def self.create (name)
    genre = Genre.new(name)
    genre.save
    return genre
  end
  def songs
    @songs
  end
  def artists
    artist_list = []
    @songs.each {|song| artist_list << song.artist}
    return artist_list.uniq
  end
end
