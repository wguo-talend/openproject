#-- encoding: UTF-8

#-- copyright
# OpenProject is an open source project management software.
# Copyright (C) 2012-2020 the OpenProject GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

module Grids
  ##
  # Base calss for any grid-based model's copy service.
  class CopyService < ::BaseServices::Copy
    def initialize(user:, source:, contract_class: ::EmptyContract)
      super user: user, source: source, contract_class: contract_class
    end

    protected

    ##
    # Requires a class in the concrete model's namespace, e.g. Boards::Copy::WidgetsDependentService
    def copy_dependencies
      [
        Copy::WidgetsDependentService
      ]
    end

    def initialize_copy(source, params)
      grid = source.dup

      initialize_new_grid! grid, source, params

      ServiceResult.new success: grid.save, result: grid
    end

    def initialize_new_grid!(_new_grid, _original_grid, _params); end
  end
end
