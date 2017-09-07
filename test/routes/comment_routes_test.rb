require 'test_helper'

class CommentRoutesTest < ActionDispatch::IntegrationTest
  def setup
    @version = 'v1'
  end

  test "index" do
    assert_routing({ method: 'get', path: "/#{@version}" }, { controller: "#{@version}/comments", action: 'index' })
  end

  test "create" do
    assert_routing({ method: 'post', path: "/#{@version}" }, { controller: "#{@version}/comments", action: 'create' })
  end

  test "show" do
    assert_routing({ method: 'get', path: "/#{@version}/123" }, { controller: "#{@version}/comments", action: 'show', id: '123' })
  end

  test "update" do
    assert_routing({ method: 'put', path: "/#{@version}/123" }, { controller: "#{@version}/comments", action: 'update', id: '123' })
  end

  test "destroy" do
    assert_routing({ method: 'delete', path: "/#{@version}/123" }, { controller: "#{@version}/comments", action: 'destroy', id: '123' })
  end

  test "docs" do
    assert_routing({ method: 'get', path: "/#{@version}/docs" }, { controller: "#{@version}/docs", action: 'index' })
  end
end