class Song
  attr_accessor :name, :genre
  attr_reader :artist
  
  def initialize(name,artist = nil, genre = nil)
    @name = name
    @@all = []
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil

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


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
 # def genre=(song)
#    song.genre = self
#  end
end

# add songs to genre @songs array

# Failures:

#  1) Associations — Song and Genre: Song #genre= adds the song to the genre's collection of songs (genre has many songs)

#     Failure/Error: expect(genre.songs).to include(song)

#       expected [] to include #<Song:0x0000000002ffebd0 @name="In the AeroplaneOver the Sea", @genre=#<Genre:0x0000000002ffeb58 @name="indie rock", @songs=[]>>

#       Diff:
#       @@ -1,2 +1,2 @@
#       -[#<Song:0x0000000002ffebd0 @name="In the Aeroplane Over the Sea", @genre=#<Genre:0x0000000002ffeb58 @name="indie rock", @songs=[]>>]
#       +[]