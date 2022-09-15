# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: '15'
    fill_in 'Published', with: '3000-12-01'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'invalid date input' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: '15'
    fill_in 'Published', with: '3ab0-12-01'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'invalid price input' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: '1a'
    fill_in 'Published', with: '3000-12-01'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end

  scenario 'missing author input' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: ''
    fill_in 'Price', with: '15'
    fill_in 'Published', with: '3000-12-01'
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end

  scenario 'missing date input' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: '15'
    fill_in 'Published', with: ''
    click_on 'Create Book'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end
end
