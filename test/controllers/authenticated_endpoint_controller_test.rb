require 'test_helper'

class AuthenticatedEndpointControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'not authenticated user should not get index' do
    get authenticated_endpoint_index_url
    assert_response :redirect
  end

  test 'authenticated user should get index' do
    sign_in users(:tavo)
    get authenticated_endpoint_index_url
    assert_response :success
  end
end
