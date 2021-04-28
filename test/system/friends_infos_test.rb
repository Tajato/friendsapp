require "application_system_test_case"

class FriendsInfosTest < ApplicationSystemTestCase
  setup do
    @friends_info = friends_infos(:one)
  end

  test "visiting the index" do
    visit friends_infos_url
    assert_selector "h1", text: "Friends Infos"
  end

  test "creating a Friends info" do
    visit friends_infos_url
    click_on "New Friends Info"

    fill_in "First name", with: @friends_info.first_name
    fill_in "Instagram", with: @friends_info.instagram
    fill_in "Last name", with: @friends_info.last_name
    fill_in "Phone number", with: @friends_info.phone_number
    click_on "Create Friends info"

    assert_text "Friends info was successfully created"
    click_on "Back"
  end

  test "updating a Friends info" do
    visit friends_infos_url
    click_on "Edit", match: :first

    fill_in "First name", with: @friends_info.first_name
    fill_in "Instagram", with: @friends_info.instagram
    fill_in "Last name", with: @friends_info.last_name
    fill_in "Phone number", with: @friends_info.phone_number
    click_on "Update Friends info"

    assert_text "Friends info was successfully updated"
    click_on "Back"
  end

  test "destroying a Friends info" do
    visit friends_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friends info was successfully destroyed"
  end
end
