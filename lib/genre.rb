class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
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
      genre_name = Genre.new(name)
      genre_name.save
      genre_name
    end

    def artists
      self.songs.collect {|song| song.artist}.uniq
    end
end
