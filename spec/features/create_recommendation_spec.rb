require 'rails_helper'

describe 'RecommendationsController' do
  let(:doctor) { create(:doctor) }
  let(:patient) { create(:patient) }
  let(:recommendation) { 'Take pills twice a day' }

  before do
    login_as(doctor.user, scope: :user)
    visit doctor_profile_path
    create(:appointment, doctor: doctor, patient: patient)
  end

  describe 'POST create' do
    before do
      fill_in 'send_recommendation', with: recommendation
      click_button('Send recommendation')
    end

    it { expect(page).to have_http_status(:ok) }
    it { expect(page).to have_current_path doctor_profile_path }
  end
end
