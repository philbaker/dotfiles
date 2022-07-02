#!/usr/bin/env ruby

key = ARGV[0]
directory = ARGV[1]
arg = ARGV[2]
compressed_file = "#{directory}.tar.gz"
encrypted_file = "#{directory}.tar.gz.gpg"

def compress(input, output)
  "tar czf #{input} #{output}"
end

def encrypt(email, target)
  "gpg -e -r #{email} #{target}"
end

def decompress(target)
  "tar xzf #{target}"
end

def decrypt(input, output)
  "gpg -d -o #{input} #{output}"
end

if arg == 'e'
  system(compress(compressed_file, directory))
  system(encrypt(key, compressed_file))
else
  system(decrypt(compressed_file, encrypted_file))
  system(decompress(compressed_file))
end
