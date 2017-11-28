module AttemptsHelper

	def show_answers(list, item)
		list.attempts.map { |attempt| attempt.answers.select {|a| a.list_item_id == item.id } }.flatten
	end
end
