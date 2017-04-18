class Metadatum
  include Mongoid::Document
  include Mongoid::Timestamps
  field :value, type: String
  field :name, type: String

  embedded_in :entry
end
