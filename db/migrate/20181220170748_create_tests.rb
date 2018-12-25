class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
        t.integer :paper_id
      t.integer :user_id
      t.decimal :mark
      t.boolean :status


      t.timestamps
    end
  end
end
