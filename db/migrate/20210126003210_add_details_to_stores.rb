class AddDetailsToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :city, :string
    add_column :stores, :country, :string
  end
end
