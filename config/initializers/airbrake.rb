# -*- coding: utf-8 -*-
# encoding: UTF-8

require 'airbrake-ruby'

Airbrake.configure do |c|
  c.project_id = 'id'
  c.project_key = 'key'
end
