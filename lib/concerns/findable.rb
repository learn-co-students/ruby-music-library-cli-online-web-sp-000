module Concerns::Findable
    def find_by_name(name)
        self.all.detect{|s| s.name == name}
    end

    def find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end

    def self.create(name)
        new(name).save
    end

    def save
        self.class.all << self
        self
    end
    
end