class Song
    
    @@all = []
    
    attr_accessor :name#, :artist
    attr_reader :artist

    def initialize(name,art=nil)
        @name = name
        if art != nil
            artist
        end
    end
    
    def artist=(artist)
        artist.add_song(self)
    end
    
    def save
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(mysong)
        self.new(mysong).save
        self
    end

end
