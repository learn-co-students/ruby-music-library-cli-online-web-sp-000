class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
   def files
    files = []
      Dir.new(self.path).each do |file|
        files << file if file.length > 5
      end
    files
  end
  
  def import
    # import FILES into the library by invoking Song.create_from_filename
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
  
end