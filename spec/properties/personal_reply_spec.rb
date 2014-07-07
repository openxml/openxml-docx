require "spec_helper"

describe Rocx::Properties::PersonalReply do
  include ValuePropertyTestMacros

  it_should_use tag: :personalReply, name: "personal_reply"

  with_value(true) do
    it_should_work
    it_should_output "<w:personalReply w:val=\"true\"/>"
  end

  with_value(false) do
    it_should_work
    it_should_output ""
  end

  with_value(nil) do
    it_should_work
    it_should_output ""
  end

end
