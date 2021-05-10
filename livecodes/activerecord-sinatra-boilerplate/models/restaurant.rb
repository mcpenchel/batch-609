class Restaurant < ActiveRecord::Base
  # 'Cause it inherited from ActiveRecord::Base,
  # AND because the name of the class is the name of the table
  # in singular,
  # this model will have the following methods:

  # all attr_accessors (except id, for id we just have reader)
  # self.all
  # self.where
  # self.find
  # self.find_by
  # ...
end