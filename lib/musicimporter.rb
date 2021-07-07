require 'pry'
class MusicImporter

  include Concerns::Meth

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def import
    files.each {|x| Song.create_from_filename(x)}
  end

end
