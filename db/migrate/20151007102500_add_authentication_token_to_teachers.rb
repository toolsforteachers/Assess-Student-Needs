class AddAuthenticationTokenToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :authentication_token, :string, index: true
  end
end
