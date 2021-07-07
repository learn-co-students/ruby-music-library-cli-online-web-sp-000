class MusicImporter
  #initialize accepts a file path to a directory of MP3 files
  #path ="./db/mp3s"
  attr_accessor :path
  def initialize(path)
    @path = path
  end
   # retrieves the path provided to the MusicImporter object
  def files # returns all of the imported file namespaced
    # normalizes the filename to just the MP3 filename with no path
    Dir.entries(path).select{ |file| file.end_with?(".mp3") }
  end
  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
