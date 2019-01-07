class FormWindow < Gtk::ApplicationWindow
	type_register
	
	class << self
		def init
			set_template resource: '/com/namelivia/ruby-gtk-test/ui/form-window.ui'
		end
	end

	def initialize(application, logger)
		super application: application
		logger.info 'Main window constructed'
		set_title 'This is the application window'
	end
end
