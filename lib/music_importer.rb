class MusicImporter

  attr_accessor :path, :files

  def initialize(file_path)
    @path = file_path
    @files = []
  end

  # loads all the mp3 files in the path directory
  def files
    files = Dir["#{@path}/*.mp3"]
    files.each do |filepath|
      # the filename is full path, strip the directory names
      # and only select the filename
      tokens = filepath.split("/")
      filename = tokens[tokens.length - 1]
      @files << filename
    end
    @files
  end

  def import
    self.files
    @files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
