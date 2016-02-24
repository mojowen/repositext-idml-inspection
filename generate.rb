#! /bin/ruby

# Update an IDML file with a new XML file

require 'json'
require 'zip'
require 'pry'

require_relative 'app'

path = "/Users/Scott/Desktop/%s.idml"
FileUtils.cp path % 'CHIVOTESguideFEB', path % 'test'
file = File.new(path % 'test','r')
story = 'Stories/Story_u10b2.xml'
new_xml = '/Users/Scott/Projects/repositext-idml-inspection/Story_u10b2.xml'

Zip::File.open(file.path) do |zip_file|
  zip_file.get_output_stream(story) do |story_file|
    story_file.puts File.read(new_xml)
  end
  zip_file.commit
end

idml = IdmlStories.new(file)
binding.pry
