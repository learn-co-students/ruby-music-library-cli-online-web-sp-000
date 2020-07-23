class MusicImporter
  attr_reader :path

  def initialize (filepath)
    @path = filepath
  end

  def files
    Dir.entries(self.path).delete_if {|e| e.size <= 2}
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
