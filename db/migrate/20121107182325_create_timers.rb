class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.references :user
      t.references :project
      t.float :duration, default: 0
      t.string :description
      t.datetime :last_activated_at

      t.timestamps
    end
    add_index :timers, :user_id
    add_index :timers, :project_id
  end
end
