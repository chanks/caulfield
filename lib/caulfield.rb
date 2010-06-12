require 'caulfield/middleware'

module Caulfield
  class << self
    delegate :reset, :session, :cookies, :set_session, :set_cookies,
      :to => 'Caulfield::Middleware.instance'
  end
end

ActiveSupport.on_load(:before_initialize) do
  Rails.configuration.middleware.use Caulfield::Middleware
end
