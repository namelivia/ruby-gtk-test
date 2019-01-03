require 'gtk3'
require_relative 'main_window'

class Test < Gtk::Application
	def initialize(logger)
		@logger = logger
		@logger.debug 'Initializing Gtk application'
		super 'com.namelivia.gtk-test', :flags_none
		signal_connect :activate do |app|
			@logger.debug 'Gtk application initialized'
			window = MainWindow.new(app, logger)
			window.present
		end
	end
end
