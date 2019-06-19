class Genre
  extend Concerns::Findable
  include Concerns::Nameable
  include Concerns::Instance_all
  extend Concerns::Class_all
  attr_accessor :songs
  attr_reader :name
  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  # def name
  #   @name
  # end
  #
  # def name=(name)
  #   @name = name
  # end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

  # def self.destroy_all
  #   @@all.clear
  # end
  #
  # def save
  #   @@all << self
  # end
  #
  # def self.create(genre)
  #   instance = Genre.new(genre).tap do |i|
  #     i.name = genre
  #     i.save
  #   end
  # end

end
