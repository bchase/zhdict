# a web app should be able to able to access 
# many different dictionaries like this one,
# from one language to another.
#
# furthermore, a common interface would be nice

Entry.search('還好', from: :zh, to: :en)

class Entry < ActiveRecord::Base
  include Dict::Entry
end


module Dict
  module Entry
    # ...
  end

  @@dictionaries = []
  def self.extended(base)
    self.dictionaries << base
  end

  def self.dictionaries
    @@dictionaries
  end
end

module Zhdict
  extend Dict

  def self.from
    :zh
  end

  def self.to
    :en
  end

  def self.target_language
    "Chinese"
  end

  def self.destination_language
    "English"
  end
end

# r g zhdict currently generates:
#
#   * migration
#   * model
#   * thor seed task
#
# perhaps better would be a single:
#
#   * migration
#   * model
#   
#
# for Entry, and seeding tasks for each dict
