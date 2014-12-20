class MediaPage < ActiveRecord::Base
    belongs_to :user
    attr_accessible :name, :content, :user_id

    validates :name, presence: true
    validates :content, presence: true
    validates :user_id, presence: true
end
