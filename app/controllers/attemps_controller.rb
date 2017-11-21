class AttempsController < ApplicationController
  def index
  	@lists = List.all
  end

  def create
  	list = List.find(params['list'])
  	attemp = Attemp.new(list: list)
  	list.list_items.each do |item|
  		answer = attemp.answers.build(name: item.name)
      answer.list_item_id = item.id
			answer.marked = params[:item]['list_item_ids'].include?(item.id.to_s) if params[:item]
		end

  	if attemp.save
  		redirect_to attemps_path
  	else
  		redirect_to attemps_path
  	end
  end
end
