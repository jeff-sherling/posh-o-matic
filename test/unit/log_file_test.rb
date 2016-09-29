require 'minitest/autorun'
$:.push '../../lib/log'
require 'log_file'

class LogFileTest <  Minitest::Test

  def test_log_file
    out, err = capture_subprocess_io do
      LogFile.log.info 'Log: Info'
      LogFile.log.debug 'Log: Debug'
      LogFile.log.warn 'Log: Warn'
      LogFile.log.error 'Log: Error'
      LogFile.log.fatal 'Log: Fatal'
      LogFile.log.unknown 'Log: Unknown'
      system "echo Info 1>&2"
    end
    assert(out.size == 0 &&
               err.include?('Info'), 'Info not writing to StdErr.')
  end

end