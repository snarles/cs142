class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :user_id, :int
      t.column :photo_id, :int
      t.column :date_time, :string
      t.column :comment, :string
      t.timestamps
    end
  end
end
