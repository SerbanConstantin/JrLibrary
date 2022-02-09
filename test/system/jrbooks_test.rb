require "application_system_test_case"

class JrbooksTest < ApplicationSystemTestCase
  setup do
    @jrbook = jrbooks(:one)
  end

  test "visiting the index" do
    visit jrbooks_url
    assert_selector "h1", text: "Jrbooks"
  end

  test "creating a Jrbook" do
    visit jrbooks_url
    click_on "New Jrbook"

    fill_in "Author", with: @jrbook.author
    fill_in "Book rating", with: @jrbook.book_rating
    fill_in "Name", with: @jrbook.name
    check "Read" if @jrbook.read
    click_on "Create Jrbook"

    assert_text "Jrbook was successfully created"
    click_on "Back"
  end

  test "updating a Jrbook" do
    visit jrbooks_url
    click_on "Edit", match: :first

    fill_in "Author", with: @jrbook.author
    fill_in "Book rating", with: @jrbook.book_rating
    fill_in "Name", with: @jrbook.name
    check "Read" if @jrbook.read
    click_on "Update Jrbook"

    assert_text "Jrbook was successfully updated"
    click_on "Back"
  end

  test "destroying a Jrbook" do
    visit jrbooks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jrbook was successfully destroyed"
  end
end
