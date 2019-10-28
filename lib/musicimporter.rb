class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  
  def files
    Dir["#{@path}/*"].collect { |fpath| File.basename(fpath)  }
  end
  
  def self.import
  end

  
  
end