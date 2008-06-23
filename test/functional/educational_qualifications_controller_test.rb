require 'test_helper'

class EducationalQualificationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:educational_qualifications)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_educational_qualification
    assert_difference('EducationalQualification.count') do
      post :create, :educational_qualification => { }
    end

    assert_redirected_to educational_qualification_path(assigns(:educational_qualification))
  end

  def test_should_show_educational_qualification
    get :show, :id => educational_qualifications(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => educational_qualifications(:one).id
    assert_response :success
  end

  def test_should_update_educational_qualification
    put :update, :id => educational_qualifications(:one).id, :educational_qualification => { }
    assert_redirected_to educational_qualification_path(assigns(:educational_qualification))
  end

  def test_should_destroy_educational_qualification
    assert_difference('EducationalQualification.count', -1) do
      delete :destroy, :id => educational_qualifications(:one).id
    end

    assert_redirected_to educational_qualifications_path
  end
end
