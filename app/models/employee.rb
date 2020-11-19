class Employee < ApplicationRecord
    belongs_to :dog
#     validates :alias, uniqueness: true
#     end
#     validates :title, uniqueness: true
#     end
end

# class Library < ApplicationRecord
#     has_many :books
#     validates_associated :books
#   end