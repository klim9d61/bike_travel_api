require 'test_helper'

class ListingTravelsTest < ActionDispatch::IntegrationTest
  test 'returns travels in JSON' do
    get '/v1/travels', {}, {'Accept' => Mime::JSON }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'returns travels in XML' do
    get '/v1/travels', {}, {'Accept' => Mime::XML }
    assert_equal 200, response.status
    assert_equal Mime::XML, response.content_type
  end
end