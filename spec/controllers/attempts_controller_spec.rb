require 'rails_helper'

RSpec.describe AttemptsController, type: :controller do

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

	  	let!(:list_one) { create(:list) }
  		let!(:list_two) { create(:list, name: "Countries") }

	    it "creates a new attemtp with correct answers " do
	    	list_one.list_items << ListItem.create(name: 'Dog')
	    	list_one.list_items << ListItem.create(name: 'Cat')
	    	post :create, params: {list: list_one, item: { list_item_ids: [1] } }
			  expect(Attempt.count).to eq(1) 
			  expect(Attempt.first.answers.count).to eq(2)
			  expect(Attempt.first.answers.first.marked).to eq(true)
			  expect(Attempt.first.answers.second.marked).to eq(false)
	    end

	    it "redirects to the attemtps page" do
	    	post :create, params: {list: list_one, item: { list_item_ids: [1] } }
			  expect(response).to redirect_to(attempts_url)
	    end

	    it "redirects to next list" do
	    	post :create, params: {list: list_one, commit: 'Submit and Next List', item: { list_item_ids: [1] } }
			  expect(response).to redirect_to(list_url(list_two))
	    end

	    it "redirects to attemps page if list is the last one" do
	    	post :create, params: {list: list_two, commit: 'Submit and Next List', item: { list_item_ids: [1] } }
			  expect(response).to redirect_to(attempts_url)
	    end
	  end
	end
end
