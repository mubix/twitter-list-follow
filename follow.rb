#!/usr/bin/env ruby                                                                                                                                                 
                                                                                                                                                                    
require 'twitter'                                                                                                                                                   

## Get these here: https://developer.twitter.com/en/portal/dashboard
## Make sure you change your app to be Read/Write or the follows will fail
## You do that in the "User authentication settings"

# App Access Tokens
key = ''
secretkey = ''
bearer = ''

# User Access Tokens
access_token = ''
access_secret = ''

client = Twitter::REST::Client.new do |config|
  config.consumer_key    = key
  config.consumer_secret = secretkey
  config.bearer_token    = bearer
  config.access_token = access_token
  config.access_token_secret = access_secret
end

f = File.open('userlist.txt')

f.each_line do |line|
  parts = line.split('ID: ')
  id = parts[1].to_i
  name = parts[0].split('User: ')[1][0...-3]
  begin
    puts("Trying to follow user: #{name}, #{id}")
    friends = client.friendship(client.user, id)
    if friends.source.following?
      puts("Already following #{name}... skipping!")
      next
    else
      client.follow(id)
    end
  rescue Twitter::Error::TooManyRequests => e
    reset = e.rate_limit.reset_in + 3
    puts("Too many requests... sleeping for #{reset} seconds...")
    reset.times { |i| print("."); sleep(1)}
    retry
  rescue Exception => e
    puts("Failed to follow #{name} because of #{e}")
  end
  puts("Sleeping for 10")
  sleep(10)
end
