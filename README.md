# Caulfield

Caulfield is a small Rack middleware to be used in integration testing for Rails 3 applications. It offers a simple interface to inspect the session and cookie jar of the most recent request, and to set values and cookies for the next request. I'm using it with Capybara and RSpec, but I don't see why it wouldn't work with any other integration testing setup. It's a simple extraction from one of my projects, where I use it extensively, but it itself doesn't have tests, so beware.

Caulfield requires Rails 3.0.0.beta4 or higher.

### How to Use

- Run Caulfield.reset before each test. You can do this globally - for example, in your spec_helper file in RSpec:

        Rspec.configure do |config|
          config.before :each do
            Caulfield.reset
          end
        end

- After you've processed a request, you can access its session and cookie jar using Caulfield.session and Caulfield.cookies, respectively.
- You can set session values and cookies for the next request using Caulfield.set_session and Caulfield.set_cookies, each of which take a hash.
- To remove a value from the session or cookie jar, set the value to nil.

You can wrap whatever DSL you like around these methods. For example:

    def login_as(user)
      Caulfield.set_session :user_id => user.id
    end

    def logged_in?
      !!Caulfield.session[:user_id]
    end

    def logout
      Caulfield.set_session :user_id => nil
    end

In addition to the session and cookies from the request, you can also access the ActionDispatch::Request object from the last request with Caulfield.request, and the components of the app's last Rack response with Caulfield.status, Caulfield.headers, and Caulfield.body.

Happy testing!
