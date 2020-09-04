require 'rails_helper'

describe '', type: :system do
  describe '' do
    before do
      # ユーザＡを作成
      employee_test = FactoryBot.create(:employee, name: 'ユーザーＡ', employee_id: 'a_employee')

    end


    context 'ユーザーＡがログインしているとき' do
      before do
        # ユーザーＡがログインする
        visit login_path
        fill_in 'ユーザーID', with: 'a_employee'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
      end

      it 'ユーザーＡが作成したUerが表示される' do
        # 作成済のタスクの名称が画面女王に表示されていることを確認
        expect(page).to have_content 'ログイン'
      end
    end
  end
end
