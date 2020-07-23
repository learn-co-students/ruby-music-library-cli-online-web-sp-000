class MusicImporter
  attr_reader :path, :files
  
  def initialize(path)
    @path = path
  end
  
  def files
    file_names = "#{@path}/*.mp3"
    @files = Dir.glob(file_names)
    a = @files.collect do |f| 
      f.gsub("#{@path}/", "") 
    end
 
  end
    
  def import
    files.each {|file| Song.create_from_filename(file)}
  end

  
end