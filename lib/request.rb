require 'net/http'
require 'content_type'
require 'htmlentities'
class Request

	GET = 1
	POST = 2
	PUT = 3
	DELETE = 4

	attr_reader :text

	def initialize(logger, uri, method)
		@logger = logger
		@uri = uri
		@uri = URI.parse(uri)
		@method = method
		@logger.debug 'New request:'
		@logger.debug "The URI is: #{uri}"
		@logger.debug "The method is: #{method}"
	end

	def run()
		@logger.debug 'Executing the request'
		request = self.getRequest
		@logger.debug "Calling to #{@uri.hostname}:#{@uri.port}"
		http = Net::HTTP.new(@uri.host, @uri.port)
		http.use_ssl = @uri.scheme == 'https'
		res = http.request(request)
		@logger.debug 'Request is finished'
		content_type = ContentType.parse res['content-type']
		@logger.debug "Original encoding:#{content_type.charset}"
		@text = HTMLEntities.new.decode(res.body.encode('UTF-8', content_type.charset))
	end

	def getRequest()
		case @method
		when GET
			@logger.debug 'Doing a Get request'
			return Net::HTTP::Get.new(@uri)
		when POST
			@logger.debug 'Doing a Post request'
			return Net::HTTP::Post.new(@uri)
		when PUT
			@logger.debug 'Doing a Put request'
			return Net::HTTP::Put.new(@uri)
		when DELETE
			@logger.debug 'Doing a Delete request'
			return Net::HTTP::Delete.new(@uri)
		end
	end
end
