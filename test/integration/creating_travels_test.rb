require 'test_helper'

class CreatingTravelsTest < ActionDispatch::IntegrationTest

  test 'creates travels' do
    post '/v1/travels',
      { travel:
        {name: 'Bananas', position: 1, content: 'Learn about bananas', visible: 1}
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    travel = json(response.body)
    assert_equal v1_travel_url(travel[:id]), response.location
  end

end