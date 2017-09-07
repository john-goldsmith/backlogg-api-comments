require 'test_helper'

class DocsControllerTest < ActionDispatch::IntegrationTest

  test 'DocsController#index' do
    get v1_docs_url
    assert_response :success
  end
end
