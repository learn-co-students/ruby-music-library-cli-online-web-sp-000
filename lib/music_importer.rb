# Create a MusicImporter class that works with your Song, Genre, and Artist
# objects to import a directory of MP3 files. This class will have the following methods:

# initialize accepts a file path to a directory of MP3 files.
# files returns all of the imported filenames.
# .import imports all of the files from the library, instantiating a new Song object for each file.
# In addition, add the following pair of methods to your Song class:
#
# .new_from_filename, which instantiates a new Song object based on a provided filename.
# .create_from_filename, which does the same thing as .new_from_filename but also saves
# the newly-created song to the @@all class variable.

class MusicImporter
  attr_accessor :path

  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).reject {|file| file[0].include?(".")}
  end

  def import
    import_files = nil
    files.each do |file|
      import_files = Song.create_from_filename(file)
    end
    import_files
  end

end
