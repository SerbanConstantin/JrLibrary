require "test_helper"

class JrbooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jrbook = jrbooks(:one)
  end

  test "should get index" do
    get jrbooks_url
    assert_response :success
  end

  test "should get new" do
    get new_jrbook_url
    assert_response :success
  end

  test "should create jrbook" do
    assert_difference('Jrbook.count') do
      post jrbooks_url, params: { jrbook: { author: @jrbook.author, book_rating: @jrbook.book_rating, name: @jrbook.name, read: @jrbook.read } }
    end

    assert_redirected_to jrbook_url(Jrbook.last)
  end

  test "should show jrbook" do
    get jrbook_url(@jrbook)
    assert_response :success
  end

  test "should get edit" do
    get edit_jrbook_url(@jrbook)
    assert_response :success
  end

  test "should update jrbook" do
    patch jrbook_url(@jrbook), params: { jrbook: { author: @jrbook.author, book_rating: @jrbook.book_rating, name: @jrbook.name, read: @jrbook.read } }
    assert_redirected_to jrbook_url(@jrbook)
  end

  test "should destroy jrbook" do
    assert_difference('Jrbook.count', -1) do
      delete jrbook_url(@jrbook)
    end

    assert_redirected_to jrbooks_url
  end
end
