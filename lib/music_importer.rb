require "pry"

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    #  @files ||= Dir.glob("#{path}/*.mp3").select{ |f| File.file?(f) }.map{ |f| File.basename f } #or simply f
    #@files ||= Dir.each_child(path).map {|file| file} # or `File.basename file`
    Dir.entries(path) - %w[. ..]

    #Dir.entries(path) - %w[. ..] #entries gives you just file name, strips away the path, %w creates an array which we want as a return value and the [. ..] deletes those two directory elements from the array.
  end

  def import
    files.each { |filename| Song.create_from_filename(filename) }
  end
end
