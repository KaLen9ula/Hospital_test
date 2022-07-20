require 'rails_helper'

describe AvatarController, type: :controller do
  let(:user) { create(:user) }
  let(:new_avatar) { build(:avatar) }
  let(:image) { Rack::Test::UploadedFile.new('spec/fixtures/avatar.jpg', 'image/jpg') }


  let(:params) { { user_id: user.id, avatar: { image: image } } }

  before do
    sign_in user
  end

  describe 'POST create' do
    it { expect { post :create, params: params }.to change(Avatar, :count).by(1) }
  end
end
