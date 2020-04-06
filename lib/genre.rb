class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name).tap {|genre| genre.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def artists
    artists = []
    songs.each do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end

end
