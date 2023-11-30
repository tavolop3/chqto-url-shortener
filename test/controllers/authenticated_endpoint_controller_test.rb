require 'test_helper'

class AuthenticatedEndpointControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get authenticated_endpoint_index_url
    assert_response :success
  end
end
