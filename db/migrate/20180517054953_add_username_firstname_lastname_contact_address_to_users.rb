class AddUsernameFirstnameLastnameContactAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :contact, :string
    add_column :users, :address, :string
    add_column :users, :terms_conditions, :boolean
    ## OmniAuth-able
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
  end
end
