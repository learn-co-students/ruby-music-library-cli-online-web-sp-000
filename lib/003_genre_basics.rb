class Genre
    
    @@all = []
    
    attr_accessor :name
    
    def initialize(name)
        @name = name
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

    def self.create(mygenre)
        self.new(mygenre).save
        self
    end
end
