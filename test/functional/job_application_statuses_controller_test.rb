require 'test_helper'

class JobApplicationStatusesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:job_application_statuses)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_job_application_status
    assert_difference('JobApplicationStatus.count') do
      post :create, :job_application_status => { }
    end

    assert_redirected_to job_application_status_path(assigns(:job_application_status))
  end

  def test_should_show_job_application_status
    get :show, :id => job_application_statuses(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => job_application_statuses(:one).id
    assert_response :success
  end

  def test_should_update_job_application_status
    put :update, :id => job_application_statuses(:one).id, :job_application_status => { }
    assert_redirected_to job_application_status_path(assigns(:job_application_status))
  end

  def test_should_destroy_job_application_status
    assert_difference('JobApplicationStatus.count', -1) do
      delete :destroy, :id => job_application_statuses(:one).id
    end

    assert_redirected_to job_application_statuses_path
  end
end
