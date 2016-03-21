# require 'rails_helper'

# describe 'Request API' do

#   describe 'GET /find_nomenclature_repairs' do

#     let!(:vendor) { create(:vendor) }
#     let!(:category_sale) { create(:category_sale) }
#     let!(:nomenclature_repair) { create(:nomenclature_repair, vendor: vendor, category_sale: category_sale) }

#     it "find_nomenclature_repairs" do

#       get '/api/requests/find_nomenclature_repairs', format: :json, vendor: vendor.id, category_sale: category_sale.id

#       expect(response.body).to have_json_size(1).at_path("requests")
#     end

#     it "empty model" do
#       get '/api/requests/find_nomenclature_repairs', format: :json
#       expect(response.body).to have_json_size(0).at_path("requests")
#     end

#   end

# end

