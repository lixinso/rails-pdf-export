
require 'nokogiri'
require 'open-uri'
require 'string'




module Prawn
  module HTML5
    class Parser
      
      @@TABLE_MARKER = "TABLE"
      @@IMG_MARKER = "IMG"
      @@BREAK_MARKER = 'BREAK'
    
      @@DEFAULT_STRIP_TAGS = ['span', 'div', 'body', 'html', 'form', 'head'] 
      @@DEFAULT_ERASE_TAGS = ['object', 'script', 'applet', 'select', 'button', 'input', 'textarea', 'style', 'iframe', 'meta', 'link', 'hr']
      @@H_TAGS = ['h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'h7', 'h8', 'h9']    
      @@BLOCK_TAGS = ['p','blockquote']
      
      #def self.html(html,options={})
      def self.html(html)
      
         @@DEFAULT_ERASE_TAGS.each do |tag|
            html.erase_tags!(tag)
          end
          
          @@DEFAULT_STRIP_TAGS.each do |tag|
            html.strip_tags!(tag)
          end
          
          @@BLOCK_TAGS.each do |tag|
            html.add_after_end_tag!(tag, '<br/>')
          end
          
          doc = Nokogiri::HTML.parse(html)
          
          result = html
          
          doc.css('ul').each do |ul|
            puts "parsing ul"
            res = "<br/>"
            ul.css('li').each_with_index do |li, index|
              res << "- #{li.inner_html} <br/>"
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
          
          result.replace_start_tags_marker!('p', @@BREAK_MARKER)
          result.strip_tags!('p')
          
           result.remove_newlines!
           
           res_list = {:html_list => result.split(/:#:/)}

      
      end
      
      
      #-------------------------------------------------------------------------------
      
      
      def self.sanitized_content(content)
        sanitize(content, :tags => %w(p strong em s strike u ul ol li hr blockquote))
      end

      #private

      def self.render_paragraph(paragraph, pdf)
        pdf.instance_eval do
          if paragraph == "<hr />"
            move_down 5
            pdf.stroke { pdf.horizontal_rule }
            return
          end

          move_down 10

          markup = Nokogiri::HTML(paragraph.gsub(/\s+/, " ").gsub("&nbsp;", " "))

          mappings = { :em => :i, :strong => :b, :s => :strikethrough, :strike => :strikethrough }
          mappings.keys.each do |key|
            markup.xpath("//#{key}").each do |item|
              item.name = mappings[key].to_s
            end
          end

          markup.xpath('//ul/li').each do |item|
            item.replace "    " + "BULLET-POINT #{item.text}\n"
          end
          markup.xpath('//ol/li').each_with_index do |item, index|
            item.replace "#{index + 1}. #{item.inner_html}\n"
          end

          ['p', 'ol', 'ul' , 'blockquote'].each do |tag|
            markup.xpath("//#{tag}").each do |t|
              t.replace(t.inner_html)
            end
          end

          #paragraph = markup.at_xpath('//body').inner_html.gsub("BULLET-POINT", "•").strip
          paragraph = markup.at_xpath('//body').inner_html.gsub("BULLET-POINT", "•")
          text paragraph, :inline_format => true
          #indent 20 do
          #  text "    helloworld"
          #end
        end
      end

      def self.content_to_paragraphs(content)
        regex_string = "<p>.*?</p>|<ul>.*?</ul>|<ol>.*?</ol>|<hr />"
        regex = Regexp.new(regex_string, Regexp::MULTILINE)
        paragraphs = content.scan(regex)
      end
      
    end
  end
end

