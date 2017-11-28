require 'rails_helper'

RSpec.describe ListsController, type: :controller do

  let(:valid_attributes) { {name: 'Animals' } }

  describe "GET #index" do
    it "returns a success response" do
      list = List.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end

    it "returns first Item in list" do
      list = List.create(name: 'Countries')
      get :index
      expect(assigns(:list)).to eq(list)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      list = List.create! valid_attributes
      get :show, params: {id: list.to_param}
      expect(response).to be_success
    end

    it "should show a specific list" do
      list = List.create(name: 'Countries')
      get :show, params: {id: list.to_param}
      expect(assigns(:list)).to eq list
    end

    it "renders the #show view" do
      list = List.create(name: 'Countries')
      get :show,  params: { id: list.id }
      expect(list).to render_template("lists/show")
    end
  end
end
