# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentication', type: :feature do
  let(:email) { 'user@example.com' }
  let(:password) { 'password' }

  let!(:user) { create(:user, email: email, password: password) }
  let(:cookie) { Capybara.current_session.driver.request.cookies.[]('session') }

  scenario 'Sign in with valid params' do
    visit root_path
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_on 'Sign in'

    expect(cookie).to be_present
    expect(page.status_code).to eq(200)
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content('Welcome')
    expect(page).to have_content("User: #{email}")
    expect(page).to have_content("Role: #{user.role}")
    expect(page).to have_content('Go To Analytics')
  end

  scenario 'Sign in with invalid params' do
    visit root_path
    fill_in 'email', with: 'invalid'
    fill_in 'password', with: 'invalid'
    click_on 'Sign in'

    expect(page.status_code).to eq(200)
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')

    expect(cookie).not_to be_present
    expect(page).not_to have_content('Welcome')
    expect(page).not_to have_content("User: #{email}")
    expect(page).not_to have_content("Role: #{user.role}")
  end
end
