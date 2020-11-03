class MusicImporter

  attr_accessor :path

  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).find_all {|f| f.size > 2}
  end

  def import
    files.each {|e| Song.create_from_filename(e)}
  end

end
