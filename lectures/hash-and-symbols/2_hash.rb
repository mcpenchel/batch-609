# CREATING A NEW HASH
pedro_teacher = {
  "name" => "Pedro",
  "age" => 27,
  "parents" => ["Dad", "Mom"]
}

# READ
pedro_teacher["name"] # "Pedro"
pedro_teacher["age"]  # 27
pedro_teacher["parents"] # ["Dad", "Mom"]
pedro_teacher["parents"][1] # "Mom"

# UPDATE
pedro_teacher["name"] = "Pedro Miranda"
pedro_teacher["parents"][1] = "Super Mom"

# CREATE A NEW KEY-VALUE PAIR
pedro_teacher["single"] = false

# DELETING A KEY-VALUE PAIR
pedro_teacher.delete("name")

# You can have complex hashes
lw_teachers = {
  "matheus" => {
    "name" => "Matheus",
    "age" => 31,
    "parents" => ["Martenick", "Leila"]
  },
  "pedro" => pedro_teacher
}

# READ the value by the key

lw_teachers["matheus"]["name"] # "Matheus"
lw_teachers["matheus"]["age"] # "Matheus"
lw_teachers["matheus"]["parents"][0] # "Martenick"