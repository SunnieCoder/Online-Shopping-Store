class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :text
      t.string :email
      t.string :paytype

      t.timestamps
    end
  end
end
