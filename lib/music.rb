class Music
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name  = name
  end

  def self.all
    @@all
  end

  def self.save
    @@all << self
  end

  def destroy_all
    @@all.clear
  end

  def create(name)
    self.new(name).save
  end
end
