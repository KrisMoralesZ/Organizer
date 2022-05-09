# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
    has_many :tasks
    validates :name, :description, presence: true
    validates :name, uniqueness: {case_insensitive: false}
    validate :due_date_validity
    def due_date_validity
        return if due_date.blanck?
        return if due_date > Date.today
        errors.add :due_date, I18n.t('task.error.invalid_due_date')
    end
    
end
