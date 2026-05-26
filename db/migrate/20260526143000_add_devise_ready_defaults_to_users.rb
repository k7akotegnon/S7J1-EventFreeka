class AddDeviseReadyDefaultsToUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_default :users, :email, from: nil, to: ""
    change_column_null :users, :email, false, ""

    change_column_default :users, :encrypted_password, from: nil, to: ""
    change_column_null :users, :encrypted_password, false, ""
  end
end
