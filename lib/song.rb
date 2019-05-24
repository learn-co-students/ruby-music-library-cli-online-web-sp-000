class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
      if artist && genre
        self.artist=(artist)
        self.genre=(genre)
      elsif artist 
        self.artist=(artist)
      elsif genre
        self.genre=(genre)
      else
        @artist = artist
        @genre = genre
      end
    save << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all
  end

  def self.create(name)
    song = Song.new(name)
    song
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    already_exist = self.find_by_name(name) 
    if already_exist.nil?
      self.create(name)
    else
      return already_exist
    end
  end

end