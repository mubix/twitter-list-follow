#!/usr/bin/env ruby

require 'twitter'

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

# Source: https://twitter.com/FrankMcG
# https://twitter.com/i/lists/1380244569485406209
under1klist = client.list(id = 1380244569485406209)

client.list_members(under1klist).each do |member|
  puts "User: #{member.screen_name} - ID: #{member.id}"
end
