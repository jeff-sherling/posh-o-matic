$:.push '../lib/log'
require 'test_logger'
require 'minitest/autorun'

class LogTest < Minitest::Test

  def setup
    @log = TestLogger.new
  end

  def test_info
    out, err = capture_subprocess_io do
      @log.log_info
    end

    puts "Out is '#{out}'."
    puts "Err is '#{err}'."

  end

  def test_debug
    out, err = capture_subprocess_io do
      @log.log_debug
    end

    puts "Out is '#{out}'."
    puts "Err is '#{err}'."

  end

end