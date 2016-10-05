require 'logger'
#require 'multi_log'

class LogFile

  date = Time.now.strftime('%h-%d-%Y')
  time = Time.now.strftime('%H-%M-%S')
  path = '~/Library/Logs/automation.' + date + '_' + time + '.log'
  @file = File.expand_path(path)

  def self.log
    if @logger.nil?
      @logger = Logger.new(@file)
      @logger.level = Logger::DEBUG
      @logger.datetime_format = '%Y-%m-%d %H:%M:%S '
    end
    @logger
  end

end