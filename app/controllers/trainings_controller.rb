class TrainingsController < ApplicationController

	require 'erb'

	def index
		@agarwal = {abc: "nikhil", cde: "agarwal"}
	end

	def get_binding
    binding
  end

  def show

  end

  def certificate
  	controller =TrainingsController.new
		controller.index
  	erb_file = 'app/views/trainings/certificate.html.erb'
		file_name = File.basename(erb_file, '.erb')
		html_file = "app/views/trainings/nikhil.html"
		p "---------------"
		@agarwal = controller.index
		erb_str = File.read(erb_file)
		p erb_str
		renderer = ERB.new(erb_str)
		p renderer
		result = renderer.result(controller.get_binding)
		p result
		p "++++++++++++"
		File.open(html_file, 'w') do |f|
  		f.write(result)
		end
		# download
  end


  def download
  	output = render_to_string "nikhil.html"
    kit = PDFKit.new(output)
    pdf = kit.to_file 'public/data/my.pdf'
  	send_file(
    "#{Rails.root}/public/data/my.pdf",
    filename: "certificate.pdf",
    type: "application/pdf"
  	)
  end
end
