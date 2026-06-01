require "potter"

module Meijer
  class Request < Potter::Request
    root "https://www.meijer.com/bin/meijer/"
    header accept: 'application/json',
           content_type: 'application/json',
           cookie: Potter::OP

    scope :receipts, -> { path('receipts') }
    scope :pdf, ->(id) { params(receiptId: id.to_s, formatType: "PDF", type: 2) }
  end

  class Response < Potter::Response
  end
end
