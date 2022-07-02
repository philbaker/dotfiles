#!/usr/bin/env ruby

Dir.glob('./**/*.md') do |file|
  system("pandoc -t org #{file} | sed -E \"/^[[:space:]]+:/ d\" > #{file}.org")
end
