class Incident < ActiveRecord::Base
  belongs_to :status  
  belongs_to :cate
  belongs_to :reporter, :class_name => "Person", :foreign_key => :reporter_id
  belongs_to :assignee, :class_name => "Person", :foreign_key => :assignee_id
  validates :location, :severity, :cate_id, :reporter_id, presence: true
  validates :other_cate_description, presence: true, :if => :other_cate?
  has_attached_file :cover ,
    styles: {
      originial: "1024x1024>",
      cover: "300x300>",
      icon:  "150x150#"
    },
    default_url: "/images/missing.png"
    validates_attachment_content_type :cover , content_type: /\Aimage\/.*\Z/

  def other_cate?
    cate_id == Cate.last.id
  end
end
