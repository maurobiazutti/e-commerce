class AddColumnRoleToUser < ActiveRecord::Migration[8.0]
  def change
    create_enum :role_user, %w[admin user]

    change_table :users do |t|
      t.enum :role, enum_type: :role_user, default: 'user', null: false
    end
  end
end
