require 'test_helper'

class ScraperControllerTest < ActionDispatch::IntegrationTest
  test "should get vb" do
    get scraper_vb_url
    assert_response :success
  end

  test "should get knews" do
    get scraper_knews_url
    assert_response :success
  end

  test "should get kloop" do
    get scraper_kloop_url
    assert_response :success
  end

end
