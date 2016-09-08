class PagesController < ApplicationController
  def home
  end

  def portfolio
  end

  def contact
  end

  def cv
  end

  def receive
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )

    if email.has_attachments?
      email.attachments.each do |attachment|
        page.attachments.create({
          file: attachment,
          description: email.subject
        })
      end
    end
  end

   private

  def set_pages
    @product = Product.find(params[:id])
  end

  def pages_params
    params.require(:product).permit(:name, :price, :description, :brand, :ecommerce, :category, :tracking_number, :purchase_date, :photo, :user_id)
  end
end
