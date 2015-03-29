require 'test_helper'

class OccupationsControllerTest < ActionController::TestCase
  
  def auth
    sign_in FactoryGirl.create(:user)
  end

  test "should not get index occupations without authentification" do
    get :index
    assert_response 302
  end 

  test "should get index" do
    auth
    get :index
    assert_response :success
    assert_not_nil assigns(:occupations)
  end

  test "should not get create occupation without authentification" do
    post :create, :occupation => FactoryGirl.attributes_for(:occupation)
    assert_response 302
  end 

  test "should create occupation" do
    auth
    assert_difference('Occupation.count') do
      post :create, :occupation => FactoryGirl.attributes_for(:occupation)
    end
    assert_redirected_to occupations_path
  end

  test "should not get new occupations without authentification" do
    get :new
    assert_response 302
  end 

  test "new should render correct layout" do
    auth
    get :new
    assert_template layout: "layouts/application", partial: "_entry_occupation_form"
  end

  test "should not get edit without authentification" do
    FactoryGirl.create(:occupation)
    occupation = Occupation.first
    get :edit, :occupation => FactoryGirl.create(:occupation)
    assert_response 302
  end

  test "should edit occupation" do
    auth
    get :edit, :id => FactoryGirl.create(:occupation).id
    assert_response :success
    assert_template layout: "layouts/application", partial: "_entry_occupation_form"
  end

  test "should not update without authentification" do
    patch :update, :id => FactoryGirl.create(:occupation).id
    assert_response 302
  end

  test "should update occupation" do
    #auth
    #occupation = FactoryGirl.create(:occupation)
    #occupation.name = "Updated"
    #patch :update, :occupation => occupation
    #assert_redirected_to occupations_path
  end

  test "should not destroy occupation without authentification" do
    @occupation = FactoryGirl.create(:occupation)
    assert_difference('Occupation.count', 0) do
      delete :destroy, :id => @occupation.id
    end
  end

  test "should destroy occupation" do
    auth
    @occupation = FactoryGirl.create(:occupation)
    assert_difference('Occupation.count', -1) do
      delete :destroy, :id => @occupation.id
    end
  end

end
