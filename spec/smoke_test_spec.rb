# frozen_string_literal: true

RSpec.describe 'Smoke tests' do
  specify '' do
    class CityAddress < SmartCore::ValueObject
      attribute :city, 'string', strict: true
      attribute :street, 'string', strict: true
      property :house, 'numeric', strict: true
      property :cords, 'float', strict: true
    end

    khabarovsk_address = CityAddress.new('Khabarovsk', 'Bolshaia', house: 10, cords: 22.1)
    saint_petersburg_address = CityAddress.new('Saint-Petersburg', 'Komenda', house: 5, cords: 0.1)

    aggregate_failures do
      expect(khabarovsk_address.city).to eq('Khabarovsk')
      expect(khabarovsk_address.street).to eq('Bolshaia')
      expect(khabarovsk_address.house).to eq(10)
      expect(khabarovsk_address.cords).to eq(22.1)
      expect(khabarovsk_address.__attributes__).to match({
        city: 'Khabarovsk',
        street: 'Bolshaia'
      })
      expect(khabarovsk_address.__properties__).to match({
        house: 10,
        cords: 22.1
      })
      expect(khabarovsk_address.__params__).to match({
        city: 'Khabarovsk',
        street: 'Bolshaia',
        house: 10,
        cords: 22.1
      })

      expect(khabarovsk_address.frozen?).to eq(true)

      expect(khabarovsk_address).not_to respond_to(:city=)
      expect(khabarovsk_address).not_to respond_to(:street=)
      expect(khabarovsk_address).not_to respond_to(:house=)
      expect(khabarovsk_address).not_to respond_to(:cords=)
    end

    aggregate_failures do
      expect(saint_petersburg_address.city).to eq('Saint-Petersburg')
      expect(saint_petersburg_address.street).to eq('Komenda')
      expect(saint_petersburg_address.house).to eq(5)
      expect(saint_petersburg_address.cords).to eq(0.1)
      expect(saint_petersburg_address.__attributes__).to match({
        city: 'Saint-Petersburg',
        street: 'Komenda'
      })
      expect(saint_petersburg_address.__properties__).to match({
        house: 5,
        cords: 0.1
      })
      expect(saint_petersburg_address.__params__).to match({
        city: 'Saint-Petersburg',
        street: 'Komenda',
        house: 5,
        cords: 0.1
      })

      expect(saint_petersburg_address.frozen?).to eq(true)

      expect(saint_petersburg_address).not_to respond_to(:city=)
      expect(saint_petersburg_address).not_to respond_to(:street=)
      expect(saint_petersburg_address).not_to respond_to(:house=)
      expect(saint_petersburg_address).not_to respond_to(:cords=)
    end
  end
end
