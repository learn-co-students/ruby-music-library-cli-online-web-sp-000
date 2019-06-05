class Song
  attr_accessor :name
  attr_reader :artist
  
  def initialize(name,artist = "nil")
    @name = name
    @@all = []
    @artist = artist
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(new_song)
    song = Song.new(new_song)
    song.save
    song
  end


  def artist=(artist_object)
    artist_object.add_song(self)
    @artist = artist_object
  end
end

# dont know how to invoke Artist add_song method inside artist= method

# ---> mora dodat artist_object
# ---> mora dodat u @artist 


#    artist.song = self
#   @songs << artist
 
# Failures:

#  1) Associations — Song and Artist: Song #artist= invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
#     Failure/Error: expect(artist).to receive(:add_song)

#       (#<Artist:0x0000000002ffb9d0 @name="Neutral Milk Hotel", @songs=[]>).add_song(*(any args))
#           expected: 1 time with any arguments
#           received: 0 times with any arguments