require 'rubygems'
require 'net/scp'
require 'ruby-growl'

require 'growl-transfer/gt_scp.rb'


module GrowlTransfer
  
  DEFAULTS = {
    'output'    => STDOUT,
    'local'     => "."
  }
  
  def self.Download(remote, local)
    gd_scp = GTScp.new
    gd_scp.download(remote, local)
  end
  
end