require 'pry'
class MusicImporter
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir["#{@path}/*"].collect do |file| 
      file.partition(/(\/)(?!.*\/)/).last
    end
  end
  
  def import 
    files.each { |filename| Song.create_from_filename(filename) }
  end 
end 