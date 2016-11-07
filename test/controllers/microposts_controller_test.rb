require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @micropost = microposts(:orange)
  end

  test "should redirect to login on create" do
    post microposts_path, params: { micropost: { content: "Ipsum Lorem" } }
    assert_redirected_to login_url
  end

  test "should redirect to login on delete" do
    delete micropost_path(@micropost)
    assert_redirected_to login_url
  end
end
