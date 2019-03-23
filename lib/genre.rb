class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs
  attr_reader :genre


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
    self.class.all << self
  end

  def self.create(new_genre)
    var = Genre.new(new_genre)
    var.save
    var
  end

  def artists
    self.songs.map {|x| x.artist}.uniq
  end



end
