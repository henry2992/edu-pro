require 'rails_helper'

RSpec.describe AttempsController, type: :controller do

	describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end

    it "assigns @lists to attemps page" do
      list = List.create(name: 'Countries')
      get :index
      expect(assigns(:lists)).to eq([list])
    end
  end

  describe "POST create" do
	  context "with valid attributes" do
	    it "creates a new attemp with correct answers " do
	    	list = List.create(name: 'Animals')
	    	list.list_items << ListItem.create(name: 'Dog')
	    	list.list_items << ListItem.create(name: 'Cat')
	    	post :create, params: {list: list, item: { list_item_ids: [1] } }
			  expect(Attemp.count).to eq(1) 
			  expect(Attemp.first.answers.count).to eq(2)
			  expect(Attemp.first.answers.first.marked).to eq(true)
			  expect(Attemp.first.answers.second.marked).to eq(false)
	    end

	    it "redirects to the attmps page" do
	    	list = List.create(name: 'Animals')
	    	post :create, params: {list: list, item: { list_item_ids: [1] } }
			  expect(response).to redirect_to(attemps_url)
	    end
	  end
	end
end
