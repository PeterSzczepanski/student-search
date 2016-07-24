class AddLowercaseIndexesToStudents < ActiveRecord::Migration
  def up
    execute %{ CREATE INDEX
            students_lower_last_name
          ON
            students (lower(last_name) varchar_pattern_ops)
        }
    execute %{ CREATE INDEX
            students_lower_first_name
          ON
            students (lower(first_name) varchar_pattern_ops)
        }
  end

  def down
    remove_index :students, name: 'students_lower_last_name'
    remove_index :students, name: 'students_lower_first_name'
  end
end
