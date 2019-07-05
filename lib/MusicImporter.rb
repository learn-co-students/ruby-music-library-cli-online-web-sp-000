class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    files_tmp = Dir.entries(@path)
    @files = []
    files_tmp.each do |file|
      if (File.basename(file) != ".." && File.basename(file) != ".")
        @files << File.basename(file)
      end
    end
    @files
  end
  def import
    files
    @files.each {|file| Song.create_from_filename(file)}
  end
end
