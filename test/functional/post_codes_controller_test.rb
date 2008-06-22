require 'test_helper'

class PostCodesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:post_codes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_post_code
    assert_difference('PostCode.count') do
      post :create, :post_code => { }
    end

    assert_redirected_to post_code_path(assigns(:post_code))
  end

  def test_should_show_post_code
    get :show, :id => post_codes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => post_codes(:one).id
    assert_response :success
  end

  def test_should_update_post_code
    put :update, :id => post_codes(:one).id, :post_code => { }
    assert_redirected_to post_code_path(assigns(:post_code))
  end

  def test_should_destroy_post_code
    assert_difference('PostCode.count', -1) do
      delete :destroy, :id => post_codes(:one).id
    end

    assert_redirected_to post_codes_path
  end
end
