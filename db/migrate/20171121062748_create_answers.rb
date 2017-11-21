class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :name
      t.integer :list_item_id
      t.boolean :marked
      t.belongs_to :attemp, index: true
      t.timestamps
    end
  end
end
