class Song
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :artist, :genre    
       
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        
        if artist != nil 
            self.artist= (artist)
        end
        if genre != nil 
            self.genre= (genre) 
        end
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

    def self.create (name)
      song = Song.new(name)
      song.save
      song
    end

    def artist=(artist)
		@artist = artist 
		artist.add_song(self)
	  end

	  def genre=(genre)
        @genre = genre        
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.new_from_filename(path)
        title= path.split(" - ")[1]
        artistName = path.split(" - ")[0]
        genre = path.split(" - ")[2].split(".mp3").join
        artist = Artist.find_or_create_by_name(artistName) 
        genre = Genre.find_or_create_by_name(genre)
        self.new(title, artist, genre)        
    end

    def self.create_from_filename (path)
        self.new_from_filename(path).save
    end
      
end