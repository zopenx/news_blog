require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should_not_save_post_wiyhout_title" do
  post = Post.new
  assert_not post.save
  end
end
