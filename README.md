# Twitter - Follow All Members of a List

These two scripts basically attempt to follow all of the users
in a Twitter list. In particular, that's the "Infosec Under 2.5k" list
that [Frank McGovern](https://twitter.com/FrankMcG) has because it's
a great list of individuals who have under 2500 followers and are in
the Infosec Community.

Here is the list: https://twitter.com/i/lists/1380244569485406209

Because there is a 900 second (15 minute) rate limit, you need to set
this up in a TMUX or SCREEN session so that it works through the list
as fast as it can.

# Execution

1. Create an app on Twitter's developer portal: https://developer.twitter.com/en/portal/dashboard
2. Convert it to a Read/Write app by going into the User Authentication Settings for your app and turing it from Read Only to Read/Write
3. Install the dependancy: `gem install twitter`
4. Get the List members into a file: `ruby get_list_member.rb | tee -a userlist.txt`
5. Start following! `ruby follow.rb`
