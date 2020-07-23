require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect do |f|
      f.gsub("#{path}/", "")
    end
  end

  def import
    files.each do |instance|
      Song.create_from_filename(instance)
    end
  end

end
