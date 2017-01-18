workers 2
threads 1, 5

preload_app!

bind        ENV['URI']      || 'tcp://0.0.0.0:3000'
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
  PumaWorkerKiller.config do |config|
    config.ram           = 640 # mb
    config.frequency     = 10    # seconds
    config.percent_usage = 0.98
    config.rolling_restart_frequency = 20 # 20 seconds just for test purposes
  end
  PumaWorkerKiller.start
end
