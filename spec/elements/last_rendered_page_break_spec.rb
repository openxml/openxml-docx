require "spec_helper"

describe Rocx::Elements::LastRenderedPageBreak do
  include ElementTestMacros

  it_should_use tag: :lastRenderedPageBreak, name: "last_rendered_page_break"

  with_no_attributes_set do
    it_should_output "<w:lastRenderedPageBreak/>", assign: false
  end

end
