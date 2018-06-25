require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Timesheet Yinke"
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", I18n.t('static_pages.home.title') + " | #{@base_title}"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", I18n.t('static_pages.help.title') + " | #{@base_title}"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", I18n.t('static_pages.about.title') + " | #{@base_title}"
  end

end
