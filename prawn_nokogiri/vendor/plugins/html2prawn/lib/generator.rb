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
      
         table_line_height =  16
         table_font_size =  12
      
         # generate pdf      
         list[:html_list].each do |item|
           case item 
           when 'BREAK'
             pdf.move_down break_height
             ypos += break_height
           when 'NEW_PAGE'
             pdf.start_new_page
           else
             breaks = item.scan(/<br>/i).length + item.scan(/<br\/>/i).length
             ypos = start_page_ypos if !ypos 
             ypos += (breaks * break_height)
             puts item
             if item != nil
               #pdf.text item, :inline_format => true
               pdf.text item
             end

           end
         end
       end
      #------------------------------------------------------------
      
      
      def self.generate_pdf(content, pdf)
        paragraphs = Prawn::HTML5::Parser.content_to_paragraphs(content)
        while paragraph = paragraphs.shift
          Prawn::HTML5::Parser.render_paragraph(paragraph, pdf)
        end
      end


    end
  end
end