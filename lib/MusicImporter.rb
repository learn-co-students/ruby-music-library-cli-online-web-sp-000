class MusicImporter

  # accepts a file path to parse MP3 files from
  def initialize(path)
    @path = path
  end

  # retrieves the path provided to the MusicImporter object
  def path
    @path
  end

  # loads all the MP3 files in the path directory
  # normalizes the filename to just the MP3 filename with no path
  def files
    Dir.entries(@path).reject { |f| File.directory?(f) }
  end

  # imports the files into the library by invoking Song.create_from_filename
  # instantiating a new Song object for each file
  def import
    files.each do |new_song|
      Song.create_from_filename(new_song)
    end
  end

end
