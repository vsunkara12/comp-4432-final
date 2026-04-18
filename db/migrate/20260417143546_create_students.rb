class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :role

      t.timestamps
    end
  end
end
