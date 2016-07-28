PDFKit.configure do |config|
  config.wkhtmltopdf = 'C:\Ruby22-x64\bin\wkhtmltopdf\bin\wkhtmltopdf.exe'
  config.default_options = {
    :page_size => 'Legal',
    :print_media_type => true
  }
end