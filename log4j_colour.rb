#!/usr/bin/env ruby

red = "\e[31m" 
green = "\e[32m"
yellow = "\e[33m"
cyan = "\e[36m"

currentColour = red

ARGF.each do |line|

 if line.include?('INFO') 
  currentColour = green
 elsif line.include?('TRACE') 
  currentColour = cyan
 elsif line.include?('DEBUG') 
  currentColour = cyan
 elsif line.include?('ERROR') 
  currentColour = red
 elsif line.include?('FATAL') 
  currentColour = red
 elsif line.include?('WARN') 
  currentColour = yellow
 end
  puts "#{currentColour}#{line}"
  STDOUT.flush
end