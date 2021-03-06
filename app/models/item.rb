# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id         :bigint(8)        not null, primary key
#  parent_id  :integer          default(0)
#  name       :string
#  level      :integer          default(0)
#  sort       :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ApplicationRecord
  belongs_to :parent, class_name: 'Item', foreign_key: 'parent_id', optional: true
  has_many :children, class_name: 'Item', foreign_key: 'parent_id'
end
