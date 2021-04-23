students     = ["Maykon", "João", "Carla"]
student_ages = [30, 27, 37]

students.each_with_index do |student, index|
  puts "#{student} is #{student_ages[index]} years old"
end

# This sucks!!

students = [["Maykon", 30], ["João", 27], ["Carla", 37]]

students.each do |sub_array|
  puts "#{sub_array[0]} if #{sub_array[1]} years old"
end

# This sucks too!!