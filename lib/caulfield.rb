require 'caulfield/middleware'

module Caulfield
  class << self
    delegate :reset, :request, :env, 
      :status, :headers, :body,
      :session, :cookies, :set_session, :set_cookies,
      :to => 'Caulfield::Middleware.instance'
  end
end

if defined?(Rails) && Rails.version >= '3.0.0'
  ActiveSupport.on_load :before_initialize do
    Rails.configuration.middleware.use Caulfield::Middleware
  end
end
