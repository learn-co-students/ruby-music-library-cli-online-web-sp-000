class Song
  extend Concerns::Findable
  extend Concerns::Alphabetical
  
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def artist=(artist)
    if self.artist == nil
      @artist = artist
      artist.add_song(self)
    end
  end
  
  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end
  
  def self.new_from_filename(filename)
    split_filename = filename.split(" - ")
    dot_mp3 = split_filename[2].split(".")
    split_filename.pop
    split_filename << dot_mp3[0]
    artist = Artist.find_or_create_by_name(split_filename[0])
    song_name = split_filename[1]
    genre = Genre.find_or_create_by_name(split_filename[2])
    song = self.new(song_name, artist, genre)
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end