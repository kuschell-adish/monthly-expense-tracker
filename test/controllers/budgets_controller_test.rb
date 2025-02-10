require 'test_helper'

class BudgetsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get budgets_edit_url
    assert_response :success
  end

  test "should get update" do
    get budgets_update_url
    assert_response :success
  end

end
