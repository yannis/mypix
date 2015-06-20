require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context "Not signed in" do
    before {get :index}
    it {expect(response).to be_success}
    it {expect(response).to render_template 'index'}
  end
  context "Signed in" do
    let(:user) {create :user}
    before do
      sign_in user
      get :index
    end

    it {expect(response).to redirect_to(user_path(user))}
  end
end
