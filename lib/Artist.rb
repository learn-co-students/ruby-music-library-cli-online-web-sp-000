class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :genres
  @@all = [] #all the ARTISTS. not all songs..

  def initialize(name)
    @name = name
    @songs = [] #each artist has his own @songs array
  end

  def genres
    #goal: this is an instnace method. gives u all the genres of that artist instance.
    #we're gonna go to the Song class's "all" class method, whcih stores all songs.
    #say if the artist instnace is rihanna, we search for all songs with artist rihanna.
    #if the song has rihanna as artist, we take that song's genre and add it to our list.
    #thats our list of genres for the rihanna artist instance.
    genres = [] #we are making it a LOCAL variable, not instnace variable, on purpose
    #this proves we don't keep our own list. instead, we're finding our stuff through songs
    #one source of truth principle
    # @songs is all the song that belong to THIS artist.
    @songs.each do | song |
      genres << song.genre if !genres.include?(song.genre)
    end
    genres #return
  end

  def songs
    @songs
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song #add to this artist's songs collection
    end
    if song.artist == nil #in initialize, it's set to be nil unless artist is given
      song.artist = self
    end
  end



  def self.create(name)
    newartist = self.new(name) #self = class.
    newartist.save #instnace method on the artist instnace
    newartist
  end

  def save
    @@all << self
    #we don't autosave. only when this is called
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end


end #end class
