require 'nokogiri'
require 'open-uri'

module Prawn
  module HTML5
    class Generator
      
      
      
       @@MAX_PAGE_HEIGHT = 600    
       
       def self.pdf(pdf, html)
      
         # parse
         list = Prawn::HTML5::Parser.html(html)
      
         start_page_ypos =  30
         ypos =  30
         xpos = 0
         line_height = 12
         break_height = line_height + (line_height / 4)
         br_height = line_height*2/3
      
         table_line_height =  16
         table_font_size =  12
      
         # generate pdf      
         list[:html_list].each do |item|
           case item 
             #Why makes the space so large with it?
           when 'BREAK'
             #pdf.move_down break_height
             #ypos += break_height
           when 'BR_MARKER'
             #pdf.move_down br_height
             #ypos += br_height
           when 'HR_MARKER'
              pdf.move_down 5
              pdf.stroke { pdf.horizontal_rule }
              ypos += break_height
           when 'NEW_PAGE'
             pdf.start_new_page
           else
             #breaks = item.scan(/<br>/i).length + item.scan(/<br\/>/i).length
             ypos = start_page_ypos if !ypos 
             #ypos += (breaks * break_height)
             puts item
             if item != nil
               pdf.text item, :inline_format => true, :size => 10.5, :leading => 5
               #pdf.text item
             end
           
           end
           
           
           #pdf.text item, :inline_format => true, :size => 10.5, :leading => 5
           
         end
       end

    end
  end
end