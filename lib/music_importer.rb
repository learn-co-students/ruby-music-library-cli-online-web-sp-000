class MusicImporter
  attr_reader :path
  def initialize(file)
    @path = file
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect {|f| f.gsub("#{path}/", "")}
  end

  def import
    files.each{ |f| Song.create_from_filename(f)}
  end

end
