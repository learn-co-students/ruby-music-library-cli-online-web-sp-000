class Genre
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
    created_genre = Genre.new(name)
    @@all << created_genre
    created_genre
  end

  def songs
    @songs
  end

  def artists
    @artists = []
    @songs.each do |song|
      unless @artists.include?(song.artist) #if genres does not include song.genre
        @artists << song.artist  #add genre to the genres list
      end
    end
    @artists
  end


end
