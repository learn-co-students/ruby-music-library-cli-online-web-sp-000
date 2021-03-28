class MusicImporter
  attr_accessor :path,:audio_files
  
  def initialize(filepath)
    @path = filepath
  end
  
  def files
    file = Dir["#{@path}/*.mp3"]
    @audio_files = file.map { |filename| filename.sub(/(.*)\//,"")}
  end
  
  def import
    files.each { |file| Song.create_from_filename(file) }
  end
  
end