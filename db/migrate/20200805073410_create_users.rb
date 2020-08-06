class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :facebook_id, :null => false
      t.boolean :welcomed, :default => false
      t.datetime :last_message_timestamp

      t.timestamps
    end
  end
end
