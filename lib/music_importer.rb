class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    files_no_subdir = Dir.entries(@path).select {|f| !File.directory? f}
    files_no_subdir.each {|filename| @files << filename }
    @files
  end

  def import
    files.each {|filename| Song.create_from_filename(filename) }
  end



end
