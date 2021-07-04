class Artist extend Concerns::Findable
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
    artist = Artist.new(name)
    artist.save
    return artist
  end
  def songs
    @songs
  end
  def add_song (new_song)
    new_song.instance_variable_set(:@artist, self)
    if (!@songs.any? { |song| song === new_song })
      @songs << new_song
    end
  end
  def genres
    genre_list = []
    @songs.each do |song|
      genre_list << song.genre
    end
    return genre_list.uniq
  end
end
