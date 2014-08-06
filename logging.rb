require 'singleton'
module Logging

	def info(msg)
		return Logger.instance.out(msg, "INFO")
	end
	def warn(msg)
		return Logger.instance.out(msg, "WARN")
	end
	def error(msg)
		return Logger.instance.out(msg, "ERROR")
	end

	class Logger
		include Singleton

		def initialize
			@log = File.open("LOG_PATH", "a")
		end

		def out(msg, level)
			@log.puts("#{level[0]}, [#{Time.now}]  #{level} -- : #{msg}")
			@log.flush
		end

	end
end
