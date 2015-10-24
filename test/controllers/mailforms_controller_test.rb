require 'test_helper'

class MailformsControllerTest < ActionController::TestCase
  setup do
    @mailform = mailforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mailforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mailform" do
    assert_difference('Mailform.count') do
      post :create, mailform: { body: @mailform.body, organization_id: @mailform.organization_id, sender: @mailform.sender, subject: @mailform.subject }
    end

    assert_redirected_to mailform_path(assigns(:mailform))
  end

  test "should show mailform" do
    get :show, id: @mailform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mailform
    assert_response :success
  end

  test "should update mailform" do
    patch :update, id: @mailform, mailform: { body: @mailform.body, organization_id: @mailform.organization_id, sender: @mailform.sender, subject: @mailform.subject }
    assert_redirected_to mailform_path(assigns(:mailform))
  end

  test "should destroy mailform" do
    assert_difference('Mailform.count', -1) do
      delete :destroy, id: @mailform
    end

    assert_redirected_to mailforms_path
  end
end
