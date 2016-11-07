require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:roberto)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "should not be valid" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "should not be empty" do
    @micropost.content = "  "
    assert_not @micropost.valid?
  end

  test "should be less than 140 chars" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "returns most recent post first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
