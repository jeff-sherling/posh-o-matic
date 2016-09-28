require 'logger'
require 'multi_log'

class LogFile

  path = '/Users/jeff.sherling/workspace/posh-o-matic/results'
  @file = File.open("#{path}/automation.log", File::WRONLY | File::APPEND | File::CREAT)

  def self.log
    if @logger.nil?
      @logger = Logger.new(@file)
      @logger.level = Logger::DEBUG
      @logger.datetime_format = '%Y-%m-%d %H:%M:%S '
    end
    @logger
  end

end