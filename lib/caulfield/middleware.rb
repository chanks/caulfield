module Caulfield
  class Middleware
    @@instance = new
    attr_accessor :app, :session, :cookies, :request, :response, :headers, :body

    class << self
      def new(app)
        @@instance.app = app
        @@instance.reset
        @@instance
      end

      def instance
        @@instance
      end
    end

    def call(env)
      @request = ActionDispatch::Request.new(env)

      merge_cookies unless @cookies_to_merge.empty?
      merge_session unless @session_to_merge.empty?

      @response, @headers, @body = @app.call(env)

      @cookies = @request.cookie_jar
      @session = @request.session

      [@response, @headers, @body]
    end

    def reset
      @cookies = @session = @request = @response = @headers = @body = nil

      @cookies_to_merge = {}
      @session_to_merge = {}
    end

    def set_cookies(hash)
      @cookies_to_merge.merge!(hash)
    end

    def set_session(hash)
      @session_to_merge.merge!(hash)
    end

    private

    def merge_cookies
      @cookies_to_merge.each do |key, value|
        if value.nil?
          @request.cookie_jar.delete key
        else
          @request.cookie_jar.signed[key] = value
        end
      end
      @cookies_to_merge = {}
    end

    def merge_session
      @session_to_merge.each do |key, value|
        if value.nil?
          @request.session.delete key
        else
          @request.session[key] = value
        end
      end
      @session_to_merge = {}
    end
  end
end
