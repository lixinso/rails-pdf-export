txt = "<h1>This is an awesome document</h1><p>I am a paragraph</p>"

pdf.text(wrap(sanitize(@pdf3.htmlcontent, :tags => %w(p i b s u ul ol li))), :inline_format => true)
#pdf.text(wrap(txt, :tags => %w(p i b s u ul ol li))), :inline_format => true)