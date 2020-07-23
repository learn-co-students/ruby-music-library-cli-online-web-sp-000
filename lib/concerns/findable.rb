#Concerns::Findable extracts common functionalities from the song, artist, genre models.
#Add module Concerns::Findable to Genre and Artist class. after attr_accessor.
#Module: a set of behaviors. You cannot instantiate instances of a module.

#Modules are used when methods are in both classes
module Concerns::Findable
def find_by_name(name)
#Iterate over the @@all array.
#Comparing name attribute of every artist to the name that was passed into this method, returns first artist from @@all that makes the statement true. finding an artist by a name.
#Uses .all method defined by the class to find an instance of the class by name
self.all.detect {|song| song.name == name}
#.Detect is an enumerable method that returns the first element that returns true.
#Which satisfies the given condition in the block.
#Finds a song instance in @@all by the name property of the song.
end

def find_or_create_by_name(name)
#The .all method defined by the class to find an instance of the class by name and to create a new instance if a match is not found.
self.find_by_name(name) || self.create(name)
#Returns (does not recreate) an existing song with the provided name if one exists in @@all
end


end

#question: Why is this in a module when these methods are only in the song class?
#what does it mean to say "isn't hard-coded?"
