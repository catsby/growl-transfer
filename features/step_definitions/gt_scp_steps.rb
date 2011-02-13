Before do
  FileUtils.mkdir(TEST_DIR)
  Dir.chdir(TEST_DIR)
end

After do
  Dir.chdir(TEST_DIR)
  FileUtils.rm_rf(TEST_DIR)
end

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

Given /^I have ssh keyless auth setup on "([^"]*)"$/ do |remote_host|
  @remote = []
  @remote << remote_host
end

Given /^specify "([^"]*)" as the file name$/ do |remote_path|
  @remote << remote_path
end

Given /^I specify "([^"]*)" as the username before the url$/ do |arg1|
  @remote[0] = 'clint' + '@' + @remote[0]
end

When /^I run "([^"]*)"$/ do |arg1|
  GrowlTransfer::DEFAULTS.merge!({'output'=>output})
  GrowlTransfer::Download(@remote.join(':'), TEST_DIR)
end

Then /^I should see "([^"]*)"$/ do |status|
  output.messages.should include(status)
end

Then /^TEST_DIR should contains "([^"]*)" file$/ do |arg1|
  File.file?([TEST_DIR, arg1].join('/'))
end