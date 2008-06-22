require 'test_helper'

class PhoneNumberTypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:phone_number_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_phone_number_type
    assert_difference('PhoneNumberType.count') do
      post :create, :phone_number_type => { }
    end

    assert_redirected_to phone_number_type_path(assigns(:phone_number_type))
  end

  def test_should_show_phone_number_type
    get :show, :id => phone_number_types(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => phone_number_types(:one).id
    assert_response :success
  end

  def test_should_update_phone_number_type
    put :update, :id => phone_number_types(:one).id, :phone_number_type => { }
    assert_redirected_to phone_number_type_path(assigns(:phone_number_type))
  end

  def test_should_destroy_phone_number_type
    assert_difference('PhoneNumberType.count', -1) do
      delete :destroy, :id => phone_number_types(:one).id
    end

    assert_redirected_to phone_number_types_path
  end
end
