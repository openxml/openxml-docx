module Rocx
  module Elements
    class DeletedText < Text
      tag :del
      attribute :space, expects: :valid_space_preserve, namespace: :xml
    end
  end
end
