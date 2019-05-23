class Song
  attr_accessor :name
  attr_reader :artist
  
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist

    #artist(artist)

    # @artist = artist
      
    #   if !artist.nil?
    #     self.artist(artist)
    #   else
    #     @artist = artist
    #   end
    # save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
     @@all << self     
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)

    # if artist.nil?
    #   @artist = artist
    # else
    #   @artist = artist
    #   artist.add_song(self) unless artist.songs.include?(self)
    # end
  end

end