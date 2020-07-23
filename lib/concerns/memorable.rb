module Memorable
  module ClassMethods #- operate on the class as a whole

#the song class should be able to empty its @@all array via the class method destroy all.
    def destroy_all
      self.all.clear
  #.clear method removes all the elements of the given array and returns the array with no elements.
    end

#all classes should implement a custom constructor .create that instantiates an instance using .new but also invokes
#.save on that instance.
    def create(name)
      object = self.new(name).tap do |object|
  #.tap allows you to do something with an object inside of a block.
  #the block returns the object itself.
        object.save
      end
    end

#filename method to
    def split_filename(filename)
#iterate through each song/file
#split the filenames by - and return (via tap) a new object (song object)
#returns a new string of songs without mp3 character
      song = filename.split(" - ").tap do |song|
      song[2].chomp!(".mp3")
#.chomp! returns a new string and also removes chars
      end
    end
  end

#instances should respond to a save method that adds the instance itself into the appropriate @@all class variable.
  module InstanceMethods #- operate on an object/ has access to instance variables

    def save
#adds the Artist, Genre, and Song instances to the @@all class variable
      self.class.all << self
    end
  end
end

#why is save an instance method if it is working on the class Variables?
