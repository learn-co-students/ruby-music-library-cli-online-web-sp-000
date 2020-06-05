#Concerns::Findable extracts common functionalities from the song, artist, genre models.
#add module Concerns::Findable to Genre and Artist class. after attr_accessor.


#modules are used when methods are in both classes
module Concerns::Findable
  def find_by_name(name)
    #uses .all method defined by the class to find an instance of the class by name
    self.all.detect {|song| song.name == name}
#detect is an enumerable method that returns the first element
#which satisfies the given condition in the block.
#finds a song instance in @@all by the name property of the song.
end

  def find_or_create_by_name(name)
    #.all method defined by the class to find an instance of the class by name and to create a new instance if a match is not found.
    self.find_by_name(name) || self.create(name)
    #returns (does not recreate) an existing song with the provided name if one exists in @@all
  end


end

#question: Why is this in a module when these methods are only in the song class?
#what does it mean to say "isn't hard-coded?"
