#Growl-Transfer

Growl-Transfer is a little gem for initiating downloads over the
command-line and receiving a notification when they complete.  You don't
have to 
watch curl or scp as they slowing trickel down the bits, and no worring
about getting destracted by something shinny only to forget you needed
that 120MB database dump only to find
later it's been ready for an hour.  Growl Transfer wraps scp (soon
others) and sends a Growl notice when the transfer is done.  


##Installation
Growl-Transfer requires [Growl][1] to be installed first.

    gem install growl-transfer
    
Then, in Growl's preferences, enable "Listen for incoming notifications" and "Allow remote application registration".  
Growl-Transfer sends growl notifications to "localhost" and needs these options enabled to function.  (Password support coming...'soon')

!["Growl Preferences"](http://ctshryock.com/static/images/growl-transfer-prefs.png)

##Features

- Download files using ssh
- Keyless and password based authentication supported
- Much more coming soon...

##Bugs and feature requests

Please file bugs and feature requests at the [Lighthouse project for Growl-Transfer][2]

##Contributing to Growl-Transfer
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

##Copyright

Copyright (c) 2011 Clint Shryock. See LICENSE.txt for
further details.

[1]: http://growl.info/
[2]: http://ctshryock.lighthouseapp.com/projects/68720-growl-transfer/tickets
