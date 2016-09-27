$:.push '../../lib/log'
require 'console'
require 'minitest/autorun'

class ConsoleLogTest < Minitest::Test

  def test_info
    out, err = capture_subprocess_io do
      Console.log.info 'Log: Info'
    end
    puts "\ntest_info: #{out}"
    assert(out.include?('INFO'), 'Info not writing to StdOut.')
    assert(err.size == 0, 'Info writing to StdErr.')
  end

  def test_debug
    out, err = capture_subprocess_io do
      Console.log.debug 'Log: Debug'
    end
    puts "\ntest_debug: #{out}"
    assert(out.include?('DEBUG'), 'Debug not writing to StdOut.')
    assert(err.size == 0, 'Debug writing to StdErr.')
  end

  def test_warn
    out, err = capture_subprocess_io do
      Console.log.warn 'Log: Warn'
    end
    puts "\ntest_warn: #{out}"
    assert(out.include?('WARN'), 'Warn not writing to StdOut.')
    assert(err.size == 0, 'Warn writing to StdErr.')
  end

  def test_error
    out, err = capture_subprocess_io do
      Console.log.error 'Log: Error'
    end
    puts "\ntest_error: #{out}"
    assert(out.include?('ERROR'), 'Error not writing to StdOut.')
    assert(err.size == 0, 'Error writing to StdErr.')
  end

  def test_fatal
    out, err = capture_subprocess_io do
      Console.log.fatal 'Log: Fatal'
    end
    puts "\ntest_fatal: #{out}"
    assert(out.include?('FATAL'), 'Fatal not writing to StdOut.')
    assert(err.size == 0, 'Fatal writing to StdErr.')
  end

  def test_unknown
    out, err = capture_subprocess_io do
      Console.log.unknown 'Log: Unknown'
    end
    puts "\ntest_unknown: #{out}"
    assert(out.include?('ANY'), 'Unknown not writing to StdOut.')
    assert(err.size == 0, 'Unknown writing to StdErr.')
  end

end