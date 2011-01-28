module GrowlTransfer
  class GTScp
    def initialize(output)
      @output = output
    end
    
    def download(remote, local_path)
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
      
      Net::SCP.start(server, user) do |scp|
        scp.download!(params[1], local_path, {:recursive => true, :verbose => true}) do |ch, name, sent, total|
          # => progress?
        end
      end
      @output.puts "Finished!"
      g = Growl.new "localhost", "GrowlTransfer",
                    ["GrowlTransfer Notification"]
      g.notify "GrowlTransfer Notification", "#{file}",
               "Download complete"
    end
    
  end
end