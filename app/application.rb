require 'rack/request'
require 'json'

class App
  def self.call(env)
    new(env).response
  end

  def initialize(env)
    @env = env
    @request = Rack::Request.new(env)
  end

  def response
    if (@request.get? || @request.head?) && @request.path_info == '/'
      template_path = File.join(File.dirname(__FILE__), 'views', 'home.erb')
      template = File.read(template_path)
      erb = ERB.new(template)
      body = erb.result(binding)
      [
        200,
        { 'Content-Type' => 'text/html' },
        @request.head? ? [] : [ body ]
      ]
    else
      template_path = File.join(File.dirname(__FILE__), 'views', 'error.erb')
      template = File.read(template_path)
      erb = ERB.new(template)
      body = erb.result(binding)
      [
        404,
        { 'Content-Type' => 'text/html' },
        @request.head? ? [] : [ body ]
      ]
    end
  end
end
