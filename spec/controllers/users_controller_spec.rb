require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  3.times do |i|
    let!("user_#{i+1}") {create :user, name: "user_#{i+1}"}
  end

  context "Not signed in" do

    describe "show" do
      before {get :show, id: user_1.to_param}
      should_be_asked_to_sign_in
    end
  end

  context "Signed in" do
    before {sign_in user_1}

    describe "show" do
      before {get :show, id: user_1.to_param}
      it {expect(response).to be_success}
      it {expect(response).to render_template 'show'}
      it {expect(assigns(:user)).to eql user_1}
    end
  end
end
