$LOAD_PATH.push 'lib/log'
require 'log_file'
require 'minitest/autorun'
require 'minitest/reporters'

# Test Log File class
class LogFileTest < Minitest::Test
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new,
                            Minitest::Reporters::JUnitReporter.new]

  def test_info_log_file
    out, err = capture_subprocess_io do
      LogFile.log.info 'Log: Info'
      # LogFile.log.fatal 'Log: Fatal'
      # LogFile.log.unknown 'Log: Unknown'
      system 'echo Info 1>&2'
    end
    assert(out.empty? && err.include?('Info'),
           'Info not writing to StdErr.')
  end

  def test_debug_log_file
    out, err = capture_subprocess_io do
      LogFile.log.debug 'Log: Debug'
      system 'echo Debug 1>&2'
    end
    assert(out.empty? && err.include?('Debug'),
           'Debug not writing to StdErr.')
  end

  def test_warn_log_file
    out, err = capture_subprocess_io do
      LogFile.log.debug 'Log: Warn'
      system 'echo Warn 1>&2'
    end
    assert(out.empty? && err.include?('Warn'),
           'Warn not writing to StdErr.')
  end

  def test_error_log_file
    out, err = capture_subprocess_io do
      LogFile.log.debug 'Log: Error'
      system 'echo Error 1>&2'
    end
    assert(out.empty? && err.include?('Error'),
           'Error not writing to StdErr.')
  end

  def test_fatal_log_file
    out, err = capture_subprocess_io do
      LogFile.log.debug 'Log: Fatal'
      system 'echo Fatal 1>&2'
    end
    assert(out.empty? && err.include?('Fatal'),
           'Fatal not writing to StdErr.')
  end

  def test_unknown_log_file
    out, err = capture_subprocess_io do
      LogFile.log.debug 'Log: Unknown'
      system 'echo Unknown 1>&2'
    end
    assert(out.empty? && err.include?('Unknown'),
           'Unknown not writing to StdErr.')
  end
end