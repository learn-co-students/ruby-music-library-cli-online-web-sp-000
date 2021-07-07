require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path

  end

  def files
    # @files ||=
    Dir.glob("#{path}/*.mp3").collect do |f|
       f.gsub("#{path}/", "")
    end
  end

  def import
    files.each {|i| Song.create_from_filename(i)}
  end

end
