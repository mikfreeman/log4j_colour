#!/usr/bin/env ruby
require 'optparse'
require 'ostruct'

PROGRAM_VERSION = 1.0

def program_options
  [
  	['-V','--version', "Display the program version.",
      lambda { |value|
          puts "log4j-colour : version #{PROGRAM_VERSION}"
            exit
        }
    ]
  ]
end

option_parser = OptionParser.new do |opts|
  opts.banner = "Usage: log4j-colour.rb [OPTION]... [FILE]"
  opts.separator ""
  opts.separator "Options are ..."
  opts.on_tail("-h", "--help", "-H", "Display this help message.") do
    puts opts
    exit
  end
  program_options.each { |args| opts.on(*args) }
end

begin
  option_parser.parse!
rescue OptionParser::ParseError => error
  puts error.message
  puts option_parser
  exit
end

red = "\e[31m" 
green = "\e[32m"
yellow = "\e[33m"
cyan = "\e[36m"
currentColour = green

ARGF.lines do |line|
  if line.include?('TRACE') 
    currentColour = cyan
  elsif line.include?('DEBUG') 
    currentColour = cyan
  elsif line.include?('INFO') 
    currentColour = green
  elsif line.include?('WARN') 
    currentColour = yellow
  elsif line.include?('ERROR') 
    currentColour = red
  elsif line.include?('FATAL') 
    currentColour = red
  end
  puts "#{currentColour}#{line}"
  STDOUT.flush()
end