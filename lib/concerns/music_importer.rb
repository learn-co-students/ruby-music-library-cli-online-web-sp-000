class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").map { |str| str.gsub("#{path}/", "") }
  end

  def import
    files.each { |str| Song.create_from_filename(str) }
  end
end
