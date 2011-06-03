
require 'nokogiri'
require 'open-uri'
require 'string'




module Prawn
  module HTML5
    class Parser
      
      @@TABLE_MARKER = "TABLE"
      @@IMG_MARKER = "IMG"
      @@BREAK_MARKER = 'BREAK'
      @@BR_MARKER = 'BR_MARKER'
      @@HR_MARKER = 'HR_MARKER'
    
      @@DEFAULT_STRIP_TAGS = ['span', 'div', 'body', 'html', 'form', 'head'] 
      @@DEFAULT_ERASE_TAGS = ['object', 'script', 'applet', 'select', 'button', 'input', 'textarea', 'style', 'iframe', 'meta', 'link']
      @@H_TAGS = ['h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'h7', 'h8', 'h9']    
      @@BLOCK_TAGS = ['p','blockquote']
      
      #def self.html(html,options={})
      def self.html(html)
      
          #TODO:sanitize before use?
      
          @@DEFAULT_ERASE_TAGS.each do |tag|
            html.erase_tags!(tag)
          end
          
          @@DEFAULT_STRIP_TAGS.each do |tag|
            html.strip_tags!(tag)
          end
          
          @@BLOCK_TAGS.each do |tag|
            html.add_after_end_tag!(tag, '<br/>')
          end
          
          
          #mappings = { :em => :i, :strong => :b, :s => :strikethrough, :strike => :strikethrough }
          #mappings.keys.each do |key|
          #  doc.xpath("//#{key}").each do |item|
          #    item.name = mappings[key].to_s
          #  end
          #end
          html.replace_tag_name!("em","i")
          html.replace_tag_name!("strong","b")
          html.replace_tag_name!("s","strikethrough")
          html.replace_tag_name!("strike","strikethrough")
          
          
          doc = Nokogiri::HTML.parse(html)

          result = html
          #result = doc.xpath("//body").to_s
          
          doc.css('ul').each do |ul|
            puts "parsing ul"
            res = "<br/>"
            ul.css('li').each_with_index do |li, index|
              res << "• #{li.inner_html} <br/>"
            end
            result.replace_tag!('ul', res)
          end
          
          
          doc.css('ol').each do |ul|
            puts "parsing ol"
            res = "<br/>"
            ul.css('li').each_with_index do |li, index|
              res << "#{index+1}. #{li.inner_html} <br/>"
            end
            result.replace_tag!('ol', res)
          end
          
          #Why doesn't work
          #doc.css('blockquote').each do |blockquote|
          #  puts "parsing blockquote"
          #  res = "<br/>#{blockquote.inner_html}<br/>"
          #  result.replace_tag!('blockquote', res)
          #end
          
          #parser blockquote
          result.gsub!(/<\/blockquote>/i, "<br/>")
          result.gsub!(/<blockquote*>/i, "<br/>")
           
          result.replace_start_tags_marker!('p', @@BREAK_MARKER)
          result.strip_tags!('p')
          
          sep = ":#:"
          
          result.replace_tags!('hr', sep + @@HR_MARKER + sep)          
          
          result.replace_tags!('br', sep + @@BR_MARKER + sep)
          #result.strip_tags!('b')
          
           result.remove_newlines!
           
           #result.gsub!(/:#:/,"")
           result.gsub!(/&nbsp;/," ")
           
           res_list = {:html_list => result.split(/:#:/)}
           #res_list = {:html_list => result.split(/BREAK/)}

      
      end
      
 
      
    end
  end
end

