require 'rubygems'
require 'nokogiri'
@builder = Nokogiri::HTML::Builder.new do |doc|
  doc.html{
    doc.head{
      doc.script{
        doc.text "alert('hello world');"
      }
      doc.style{
        doc.text "div#thing { background: red; }"
      }
      doc.title "Awesome Page"
    }
    
    doc.body{
      doc.div.rad.thing!{
        doc.h1 "This is an h1"
        doc.text "This is a div with class 'rad'"
        doc.div( :same_attribute => 'foo'){
          doc.p "This is an awesome paragraph!"
        }
      }
    }
  }
end

puts @builder.to_html