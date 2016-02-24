#! /bin/ruby

# Save a story content to an XML file

require 'json'
require 'zip'
require 'pry'


path = "/Users/Scott/Desktop/%s.idml"
FileUtils.cp path % 'CHIVOTESguideFEB', path % 'test'
file = File.new(path % 'test','r')
story = 'Stories/Story_u10b2.xml'
new_xml = '/Users/Scott/Projects/repositext-idml-inspection/Story_u10b2.xml'

Zip::File.open(file.path) do |zip_file|
  File.open new_xml,  File::RDWR do |file|
    file.write zip_file.get_entry(story).get_input_stream.read
  end
end
