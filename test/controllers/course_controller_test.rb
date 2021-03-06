require 'test_helper'

class CourseControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:user_007)
    post user_session_url
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end
  
end
