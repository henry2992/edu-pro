class CreateAttemps < ActiveRecord::Migration[5.1]
  def change
    create_table :attemps do |t|
      t.belongs_to :list, index: true
      t.timestamps
    end
  end
end
