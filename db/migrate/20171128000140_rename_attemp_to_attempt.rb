class RenameAttempToAttempt < ActiveRecord::Migration[5.1]
  def change
  	rename_table :attemps, :attempts
  end
end
