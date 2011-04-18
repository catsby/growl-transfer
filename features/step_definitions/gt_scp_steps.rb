Before do
  FileUtils.mkdir(TEST_DIR)
  Dir.chdir(TEST_DIR)
  @remote = []
  @options = {}
end

After do
  Dir.chdir(TEST_DIR)
  FileUtils.rm_rf(TEST_DIR)
  @remote.clear
  @options.clear
end

class Output
  def messages
    @messages ||= []
  end
  
  def puts(message)
    messages << message
  end
  
  def write(message)
    messages << message
  end
end

#
# Start SCP steps
#
def output
  @output ||= Output.new
end

Given /^I have ssh keyless auth setup on "([^"]*)"$/ do |remote_path|
  @remote << remote_path
end

Given /^specify "([^"]*)" as the file name$/ do |remote_path|
  @remote << remote_path
end

Given /^I specify "([^"]*)" as the username before the url$/ do |arg1|
  @remote[0] = 'clint' + '@' + @remote[0]
end

Given /^I have a valid password setup on "([^"]*)"$/ do |remote_path|
  @remote << remote_path
end

Given /^I specify the "([^"]*)" option$/ do |remote_host|
  @options[:password_flag] = '-p'
end

When /^I run "([^"]*)"$/ do |action|
  @options[:from] = @remote.join(':')
  @options[:to]   = TEST_DIR
  run_gt(@options)
end

Then /^I should see "([^"]*)"$/ do |status|
  output.messages.should include(status)
end

Then /^TEST_DIR should contain "([^"]*)" file$/ do |arg1|
  (File.file?([TEST_DIR, arg1].join('/'))).should == true
end
