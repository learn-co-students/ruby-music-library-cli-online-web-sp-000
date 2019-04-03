class Genre 
  extend Concerns::Findable 
  attr_accessor :name, :songs 
  
  @@all = [] 
  
  def initialize(name) 
    @name = name 
    @songs = [] 
    
    save 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
     self.all.clear 
   end 
   
   def save 
     @@all << self 
   end 
   
   def self.create(string) 
     new_genre = Genre.new(string) 
   end 
   
    def add_songs(songs) 
    self.songs << song unless song.include?(song) 
    song.artist = self if song.genre.nil?  
  end
  
  def artists 
    artists = self.songs.collect do |song| 
      song.artist 
    end 
    artist.uniq 
  end 
end 
    