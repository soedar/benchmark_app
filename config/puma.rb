workers       2
threads       4, 4

preload_app!

rackup        DefaultRackup
port          3000
environment   ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
