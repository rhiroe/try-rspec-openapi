class Api::V1::TablesController < ApplicationController
  def create
    if Set.new(table_params.keys) != Set.new(%w[key_1 key_2 key_3])
      return head :unprocessable_entity
    end
    if Set.new(table_params[:key_2].keys) != Set.new(%w[key_2_1 key_2_2])
      return head :unprocessable_entity
    end

    head :created
  end

  private

  def table_params
    params.require(:table).permit(
      :key_1,
      key_2: %i[key_2_1 key_2_2],
      key_3: []
    )
  end
end
