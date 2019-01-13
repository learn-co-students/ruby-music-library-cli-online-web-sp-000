class Song
  extend Concerns::Findable


  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    @artist = artist
    self.artist = artist if artist
    self.genre = genre if genre
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
     song_name = Song.new(name)
     song_name.save
     song_name
   end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(name)
      self.all.find {|song| song.name == name}
    end

    def self.create_by_name(name)
      song = Song.create
      song.name = name
      song
    end

    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end


end
