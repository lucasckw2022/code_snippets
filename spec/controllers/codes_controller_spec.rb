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
      let(:valid_code) {post :create, code: FactoryGirl.attributes_for(:code).merge(kind_id: create_kind.id)}
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
    before do get :edit,
       id: create_code
     end
    it "render template" do
      expect(response).to render_template(:edit)
    end
    it "sets an instance varible with the passed id" do
      expect(assigns(:code)).to eq(Code.last)
    end
  end

  describe "#update" do
    context "with valid data" do
      let(:valid_title){"Hello"}
      before do
        patch :update, id: create_code, code: {title: valid_title}
         end
      it "updates the record whose id is passed" do
        expect(create_code.reload.title).to eq(valid_title)
      end
      it "redirect to show page" do
        expect(response).to redirect_to(code_path(Code.last))
      end
      it "flash message" do
        expect(flash[:notice]).to be
      end
    end
    context "with invalid data"do
      before do
        patch :update, id: create_code, code: {title: nil}
      end
      it "do not update the record" do
        expect(create_code.title).to eq(create_code.reload.title)
      end
      it "render edit page" do
        expect(response).to render_template(:edit)
      end
    end
  end

end
