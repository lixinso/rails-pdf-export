txt = <h1>xxxxx</h1>
pdf.text(wrap(sanitize(@document.content, :tags => %w(p i b s u ul ol li))), :inline_format => true)