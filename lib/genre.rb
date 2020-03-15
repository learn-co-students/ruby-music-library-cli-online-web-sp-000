class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all=[]

  def initialize (name)
    @name=name
    @@all << self
    @songs=[]
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.clear
  end

  def self.count
    @@all.size
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

 def self.create (name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
   @songs
  end

  def artists
   songs.collect(&:artist).uniq
   # songs.collect {|song| song.artist}
end

end
