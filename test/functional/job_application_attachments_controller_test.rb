require 'test_helper'

class JobApplicationAttachmentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:job_application_attachments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_job_application_attachment
    assert_difference('JobApplicationAttachment.count') do
      post :create, :job_application_attachment => { }
    end

    assert_redirected_to job_application_attachment_path(assigns(:job_application_attachment))
  end

  def test_should_show_job_application_attachment
    get :show, :id => job_application_attachments(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => job_application_attachments(:one).id
    assert_response :success
  end

  def test_should_update_job_application_attachment
    put :update, :id => job_application_attachments(:one).id, :job_application_attachment => { }
    assert_redirected_to job_application_attachment_path(assigns(:job_application_attachment))
  end

  def test_should_destroy_job_application_attachment
    assert_difference('JobApplicationAttachment.count', -1) do
      delete :destroy, :id => job_application_attachments(:one).id
    end

    assert_redirected_to job_application_attachments_path
  end
end
