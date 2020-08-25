class Genre
  extend Concerns::Findable #as class methods
  attr_accessor :name
  @@all = [] #all genres

  def initialize(name)
    @name = name
    @songs = [] #each genre has its own songs array
  end

  def artists
    #returns the artists that has at least one song in this genre
    #avoid duplicates
    artists = [] #we are making it a LOCAL variable, not instnace variable, on purpose
    #this proves we don't keep our own list. instead, we're finding our stuff through songs
    #one source of truth principle
    # @songs is all the songs of THIS genre
    @songs.each do | song |
      artists << song.artist if  !artists.include?(song.artist) #this if prevent duplicates
    end
    artists #return
  end

  def songs
    @songs
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song #add to this genre's songs collection
    end
    if song.genre == nil #in initialize, it's set to be nil unless artist is given
      song.genre = self
    end
  end


  def self.create(name)
    newgenre = self.new(name) #self = class.
    newgenre.save #instnace method on the genre instnace
    newgenre
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
