class Artist 
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
    @songs = []
  end
  
  def save
    @@all << self
  end 
  
  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end
  
  def self.all #class reader
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end
  
  # def self.find_by_name(name)
  #   @@all.detect{|artist| artist.name == name}
  # end
  
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