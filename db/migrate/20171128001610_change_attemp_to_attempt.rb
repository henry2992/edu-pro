class ChangeAttempToAttempt < ActiveRecord::Migration[5.1]
  def change
  	rename_column :answers, :attemp_id, :attempt_id
  end
end
