class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    #iterate through the path
    #retrieve all files
    #gsub the file name
    #return edited filename
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{|file| Song.create_from_filename(file)}
  end
end
