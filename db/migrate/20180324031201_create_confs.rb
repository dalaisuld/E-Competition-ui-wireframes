class CreateConfs < ActiveRecord::Migration[5.0]
  def change
    create_table :confs do |t|
      t.string :title
      t.integer :max
      t.text :descreption
      t.string :evaluation
      t.string :text
      t.timestamps
    end
  end
end
