class CreateConfs_user < ActiveRecord::Migration[5.0]
  def change
    create_table :confs :users do |t|
      t.index [:user_id, :conf_id]
      t.index [:conf_id, :user_id]
    end
  end
end
