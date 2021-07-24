class Public::ContactsController < ApplicationController
  # お問い合わせ

  #お問い合わせ新規
  def new
    @contact = Contact.new
  end

  # 確認画面
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  # 入力内容に誤りがあった場合のbackアクション
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to done_path
    else
      render :new
    end
  end

  # 送信完了画面
  def done
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :name, :subject, :message)
  end

end
