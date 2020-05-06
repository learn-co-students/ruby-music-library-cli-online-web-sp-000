class Genre
    extend Persistable::ClassMethods 
    extend Concerns::Findable 
    include Persistable::InstanceMethods 
    
    @@all = []

    attr_accessor :name 
    attr_reader :songs 

    def initialize(name)
        @name = name 
        @songs = []
    end     

    def self.all 
        @@all 
    end     
    
    def self.create(name)
        new_genre = Genre.new(name)
        new_genre.save 
        new_genre
    end     
    
    def artists
        songs.collect{ |s| s.artist }.uniq
      end
end     