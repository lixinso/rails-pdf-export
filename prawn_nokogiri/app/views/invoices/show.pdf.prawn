pdf.move_down 70

# Add the font style and size
pdf.font "Helvetica"
pdf.font_size 18

pdf.text "helllo"
 
pdf.text "======================"

wrap(@invoice.html_content, pdf)