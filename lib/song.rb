class Song
    attr_accessor :name, :artist, :genre 
   
    
      extend Concerns::Findable
      @@all = []
      def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist if artist 
      self.genre = genre if genre
      
  
     
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
     # binding.pry
      artist.add_song(self)
      
    end 
    def genre=(genre)
      @genre = genre 
      genre.songs << self unless genre.songs.include?(self)
      #binding.pry 
    end 
  
  
    def self.new_from_filename(filename)
      #binding.pry
      name = (filename.split(" - ")[1])
      artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
      genre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3",""))
      song = Song.new(name, artist, genre)
      #binding.pry
      
      song
    end
    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
      song
  
    end 
  
  end 
  