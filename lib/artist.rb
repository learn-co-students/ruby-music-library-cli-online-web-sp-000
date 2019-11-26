class Artist
  extend Concerns::Findable
attr_accessor :name, :songs

@@all = []

  def self.all #class reader
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.destroy_all
    self.all.clear
  end


  def self.create(name)
    song = self.new(name) #initialize new song
    song.save
    song
  end

  def add_song(songs)
    if songs.artist == nil
      songs.artist = self
    else
      nil
    end
    if @songs.include?(songs)
      nil
    else
      @songs << songs
    end
    songs
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
