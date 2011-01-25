A Nokogiri patch for creating a hash!
-------------------------------------

Just drop it in your rails lib folder or require it in your project.

Usage
-----

    require 'nokogiri'
    require 'open-uri'

    url = 'http://www.w3schools.com/xml/simple.xml'
    xml = Nokogiri::XML(open(url))
    hash = xml.to_hash

    # check it out formatted in irb with:

    y hash
