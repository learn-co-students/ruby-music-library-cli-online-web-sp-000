require_relative '../config/environment'
require 'irb'

def reload!
load './config/environment.rb'
end

IRB.start