module AttempsHelper

	def show_answers(list, item)
		list.attemps.map { |attemp| attemp.answers.select {|a| a.list_item_id == item.id } }.flatten
	end



end
