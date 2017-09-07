require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  fixtures :comments

  def setup
    @comment = comments(:comment1)
  end

  test 'valid comment' do
    assert @comment.valid?
    assert_empty @comment.errors
  end

  test 'invalid without a `body` attribute' do
    @comment.body = nil
    refute @comment.valid?, "Comment must have a `body` attribute"
    refute_nil @comment.errors[:body]
  end

  test 'invalid without a `user_id` attribute' do
    @comment.user_id = nil
    refute @comment.valid?, "Comment must have a `user_id` attribute"
    refute_nil @comment.errors[:user_id]
  end
end