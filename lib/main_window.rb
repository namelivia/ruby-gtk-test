require_relative 'request'
class MainWindow < Gtk::ApplicationWindow
	type_register
	
	class << self
		def init
			set_template resource: '/com/namelivia/ruby-gtk-test/ui/main-window.ui'
			bind_template_child 'doRequestButton'
			bind_template_child 'urlInput'
			bind_template_child 'requestTypeInput'
			bind_template_child 'responseTextView'
		end
	end

	def initialize(application, logger)
		super application: application
		logger.debug 'Form window constructed'
		set_title 'Simple GTK URL tester'
		doRequestButton.signal_connect 'clicked' do |button, app|
			logger.debug 'Do request button pressed'
			logger.debug "Typed url is: #{urlInput.text}"

			model = requestTypeInput.model
			iter = model.get_iter(requestTypeInput.active.to_s)
			requestTypeValue = requestTypeInput.model.get_value(iter, 1)
			logger.debug "The selected request type is: #{requestTypeValue}"
			request = Request.new(logger, urlInput.text, requestTypeValue)
			request.run
			responseTextView.buffer.text = request.text
		end
	end
end
