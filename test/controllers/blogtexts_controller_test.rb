require "test_helper"

class BlogtextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blogtext = blogtexts(:one)
  end

  test "should get index" do
    get blogtexts_url
    assert_response :success
  end

  test "should get new" do
    get new_blogtext_url
    assert_response :success
  end

  test "should create blogtext" do
    assert_difference("Blogtext.count") do
      post blogtexts_url, params: { blogtext: { owner: @blogtext.owner } }
    end

    assert_redirected_to blogtext_url(Blogtext.last)
  end

  test "should show blogtext" do
    get blogtext_url(@blogtext)
    assert_response :success
  end

  test "should get edit" do
    get edit_blogtext_url(@blogtext)
    assert_response :success
  end

  test "should update blogtext" do
    patch blogtext_url(@blogtext), params: { blogtext: { owner: @blogtext.owner } }
    assert_redirected_to blogtext_url(@blogtext)
  end

  test "should destroy blogtext" do
    assert_difference("Blogtext.count", -1) do
      delete blogtext_url(@blogtext)
    end

    assert_redirected_to blogtexts_url
  end
end
