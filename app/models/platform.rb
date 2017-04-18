class Platform
  include Mongoid::Document
  
  field :name, type: String
  field :base_url, type: String
  field :entry_validation, type: String
  field :harvest, type: String

  has_many :entries
  has_many :metadata_rules
end
