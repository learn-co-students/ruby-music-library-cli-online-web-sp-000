class MusicImporter
  def initialize(path)
    @path = path
    @files = Dir.children(@path)
  end

  def path
    @path
  end

  def files
    @files
  end

  def import
    @files.each {|file| Song.create_from_filename(file)}
  end
end
