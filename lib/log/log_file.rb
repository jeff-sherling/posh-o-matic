require 'logger'
require 'multi_log'

class LogFile

  #@file = File.open("log/automation.log", File::WRONLY | File::APPEND | File::CREAT)
  # @file = File.open("#{$ROOT_PATH}/log/automation.log", File::WRONLY | File::APPEND | File::CREAT)

  def self.log
    if @logger.nil?
      @logger = Logger.new('test.log', 'daily')
      @logger.level = Logger::DEBUG
      @logger.datetime_format = '%Y-%m-%d %H:%M:%S '
    end
    @logger
  end

end