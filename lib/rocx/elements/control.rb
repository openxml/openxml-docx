module Rocx
  module Elements
    class Control < Element
      attribute :id, expects: :string, namespace: :r
      attribute :unique_name, expects: :string, displays_as: :name
      attribute :shape_id, expects: :string, displays_as: :shapeid

    end
  end
end
