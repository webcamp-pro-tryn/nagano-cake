class AddColumsToCustomers < ActiveRecord::Migration[5.2]
  def change
  	  add_column :customers, :family_name, :string
  	  add_column :customers, :first_name, :string
  	  add_column :customers, :family_name_kana, :string
  	  add_column :customers, :first_name_kana, :string
  	  add_column :customers, :postal_code, :string
  	  add_column :customers, :address, :string
  	  add_column :customers, :phone_number, :string
  	  add_column :customers, :is_deleted, :boolean

  	  change_column :customers, :family_name, :string, null:false, index:true
  	  change_column :customers, :first_name, :string, null:false, index:true
  	  change_column :customers, :family_name_kana, :string, null:false
  	  change_column :customers, :first_name_kana, :string, null:false
  	  change_column :customers, :postal_code, :string, null:false
  	  change_column :customers, :address, :string, null:false
  	  change_column :customers, :phone_number, :string, null:false
  	  change_column :customers, :is_deleted, :boolean, null:false, default: false
  end
end
