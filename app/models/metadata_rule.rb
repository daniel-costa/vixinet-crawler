class MetadataRule
  include Mongoid::Document
  
  field :name, type: String
  field :regex, type: String
  field :xpath, type: String
  field :css, type: String
  
  belongs_to :platform
end
