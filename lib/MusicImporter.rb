class MusicImporter

  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    filename = Dir.children(@path)
    filename
  end
  
  def import
    list_of_filenames = self.files
    list_of_filenames.each do |filename| 
      Song.create_from_filename(filename)
    end
  end
  
end 