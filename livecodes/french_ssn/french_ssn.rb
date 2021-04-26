require 'date'
require 'yaml'

def french_ssn_info(ssn)
  regex_pattern = /^(?<gender>1|2) (?<year_of_birth>\d{2}) (?<month_of_birth>[1-9] |1[0-2] )(?<department_of_birth>0[1-9]|[1-9][0-9]) (?<random_number>\d{3} \d{3}) (?<key>[0-8][0-9]|9[0-6])$/  

  if ssn.match?(regex_pattern)
    match_data = ssn.match(regex_pattern)

    ssn_integer = ssn[0...-2].split.join.to_i
    if (97 - ssn_integer) % 97 == match_data[:key].to_i
      if match_data[:gender].to_i == 1
        gender = "man"
      else
        gender = "woman"
      end

      months = Date::MONTHNAMES
      month  = months[match_data[:month_of_birth].to_i]
      
      if Date.today.year.to_s[2..3].to_i < match_data[:year_of_birth].to_i
        year = "19#{match_data[:year_of_birth]}"
      else
        year = "20#{match_data[:year_of_birth]}"
      end

      departments = YAML.load_file('data/french_departments.yml')
      department = departments[match_data[:department_of_birth]]

      "a #{gender}, born in #{month}, #{year} in #{department}."
    else
      "The number is invalid"
    end
  else
    "The number is invalid"
  end
end