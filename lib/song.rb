require_relative '../lib/concerns/Findable.rb'
require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist,:genre
  @@all=[]
  def initialize(name,artist=nil,genre=nil)
    @name=name
    @genre=genre
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    save
  end
  
  def self.all
    @@all
  end
  
  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end
  
  def save
    @@all<< self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song=Song.new(name)
    song
  end
  def self.new_from_filename(filename)
    #"Thundercat - For Love I Come - dance.mp3"
    
    artist=Artist.find_or_create_by_name(filename.split(" - ")[0])
    song=filename.split(" - ")[1]
    genre=Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
    
    if(self.find_by_name(song))
      self.find_by_name(song)
    else
      self.new(song, artist, genre)
    end
    
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
#[#<Song:0x0000000002bed190 @name="kiki", @genre=nil, @artist=#<Artist:0x0000000002c06190 @name="Drake", @songs=[#<Song:0x0000000002bed190 ...>]>>]
#learn spec/004_songs_and_artists_spec.rb
