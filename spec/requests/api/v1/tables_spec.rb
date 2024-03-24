require 'rails_helper'

RSpec.describe '/api/v1/tables' do
  describe '#create' do
    it 'パラメータが正常な場合201が返ること' do
      post '/api/v1/tables', params: {
        table: {
          key_1: 1,
          key_2: {
            key_2_1: '001',
            key_2_2: '001',
          },
          key_3: [1000, 2000]
        }
      }
      expect(response).to have_http_status(:created)
    end

    it 'パラメータが不足している場合422が返ること' do
      post '/api/v1/tables', params: {
        table: {
          key_1: 1,
          key_3: [1000, 2000]
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'key_2のパラメータが不足している場合422が返ること' do
      post '/api/v1/tables', params: {
        table: {
          key_1: 1,
          key_2: {
            key_2_1: '001'
          },
          key_3: [1000, 2000]
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
