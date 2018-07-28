class CreateStudentTeacherRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :student_teacher_relations do |t|
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps
    end
    add_index :student_teacher_relations, :student_id
    add_index :student_teacher_relations, :teacher_id
  end
end
