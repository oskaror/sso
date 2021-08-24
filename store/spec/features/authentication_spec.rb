require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  let(:email) { 'user@example.com'}
  let(:password) { 'password'}

  let!(:user) { create(:user, email: email, password: password) }

  scenario 'Sign in' do
    visit root_path
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_on 'Sign in'

    expect(page.status_code).to eq(200)
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content('Welcome')
    expect(page).to have_content("User: #{email}")
    expect(page).to have_content("Role: #{user.role}")
  end
end