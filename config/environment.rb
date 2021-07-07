require 'bundler'
Bundler.require

module Concerns

end

require_all 'lib/concerns' #fixes what I think is a load order issue
require_all 'lib'
