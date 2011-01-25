class Output
  def messages
    @messages ||= []
  end
  
  def puts(message)
    messages << message
  end
end

#
# Start SCP steps
#
def output
  @output ||= Output.new
end

Given /^I have an available server "([^"]*)"$/ do |remote_host|
  @server = remote_host
end

When /^"([^"]*)" as the file name$/ do |remote_file|
  @file = remote_file
end

When /^I run "([^"]*)"$/ do |arg1|
  gd_scp = GrowlDown::GDScp.new(output)
  gd_scp.download('one', 'two')
end

Then /^I should see "([^"]*)"$/ do |status|
  output.messages.should include(status)
end