require 'rails_helper'

RSpec.describe CodesController, type: :controller do
  let(:create_kind) {FactoryGirl.create(:kind)}
  let(:create_code) {FactoryGirl.create(:code)}
  describe "#new" do
    it "render template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "assign object" do
      get :new
      expect(assigns(:code)).to be_a_new(Code)
    end
  end

  describe "#create"do
    context "with valid data" do
      before do create_kind end
      let(:valid_code) {post :create, code: FactoryGirl.attributes_for(:code)}
      it "save data to database" do
        before = Code.count
        valid_code
        after = Code.count
        expect(after).to eq(before+1)
      end
      it "redirect to index page" do
        valid_code
        expect(response).to redirect_to(root_path)
      end
      it "flash message" do
        valid_code
        expect(flash[:notice]).to be
      end
    end
    context "with invalid data" do
      before do create_kind end
      let(:invalid_code) {post :create, code: FactoryGirl.attributes_for(:code).merge(title:"")}
      it "no saved data in database" do
        before = Code.count
        invalid_code
        after = Code.count
        expect(after).to eq(before)
      end
      it "render new template" do
        invalid_code
        expect(response).to render_template(:new)
      end
      it "flash message" do
        invalid_code
        expect(flash[:notice]).to be
      end
    end
  end

  describe "#edit" do
    it "render template"
    it "sets an instance varible with the passed id"
  end

  describe "#update" do
    context "with valid data" do
      it "updates the record whose id is passed"
      it "redirect to show page"
      it "flash message"
    end
    context "with invalid data"do
      it "do not update the record"
      it "render edit page"
    end
  end

  describe "#show" do
    it "render show page"
    it "assign a varible "
  end

  describe "destroy" do

  end

end
