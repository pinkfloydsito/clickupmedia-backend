class AddNumbersToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :number, :string
  end
end
