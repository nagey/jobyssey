require 'test_helper'

class JobTitlesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:job_titles)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_job_title
    assert_difference('JobTitle.count') do
      post :create, :job_title => { }
    end

    assert_redirected_to job_title_path(assigns(:job_title))
  end

  def test_should_show_job_title
    get :show, :id => job_titles(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => job_titles(:one).id
    assert_response :success
  end

  def test_should_update_job_title
    put :update, :id => job_titles(:one).id, :job_title => { }
    assert_redirected_to job_title_path(assigns(:job_title))
  end

  def test_should_destroy_job_title
    assert_difference('JobTitle.count', -1) do
      delete :destroy, :id => job_titles(:one).id
    end

    assert_redirected_to job_titles_path
  end
end
