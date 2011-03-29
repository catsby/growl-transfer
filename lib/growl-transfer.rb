require 'rubygems'
require 'net/scp'
require 'ruby-growl'

require 'growl-transfer/gt_scp.rb'


module GrowlTransfer
  
  DEFAULTS = {
    :output    => $stdout,
    :action    => 'download'
  }
  
  def self.Download(opts = {})
    gd_scp = GTScp.new
    gd_scp.download(opts[:remote], opts[:local], opts[:username], opts[:password])
  end
  
end