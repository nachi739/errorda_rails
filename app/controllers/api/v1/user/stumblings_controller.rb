class Api::V1::User::StumblingsController < ApplicationController

    skip_before_action :verify_authenticity_token, only: [:create, :searching]
    #CSRFトークン検証をスキップするため

    def index
        @stumblings = Stumbling.select("search_key") #veiw側で表示するため
    end
    def create
        user = User.find_by(name: 'error') || User.create(name: 'error')
            #該当のデータを引っ張って来る           #なければ新しく作成する
            stu = Stumbling.new(user_name: user.name, search_key: params[:search_key])
            stu.save
        p params #postで投げられた値を受け取る
        render json: {test:"test"}
    end
    def edit
    end
    def show
        #raise "huga"
    end
    def update
        p params #postで投げられた値を更新する
    end
    def searching

        user = User.find_by(name: 'error') || User.create(name: 'error')

        searching_error = user.stumblings.where(end_time: nil).first || ''
        #今なんの検索をしているのかを向こうに渡している


        render json: searching_error
    end
    def end_time

        user = User.find_by(name: 'error') || User.create(name: 'error')

    end
end