require 'test_helper'
require 'welcome_controller.rb'

puts ""
puts "Running all Tests"
puts ""

   
class WelcomeControllerTest < ActionController::TestCase

  # called before every single test
  def setup
  end

  def test_index_content
    obj = WelcomeController.new()


    expected = "<!DOCTYPE html>
<html>
<head>
  <title>Sample Rails App</title>
  <link rel=\"stylesheet\" media=\"all\" href=\"/assets/application.css\" data-turbolinks-track=\"true\" />
  <script src=\"/assets/application.js\" data-turbolinks-track=\"true\"></script>
  
</head>
<body>

<h1>Welcome#index</h1>
<p>Hello World!</p>


</body>
</html>
"

    content = get :index  

    if content.body != expected
        puts "FAILED Test: Content(#{content.body}) != Expected(#{expected})"
        assert false
    else
        puts " -- Index Content Test Passed"
        assert content.body == expected
    end
  end
end

