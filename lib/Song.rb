class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize (name, new_artist = nil, genre = nil)
    @name = name
    if (new_artist != nil)
      self.artist=new_artist
    end
    if (genre != nil)
      self.genre = genre
    end
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
    song = Song.new(name)
    song.save
    return song
  end
  def artist=(new_artist)
    new_artist.add_song(self)
  end
  def genre=(new_genre)
    @genre = new_genre
    if (!@genre.songs.any? { |song| song === self  })
      @genre.songs << self
    end
  end
  def self.find_by_name(name)
    song = @@all.find {|song| song.name === name}
    return song
  end
  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if (song != nil)
      return song
    else
      song = Song.create(name)
      return song
    end
  end
  def self.new_from_filename(file_name)
    parsed = file_name.split(" - ")
    song = Song.find_or_create_by_name(parsed[1].strip)
    song.instance_variable_set(:@artist, Artist.find_or_create_by_name(parsed[0].strip))
    tmp = parsed[2].split(".")
    song.genre = Genre.find_or_create_by_name(tmp[0].strip)
    return song
  end
  def self.create_from_filename(file_name)
    song = Song.new_from_filename(file_name)
    song.save
    return song
  end
end
Song.new_from_filename("Artist - Song - Genre.mp3")
