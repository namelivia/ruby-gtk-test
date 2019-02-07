require_relative 'form_window'
class MainWindow < Gtk::ApplicationWindow
	type_register
	
	class << self
		def init
			set_template resource: '/com/namelivia/ruby-gtk-test/ui/main-window.ui'
			bind_template_child 'doRequestButton'
			bind_template_child 'urlInput'
		end
	end

	def initialize(application, logger)
		super application: application
		logger.info 'Form window constructed'
		set_title 'Simple GTK URL tester'
		doRequestButton.signal_connect 'clicked' do |button, app|
			logger.info 'Do request button pressed'
			logger.info 'The url is:'
			logger.info urlInput.text
		end
	end
end
