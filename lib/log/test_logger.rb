require 'logger'

class TestLogger

  def log_info
    log = Logger.new(STDOUT)
    log.info("Here is an info message.")
  end

  def log_debug
    log = Logger.new(STDOUT)
    log.debug("This is a debug message.")
  end

end