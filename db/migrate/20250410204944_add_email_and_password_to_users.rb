class AddEmailAndPasswordToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :email, :string
    # comment out:  add_column :users, :password_digest, :string
  end
end
