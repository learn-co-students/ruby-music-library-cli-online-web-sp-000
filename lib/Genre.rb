class Genre

extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name)
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def add_song(song)
  # song.genre = self unless song.genre == self
  # @songs << song unless @songs.include?(song)
    if song.genre == nil
      song.genre = self
    end
    if !@songs.include?(song)
      @songs <<song
    end
  end

  def artists
    @songs.map {|song| song.artist}.uniq
  end

end
