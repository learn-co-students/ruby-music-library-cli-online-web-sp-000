class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    # reaches into directory to "glob" all files ending in mp3 => *.mp3
    # reaches specifically into the path given to "glob" files ending in .mp3s
    # collects all the files, where each file's path is removed
    @files = Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    self.files.each {|f| Song.create_from_filename(f)}
  end

end
