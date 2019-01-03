class MainWindow < Gtk::ApplicationWindow
	type_register
	
	class << self
		def init
			set_template resource: '/com/namelivia/ruby-gtk-test/ui/test.ui'
  		bind_template_child 'main_button'
		end
	end

	def initialize(application, logger)
		super application: application
		logger.info 'Main window constructed'
		set_title 'This is the application window'
		main_button.signal_connect 'clicked' do |button, app|
			logger.warn 'You pressed the button! How dare you!?'
		end
	end
end
