class Song
  attr_accessor :name
  @@all=[]
  
  def initialize(name,artist=nil,genre=nil)
    @name=name
    @artist=artist
    @genre=genre
    save
  end
   
   def artist=(artist)
     @artist=artist
     
   end
   
   def artist
     @artist
   end
   
   def genre=(genre)
     @genre=genre
   end
   
   def genre
     @genre
   end

  def save
    @@all<< self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song=self.new(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.detect{|song| song.name==name}
  end
  
  def self.find_or_create_by_name(name)
     if(self.find_by_name(name))
       self.find_by_name(name)
     else 
       self.create(name)
     end
  end
  

  
end

#learn spec/005_songs_and_genres_spec.rb
#learn spec/004_songs_and_artists_spec.rb
#learn spec/006_artists_and_genres_spec.rb
#learn spec/007_findable_songs_spec.rb