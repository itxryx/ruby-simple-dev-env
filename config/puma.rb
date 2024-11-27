environment ENV.fetch("RACK_ENV") {"development"}
bind "unix:///ruby-simple-dev-env/tmp/sockets/puma.sock"
threads_count = ENV.fetch("PUMA_THREADS") {5}.to_i
threads threads_count, threads_count
workers ENV.fetch("PUMA_WORKERS") {2}.to_i
plugin :tmp_restart
