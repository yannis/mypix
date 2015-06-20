require 'rails_helper'

RSpec.describe PicsController, type: :controller do

  let!("user") {create :user, name: "user"}

  3.times do |i|
    let!("pic_#{i+1}") {create :pic, user: user}
  end
  10.times do |i|
    let!("pic_#{i+4}") {create :pic}
  end

  context "Not signed in" do

    describe "show" do
      before {get :show, id: pic_1.to_param}
      should_be_asked_to_sign_in
    end

    describe "new" do
      before {get :new}
      should_be_asked_to_sign_in
    end

    describe "edit" do
      before {get :edit, id: pic_1.to_param}
      should_be_asked_to_sign_in
    end

    describe "create" do
      before {post :update, id: pic_1.to_param, user: {name: "new name"}}
      should_be_asked_to_sign_in
    end

    describe "update" do
      before {put :update, id: pic_1.to_param, user: {name: "new name"}}
      should_be_asked_to_sign_in
    end

    describe "destroy" do
      before {delete :destroy, id: pic_1.to_param}
      should_be_asked_to_sign_in
    end
  end

  context "Signed in" do
    before {sign_in user}

    describe "show with valid id" do
      before {get :show, id: pic_1.to_param}
      it {expect(response).to be_success}
      it {expect(response).to render_template 'show'}
      it {expect(assigns(:pic)).to eql pic_1}
    end

    describe "show with valid id and type=modal" do
      before {get :show, id: pic_1.to_param, type: 'modal'}
      it {expect(response).to be_success}
      it {expect(response).to render_template 'pics/modal'}
      it {expect(assigns(:pic)).to eql pic_1}
    end

    describe "show with invalid id" do
      before {get :show, id: pic_4.to_param}
      should_not_be_authorized
    end

    describe "new" do
      before {get :new}
      it {expect(response).to be_success}
      it {expect(response).to render_template 'new'}
      it {expect(assigns(:pic)).to be_a Pic}
    end


    describe "edit with valid id" do
      before {get :edit, id: pic_1.to_param}
      it {expect(response).to be_success}
      it {expect(response).to render_template 'edit'}
      it {expect(assigns(:pic)).to eql pic_1}
    end

    describe "edit with invalid id" do
      before {get :edit, id: pic_4.to_param}
      should_not_be_authorized
    end

    describe "create with valid data" do
      before {post :create, pic: {title: "new title", image: Rack::Test::UploadedFile.new(File.join(Rails.root.join('db', 'random_images', "picture_#{(1..70).to_a.sample}.jpeg").to_s), "image/jpeg")}}
      it {expect(response).to redirect_to pic_path(assigns(:pic))}
      it {expect(assigns(:pic).title).to eql "new title"}
      it {expect(flash[:notice]).to eql "Pic created"}
    end

    describe "create with invalid data" do
      before {post :create, pic: {title: "new title", image: ImageUploader.new}}
      it {expect(response).to render_template 'new'}
      it {expect(assigns(:pic).title).to eql "new title"}
      it {expect(assigns(:pic).errors.full_messages).to match_array ["Image can't be blank"]}
    end

    describe "update with valid id and valid data" do
      before {put :update, id: pic_1.to_param, pic: {title: "new title"}}
      it {expect(response).to redirect_to pic_path(pic_1)}
      it {expect(assigns(:pic)).to eql pic_1}
      it {expect(pic_1.reload.title).to eql "new title"}
      it {expect(flash[:notice]).to eql "Pic updated"}
    end

    describe "destroy" do
      before {
        @pic_count = Pic.count
        delete :destroy, id: pic_1.to_param
      }
      it {expect(response).to redirect_to user_path(user)}
      it {expect(assigns(:pic)).to eql pic_1}
      it {expect(flash[:notice]).to eql "Picture successfully destroyed"}
      it {expect(@pic_count-Pic.count).to eql 1}
    end
  end
end
