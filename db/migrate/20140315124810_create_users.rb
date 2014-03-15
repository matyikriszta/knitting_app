class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_image
      t.string :membership, default: "basic"

      t.timestamps
    end
  end
end
