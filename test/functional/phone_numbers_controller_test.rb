require 'test_helper'

class PhoneNumbersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:phone_numbers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_phone_number
    assert_difference('PhoneNumber.count') do
      post :create, :phone_number => { }
    end

    assert_redirected_to phone_number_path(assigns(:phone_number))
  end

  def test_should_show_phone_number
    get :show, :id => phone_numbers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => phone_numbers(:one).id
    assert_response :success
  end

  def test_should_update_phone_number
    put :update, :id => phone_numbers(:one).id, :phone_number => { }
    assert_redirected_to phone_number_path(assigns(:phone_number))
  end

  def test_should_destroy_phone_number
    assert_difference('PhoneNumber.count', -1) do
      delete :destroy, :id => phone_numbers(:one).id
    end

    assert_redirected_to phone_numbers_path
  end
end
