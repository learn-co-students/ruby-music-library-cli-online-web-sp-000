class Song
  attr_accessor :name, :artist
  @@ all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    return @@all
  end

  def self.destroy_all
    return @@all.clear
  end

end
