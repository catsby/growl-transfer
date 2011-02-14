$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'growl-transfer'
require 'fileutils'

TEST_DIR    = File.join('/', 'tmp', 'growl-transfer')

GT_PATH = File.join(ENV['PWD'], 'bin', 'gt')

def run_gt(opts = {})
  command = GT_PATH + ' ' + opts
  # command << " >> /dev/null 2>&1" if opts[:debug].nil?
  system command
end