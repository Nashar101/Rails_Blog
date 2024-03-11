require "application_system_test_case"

class BlogtextsTest < ApplicationSystemTestCase
  setup do
    @blogtext = blogtexts(:one)
  end

  test "visiting the index" do
    visit blogtexts_url
    assert_selector "h1", text: "Blogtexts"
  end

  test "should create blogtext" do
    visit blogtexts_url
    click_on "New blogtext"

    fill_in "Owner", with: @blogtext.owner
    click_on "Create Blogtext"

    assert_text "Blogtext was successfully created"
    click_on "Back"
  end

  test "should update Blogtext" do
    visit blogtext_url(@blogtext)
    click_on "Edit this blogtext", match: :first

    fill_in "Owner", with: @blogtext.owner
    click_on "Update Blogtext"

    assert_text "Blogtext was successfully updated"
    click_on "Back"
  end

  test "should destroy Blogtext" do
    visit blogtext_url(@blogtext)
    click_on "Destroy this blogtext", match: :first

    assert_text "Blogtext was successfully destroyed"
  end
end
