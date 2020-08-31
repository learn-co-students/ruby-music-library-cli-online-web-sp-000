class Genre
  extend Concerns::Findable
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    if !(song.genre = self)
      song.genre = self
    end
  end

  def songs
    @songs
  end

  def artists
    artists = []
    @songs.each do | selectedSong |
      if !(artists.include?(selectedSong.artist))
        artists << selectedSong.artist
      end
    end
    return artists
  end

  def save
    @@all << self
  end

  def self.create(inputName)
    newGenre = Genre.new(inputName)
    newGenre.save
    return newGenre
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

end
