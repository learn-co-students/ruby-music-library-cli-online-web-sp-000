
class Artist
  attr_accessor :name, :song
  extend Concerns::Findable
  @@all =[]

  def initialize(name)
  @name = name
  @songs = [] #creates a 'songs' property set to an empty array
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
    song.artist = self
  else
    nil
  end
  if @songs.include?(song)
    nil
  else
    @songs << song
  end
  song
  end

  def save
    @@all << self
    end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

def self.create (name)
self.new(name).tap {|i| i.save}
end

def genres
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.genre)
        nil
      else
        @new_array << song.genre
      end
    end
    @new_array
  end


end
