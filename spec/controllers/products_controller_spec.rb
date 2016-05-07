require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    def do_request
      get :index, product_filter: product_filter
    end

    def do_xhr_request
      xhr :get, :index, product_filter: product_filter
    end

    context 'rendering' do
      let(:product_filter) { nil }

      it 'renders products#index page' do
        do_request
        expect(response).to render_template :index
      end

      it 'renders products#index page with xhr request' do
        do_xhr_request
        expect(response).to render_template :index
      end
    end

    context 'filtering' do
      let(:new_balance) { create(:brand, name: 'New Balance') }
      let(:nike)        { create(:brand, name: 'Nike') }
      let(:adidas)      { create(:brand, name: 'Adidas') }
      let(:puma)        { create(:brand, name: 'Puma') }
      let(:fila)        { create(:brand, name: 'Fila') }
      let(:asics)       { create(:brand, name: 'ASICS') }
      
      let!(:new_balance_product) { create(:product, name: "New Balance Men's MX608V4 Training Shoe", price: 74.99, sku: 'MX608V4', brand: new_balance) }
      let!(:nike_product)        { create(:product, name: "Nike Free 4.0 Flyknit Sz 13 Mens Running Shoes", price: 125.00, sku: 'MX608V4', brand: nike) }
      let!(:adidas_product)      { create(:product, name: "Adidas Performance Men's Galactic Elite M Running Shoe", price: 62.99, sku: 'MX608V4', brand: adidas) }
      let!(:puma_product)        { create(:product, name: "PUMA Men's Tazon 6 Cross-Training Shoe", price: 99.99, sku: 'MX608V4', brand: puma) }
      let!(:fila_product)        { create(:product, name: "Fila Men's Shake N Bake 3 Basketball Shoe", price: 103.98, sku: 'MX608V4', brand: fila) }
      let!(:asics_product)       { create(:product, name: "ASICS Women's Gel Challenger 10 Tennis Shoe", price: 100.00, sku: 'MX608V4', brand: asics) }
      
      context 'filter by brands' do
        let(:product_filter) { { brand_ids: [new_balance.id, nike.id, adidas.id] } }

        it 'returns product of specified brands' do
          do_request
          expect(assigns(:products)).to match_array [new_balance_product, nike_product, adidas_product]
        end
      end

      context 'filter by min and max prices' do
        let(:product_filter) { { min_price: '50', max_price: '100' } }

        it 'returns product of specified min and max prices' do
          do_request
          expect(assigns(:products)).to match_array [new_balance_product, adidas_product, puma_product, asics_product]
        end
      end

      context 'filter by min price' do
        let(:product_filter) { { min_price: '70' } }

        it 'returns product of specified min price' do
          do_request
          expect(assigns(:products)).to match_array [new_balance_product, nike_product, puma_product, asics_product, fila_product]
        end
      end

      context 'filter by max price' do
        let(:product_filter) { { max_price: '70' } }

        it 'returns product of specified max price' do
          do_request
          expect(assigns(:products)).to eq [adidas_product]
        end
      end

      context 'sort by alphabetical' do
        let(:product_filter) { { sort_by: 'Alphabetical' } }

        it 'returns product of specified brands' do
          do_request
          expect(assigns(:products).first).to eq asics_product
          expect(assigns(:products).last).to eq puma_product
        end
      end

      context 'sort by ASC Price' do
        let(:product_filter) { { sort_by: 'ASC Price' } }

        it 'returns products ordered by asc price' do
          do_request
          expect(assigns(:products).first).to eq adidas_product
          expect(assigns(:products).last).to eq nike_product
        end
      end

      context 'sort by DESC Price' do
        let(:product_filter) { { sort_by: 'DESC Price' } }

        it 'returns products ordered by desc price' do
          do_request
          expect(assigns(:products).first).to eq nike_product
          expect(assigns(:products).last).to eq adidas_product
        end
      end
    end
  end
end