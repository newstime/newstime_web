class Edition
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name, type: String
  field :path, type: String
  field :created_at, type: Time

  has_mongoid_attached_file :cover
end
