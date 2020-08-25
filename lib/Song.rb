require 'pry'
class Song
  attr_accessor :name
  attr_reader  :artist, :genre
  @@all = [] #all songs

  def initialize(name, theartist = nil, thegenre = nil)
    @name = name
    if theartist != nil #this is needed to prevent rerors
      self.artist=(theartist)
    end
    #need self.artist otherwise it thinks u want to set the argument as the argument
    if thegenre != nil
      self.genre=(thegenre)
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) #add song to the artist's songs array
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) #add song to the artist's songs array
  end

  def self.new_from_filename(filename)
    #filename format: Thundercat - For Love I Come - dance.mp3
    filename.slice! ".mp3"
    #returns the trashed piece and nil if nothing was cut. the original filename is forever modified
    artistandsongandgenre = filename.split(" - ") #ex: [ "taylor swift", "blank space" - "pop"]
    #make new song instnace but no saving
    newsong = self.find_or_create_by_name(artistandsongandgenre[1])
    #it will either return new song or old song.
    #we assume we never run in the situation of diff songs by diff artist with same song name
    #if this assumption fails, the new artist and genre will  override the old ones


    #we have to make sure no duplications of artist/genre instances.
    # only create new if the artist and genre don't already exist
    newsong.artist= Artist.find_or_create_by_name(artistandsongandgenre[0]) #artist's class method
    newsong.genre= Genre.find_or_create_by_name(artistandsongandgenre[2])
    #ex: Genre.find_or_create_by_name("pop").
    #if pop genre doesnt exist it will create, otherwise it returns the pre-existing pop instance

    newsong
  end

  def self.create_from_filename(filename)
    newsong = self.new_from_filename(filename)
    ####no need to add another save. nwe from filename use class.create to create, so it has a save thing already
  end

  def self.find_by_name(name) #CLASS METHOD
    @@all.find do | song |
      song.name == name
    end
  end

  def self.find_or_create_by_name(name) #CLASS METHOD
    searchresult = self.find_by_name(name)
    # binding.pry
    if searchresult
      return searchresult
    else #aka nil
      self.create(name) #aka Song.create
    end
  end

  def self.create(name) #class method
    newsong = self.new(name) #self = class.
    newsong.save #instnace method on the song instnace
    newsong
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


# hi = Song.new("sweet dreams", "beyonce")
