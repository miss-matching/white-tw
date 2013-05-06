#coding: utf-8
class NgWord < ActiveRecord::Base
  belongs_to :account
  attr_accessible :word ,:account_id

  validates :account_id,
              presence: true

  validates :word, 
              presence: true,
              length:  {maximum: 140} # NOTE:ruby1.9なのでtwitterと等価

end
