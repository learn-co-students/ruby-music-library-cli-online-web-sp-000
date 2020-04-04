class Genre
  extend Concerns::Findable
  @@all = []
  attr_accessor :name
  attr_reader :songs

  #Hook
  def initialize(name)
    @name = name
    @songs = []
  end

  #Class methods
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

  #Instance methods

  def save
    self.class.all << self
  end

  def artists
    self.songs.collect {|inst| inst.artist}.uniq
  end

end
