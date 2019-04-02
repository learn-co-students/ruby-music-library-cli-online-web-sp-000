class MusicImporter

  attr_accessor :files, :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["spec/fixtures/mp3s/*.mp3"].each {|filename_with_path| filename_with_path.slice!("spec/fixtures/mp3s/")}
  end

  def import
    files.each{|file| Song.create_from_filename(file)}
  end

end
