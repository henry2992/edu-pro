class AttemptsController < ApplicationController
  def index
    @lists = List.all
  end

  def create
    list = List.find(params['list'])
    attempt = Attempt.new(list: list)
    list.list_items.each do |item|
      answer = attempt.answers.build(name: item.name)
      answer.list_item_id = item.id
      answer.marked = params[:item]['list_item_ids'].include?(item.id.to_s) if params[:item]
    end
    if attempt.save
      next_list = list.next if params['commit'] == 'Submit and Next List'
      redirect_to(next_list ? list_path(next_list) : attempts_path)
    else
      redirect_to attempts_path
    end
  end
end
