# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Session do
  context '.from_token' do
    let!(:user) { create(:user, email: 'user@example.com') }
    let(:token) do
      'eyJhbGciOiJIUzI1NiJ9.eyJ0eXBlIjoic2Vzc2lvbiIsImV4cCI6MTYzMDQ5MTAyNCw' \
        'iZW1haWwiOiJ1c2VyQGV4YW1wbGUuY29tIiwicm9sZSI6InVzZXIifQ.WkxZ8wHMDiF7' \
        '-jF0rnum4-dBef-0Z3bDTW_yUCTNFzE'
    end

    subject(:fetch_session) { described_class.from_token(token) }

    it 'returns a session' do
      expect(fetch_session).to be_an_instance_of(Session)
    end

    it 'contains a user' do
      expect(fetch_session.user).to eq(user)
    end

    context 'when the token is invalid' do
      let(:token) { 'invalid' }

      it 'returns the nil value' do
        expect(fetch_session).to eq(nil)
      end
    end

    context 'when the user is missing' do
      let!(:user) { nil }

      it 'returns the nil value' do
        expect(fetch_session).to eq(nil)
      end
    end
  end

  context '.generate_token' do
    let!(:user) { create(:user, email: 'user@example.com') }

    subject(:generate_token) { described_class.new(user).generate_token }

    it 'returns a string' do
      expect(generate_token).to be_a(String)
    end

    it 'returns a valid token ' do
      token = generate_token
      expect(described_class.from_token(token)).to be_an_instance_of(Session)
    end
  end
end
