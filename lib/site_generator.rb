class SiteGenerator
  attr_reader :path

  def initialize(path)
    @path = path
    FileUtils.mkdir_p path
  end

  def generate_index
#  HEREDOC
html = File.read("./lib/views/index.html")

  File.write("#{path}/index.html", html)
  end
end


#the content of the file in def generate_index
