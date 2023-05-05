class Project < ApplicationRecord
    has_many :tasks
    after_initialize :set_defaults #so after_initialize(callback) is called after the object is created. There is another callback called after_create

    validates_presence_of :title, :description

    scope :almost_complete, -> {where('percent_complete > 75.0')}
    scope :still_needs_some_works, -> {where('percent_complete < 75.0')}

    def set_defaults #after_initialize calls set_defaults which returns either the value given or if there is no value then returns 22
        self.percent_complete ||= 22
    end
end
