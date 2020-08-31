class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(inputSong)
    if (@songs.include?(inputSong))
      return
    end
    @songs << inputSong
    if (inputSong.artist != self)
      inputSong.artist = self
    end
  end

  def songs
    @songs
  end

  def genres
    genres = []
    @songs.each do | selectedSong |
      if !(genres.include?(selectedSong.genre))
        genres << selectedSong.genre
      end
    end
    return genres
  end


  def save
    @@all << self
  end

  def self.create(inputName)
    newArtist = Artist.new(inputName)
    newArtist.save
    return newArtist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end


end
