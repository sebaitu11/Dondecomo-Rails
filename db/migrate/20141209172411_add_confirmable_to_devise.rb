class AddConfirmableToDevise < ActiveRecord::Migration
  def up
    add_column :owners, :confirmation_token, :string
    add_column :owners, :confirmed_at, :datetime
    add_column :owners, :confirmation_sent_at, :datetime
    # add_column :owners, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :owners, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # owners as confirmed, do the following
    Owner.update_all(:confirmed_at => Time.now)
    # All existing user accounts should be able to log in after this.
  end
  
  def down
    remove_columns :owners, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
