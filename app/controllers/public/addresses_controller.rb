class Public::AddressesController < ApplicationController

  def index
    @new_address = Address.new
    @addresses = Address.all
  end

  def create
    @addresses = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end

end
