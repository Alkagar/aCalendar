class Task < ActiveRecord::Base
    belongs_to :user
    belongs_to :task_type
    attr_accessible :begin, :description, :duration, :end, :name

    validate :begin_before_end
    validates :name, :presence => true, :length => { :in => 5..400 }

    def begin_before_end
        unless self.begin.nil? or self.end.nil?
            if self.begin > self.end
                errors.add(:begin, 'cannot be after end.')
            end
        else
            if self.begin.nil? 
                errors.add(:begin, "can't be empty")
            end
            if self.end.nil?
                errors.add(:end, "can't be empty")
            end
        end
    end

    def compute_duration
        time_diff = (self.end - self.begin) / 60
    end
end
