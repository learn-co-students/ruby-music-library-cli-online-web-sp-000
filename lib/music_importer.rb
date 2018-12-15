class MusicImporter
  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    Dir["#{self.path}/*"].map{|i| i.split("/").last}
  end

  def import
    files.each{|i| Song.create_from_filename(i)}
  end
end