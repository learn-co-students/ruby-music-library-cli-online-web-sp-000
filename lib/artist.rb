class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    created_artist = Artist.new(name)
    @@all << created_artist
    created_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  def genres
    @genres = []
    @songs.each do |song|
      unless @genres.include?(song.genre) #if genres does not include song.genre
        @genres << song.genre  #add genre to the genres list
      end
    end
    @genres
  end



end
