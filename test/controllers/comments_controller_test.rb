require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  fixtures :comments

  def setup
    @version = 'v1'
    @comment1 = comments(:comment1)
    @serializer = V1::CommentSerializer.new @comment1
    @serialization = ActiveModelSerializers::Adapter.create @serializer
    @comment2 = comments(:comment2)
  end

  test 'CommentsController#index' do
    params = {
      user_id: 1
    }
    get v1_url, params: params
    assert_response :success
  end

  test 'CommentsController#index - missing `user_id`' do
    get v1_url
    assert_response :bad_request
  end

  test 'CommentsController#create' do
    params = {
      comment: {
        body: @comment1.body,
        user_id: @comment1.user_id
      }
    }
    assert_difference('Comment.count') do
      post v1_url, params: params
    end
    assert_response :success
    assert_equal @comment1.user_id, Comment.last.user_id
    assert_equal @comment1.body, Comment.last.body
  end

  test 'CommentsController#create - invalid record' do
    params = {
      comment: {
        body: "Some text",
        user_id: nil
      }
    }
    post v1_url, params: params
    assert_response :unprocessable_entity
    expected = "{\"errors\":[{\"detail\":\"Validation failed: User can't be blank\",\"status\":422}]}" # TODO: use @response.parsed_body
    assert_equal expected, @response.body
  end

  # test 'CommentsController#create - invalid user foreign key' do
  #   params = {
  #     comment: {
  #       body: "Some text",
  #       user_id: 999
  #     }
  #   }
  #   post v1_url, params: params
  #   assert_response :bad_request
  #   # expected = "{\"errors\":[{\"detail\":\"Validation failed: User can't be blank\",\"status\":422}]}" # TODO: use @response.parsed_body
  #   # assert_equal expected, @response.body
  # end

  test 'CommentsController#show' do
    get "/#{@version}/#{@comment1.id}" # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    assert_response :success
    assert_equal @serialization.to_json, @response.body
  end

  test 'CommentsController#show - 404' do
    comment_id = 123456789
    get "/#{@version}/#{comment_id}" # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    assert_response :not_found
    expected = "{\"errors\":[{\"id\":\"#{comment_id}\",\"detail\":\"Couldn't find Comment with 'id'=#{comment_id}\",\"status\":404,\"meta\":{\"model\":\"Comment\"}}]}" # TODO: use @response.parsed_body
    assert_equal expected, @response.body
  end

  test 'CommentsController#update' do
    params = {
      comment: {
        body: @comment2.body
      }
    }
    put "/#{@version}/#{@comment1.id}", params: params # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    assert_response :success
    assert_equal @comment2.body, @response.parsed_body["data"]["attributes"]["body"]
  end

  test 'CommentsController#update - param missing' do
    params = {
      comment: {}
    }
    put "/#{@version}/#{@comment1.id}", params: params # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    assert_response :bad_request
    expected = "{\"errors\":[{\"detail\":\"param is missing or the value is empty: comment\",\"status\":400,\"meta\":{\"param\":\"comment\"}}]}" # TODO: use @response.parsed_body
    assert_equal expected, @response.body
  end

  test 'CommentsController#destroy' do
    assert_difference('Comment.count', -1) do
      delete "/#{@version}/#{@comment1.id}" # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    end
    assert_response :no_content
    refute_equal Comment.last, @comment1
  end

  test 'CommentsController#destroy - 404' do
    comment_id = 123456789
    assert_difference('Comment.count', 0) do
      delete "/#{@version}/#{comment_id}" # TODO: Figure out why `v1_url, params: { id: 123 }` doesn't work
    end
    assert_response :not_found
  end
end
