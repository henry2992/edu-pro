class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.string :name
      t.belongs_to :list, index: true
      t.timestamps
    end
  end
end
