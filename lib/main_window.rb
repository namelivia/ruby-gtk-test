require_relative 'form_window'
class MainWindow < Gtk::ApplicationWindow
	type_register
	
	class << self
		def init
			set_template resource: '/com/namelivia/ruby-gtk-test/ui/main-window.ui'
  		bind_template_child 'main_button'
		end
	end

	def initialize(application, logger)
		super application: application
		logger.info 'Form window constructed'
		set_title 'This is the form window'
		main_button.signal_connect 'clicked' do |button, app|
			form_window = FormWindow.new(application, logger)
			form_window.present
		end
	end
end
