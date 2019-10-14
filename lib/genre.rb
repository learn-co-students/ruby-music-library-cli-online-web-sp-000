class Genre < Music
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def artists
    songs.collect{ |song| song.artist }.uniq
  end

end

#rspec ./spec/005_songs_and_genres_spec.rb:16 # Associations — Song and Genre: Genre #songs returns the genre's 'songs' collection (genre has many song
