class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
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
    genre = Genre.new(name)
    @@all << genre
    genre
  end

  def add_song(song)
    #@songs << song
    if !song.genre
      song.genre = self
    end

    if !@songs.include?(song)
      @songs << song
    end
  end

  def artists
    temp_genres = @songs.collect do |song|
      if song.artist
        song.artist
      end
    end
    temp_genres.uniq
  end

end
