require 'pry'

class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end
  
  def path
    @path
  end
  
  def files
    Dir.entries(@path).select! {|entry| entry.end_with?(".mp3")}
    # Dir.glob("#{path}/*").map { |file| file.gsub("#{path}/", '')}
  end
  
  def import 
# files.each { |file| Song.create_from_filename(file) }
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end