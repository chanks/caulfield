require 'caulfield/middleware'

module Caulfield
  class << self
    def method_missing(method, *args, &block)
      Middleware.instance.send(method, *args, &block)
    end
  end
end

if defined?(Rails) && Rails.version >= '3.0.0'
  ActiveSupport.on_load :before_initialize do
    Rails.configuration.middleware.use Caulfield::Middleware
  end
end
