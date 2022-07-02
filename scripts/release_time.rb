#!/usr/bin/env ruby

message = ARGV[0] || 'Release'

puts("#{message}: #{Time.now.round.to_s[0...-9]}")
