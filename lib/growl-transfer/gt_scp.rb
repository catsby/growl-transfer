module GrowlTransfer
  class GTTransferObjet
    def initialize
      @output = GrowlTransfer::DEFAULTS[:output]
    end    
  end
  
  class GTScp < GTTransferObjet

    def download(remote, local_path, username = nil, password = nil)
      @output.puts "Downloading #{remote}"            
      params = remote.split(":")
      file = params.last.split("/").last

      if params[0].include? '@' 
        server = params[0].split('@').last
        user   = params[0].split('@').first
      else
        server = params[0]
        user   = ENV['USER']
      end
      
      user = username unless username.nil?
      
      Net::SCP.start(server, user, :password => password) do |scp|
        scp.download!(params[1], local_path, {:recursive => true, :verbose => true}) do |ch, name, sent, total|
          # => progress?
        end
        @output.puts "Finished!"
      end
      g = Growl.new "localhost", "GrowlTransfer",
                    ["GrowlTransfer Notification"]
      g.notify "GrowlTransfer Notification", "#{file}",
               "Download complete"
    end
    
  end
end