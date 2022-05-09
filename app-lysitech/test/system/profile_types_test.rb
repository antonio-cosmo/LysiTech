require "application_system_test_case"

class ProfileTypesTest < ApplicationSystemTestCase
  setup do
    @profile_type = profile_types(:one)
  end

  test "visiting the index" do
    visit profile_types_url
    assert_selector "h1", text: "Profile types"
  end

  test "should create profile type" do
    visit profile_types_url
    click_on "New profile type"

    fill_in "Description", with: @profile_type.description
    click_on "Create Profile type"

    assert_text "Profile type was successfully created"
    click_on "Back"
  end

  test "should update Profile type" do
    visit profile_type_url(@profile_type)
    click_on "Edit this profile type", match: :first

    fill_in "Description", with: @profile_type.description
    click_on "Update Profile type"

    assert_text "Profile type was successfully updated"
    click_on "Back"
  end

  test "should destroy Profile type" do
    visit profile_type_url(@profile_type)
    click_on "Destroy this profile type", match: :first

    assert_text "Profile type was successfully destroyed"
  end
end
