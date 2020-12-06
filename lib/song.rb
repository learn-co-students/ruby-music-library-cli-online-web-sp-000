class Song 
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    if(artist != nil)
      self.artist = artist 
    end
    if(genre != nil)
      self.genre = genre 
    end

    @name = name
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end


  def self.all 
    return @@all 
  end 
    
  def self.find_by_name(name)
    out = nil
    all.each do |song|
      if song.name == name 
        out = song 
      end 
    end
    return out
  end 
  
  def self.find_or_create_by_name(name)
    out = find_by_name(name)
    if(out == nil)
      out = Song.create(name)
    end 
    return out
  end
  
  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name = data[1]
    genre_name = data[2][0..-5]
    current_artist = Artist.find_or_create_by_name(artist_name)
    current_genre = Genre.find_or_create_by_name(genre_name)
    current_song = Song.new(song_name, current_artist, current_genre)
    return current_song
  end

  def self.create_from_filename(name)
    out = new_from_filename(name)
    all.push(out)
    return out
  end
  
    def to_string
      return "#{@artist.name} - #{@name} - #{@genre.name}"
    end

end
    
  