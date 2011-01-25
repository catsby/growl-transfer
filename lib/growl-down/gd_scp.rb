module GrowlDown
  class GDScp
    def initialize(output)
      @output = output
    end
    
    def download(remote_host, remote_path)
      @output.puts "Downloading #{remote_host}"
      Net::SCP.start("ctshryock.com", "clint") do |scp|
        scp.download!("growl-down-test/unicorns.zip", Dir.pwd, {:recursive => true, :verbose => true}) do |ch, name, sent, total|
          #
        end
      end
      @output.puts "finished"
      g = Growl.new "localhost", "GrowlDown",
                    ["GrowlDown Notification"]
      g.notify "GrowlDown Notification", "#{remote_path}",
               "Download complete"
    end
    
  end
end