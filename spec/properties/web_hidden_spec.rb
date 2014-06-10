require "spec_helper"

describe Rocx::Properties::WebHidden do
  include ValuePropertyTestMacros

  it_should_use tag: :webHidden, name: "web_hidden"

  with_value(true) do
    it_should_work
    it_should_output "<w:webHidden/>"
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
