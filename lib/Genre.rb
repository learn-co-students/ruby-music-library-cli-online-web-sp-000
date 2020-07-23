require_relative "concerns/findable.rb"

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name = nil)
    if name !=nil
      @name = name
      @songs = []
    end
  end

def self.create(name)
  item = self.new(name)
  item.save
  item
end

def self.all
    @@all
end

def self.destroy_all
    @@all.clear
end

def name=(name)
    @name = name
end

def save
    @@all << self
end

def artists
    artists = []
    Song.all.each do |song|
      if song.genre == self
       artists << song.artist
       artists.uniq!
      end
    end
      artists
  end


end
