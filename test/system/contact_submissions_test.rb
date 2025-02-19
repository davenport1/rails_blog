require "application_system_test_case"

class ContactSubmissionsTest < ApplicationSystemTestCase
  setup do
    @contact_submission = contact_submissions(:one)
  end

  test "visiting the index" do
    visit contact_submissions_url
    assert_selector "h1", text: "Contact submissions"
  end

  test "should create contact submission" do
    visit contact_submissions_url
    click_on "New contact submission"

    fill_in "Email", with: @contact_submission.email
    fill_in "Message", with: @contact_submission.message
    fill_in "Name", with: @contact_submission.name
    fill_in "Subject", with: @contact_submission.subject
    click_on "Create Contact submission"

    assert_text "Contact submission was successfully created"
    click_on "Back"
  end

  test "should update Contact submission" do
    visit contact_submission_url(@contact_submission)
    click_on "Edit this contact submission", match: :first

    fill_in "Email", with: @contact_submission.email
    fill_in "Message", with: @contact_submission.message
    fill_in "Name", with: @contact_submission.name
    fill_in "Subject", with: @contact_submission.subject
    click_on "Update Contact submission"

    assert_text "Contact submission was successfully updated"
    click_on "Back"
  end

  test "should destroy Contact submission" do
    visit contact_submission_url(@contact_submission)
    click_on "Destroy this contact submission", match: :first

    assert_text "Contact submission was successfully destroyed"
  end
end
