class MusicImporter

  attr_accessor :path, :file_names
  
  def initialize(path)
    
    @path = path
    @file_names = files()

  end
  
  def path
    
    @path
    
  end
  
  def files
    
    Dir.glob("#{self.path}/*.mp3").collect{|file| file.split("#{path}/")[1]}
    
  end
  
  def import 
    
    @file_names.each {|file_name|Song.create_from_filename(file_name)}

    
    
  end

end