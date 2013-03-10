require 'logger'

module Ein
  LOGGER = Logger.new(STDOUT)
  LOGGER.level = Logger::INFO
end
