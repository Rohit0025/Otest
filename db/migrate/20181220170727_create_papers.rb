class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
       t.integer :subject_id

      t.timestamps
    end
  end
end
