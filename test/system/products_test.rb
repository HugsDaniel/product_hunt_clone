require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  test "lets a signed in user create a new product" do
    # Log in
    login_as users(:george)

    # Visit new product page
    visit "/products/new"

    # Input name and tagline
    fill_in "product_name", with: "Wits"
    fill_in "product_tagline", with: "Surf to the death, headless."

    # submit, click on create product
    click_on "Create Product"

    # Verify that we are on products page with name in h1
    assert_equal root_path, page.current_path
    assert_text "Wits"
    assert_text "Surf to the death, headless."
  end
end
