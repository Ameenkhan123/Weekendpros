class AddUsernameFirstnameLastnameContactAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :contact, :string
    add_column :users, :address, :string
    add_column :users, :terms_conditions, :boolean
  end
end
