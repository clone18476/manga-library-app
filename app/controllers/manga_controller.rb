class MangasController < ApplicationController

    get '/mangas' do
        if logged_in?
            @mangas = Manga.all.sort_by{|h| h[:title]}
            @user = current_user
            erb :'mangas/feed'
        else
            redirect to "/login"
        end
    end

    
    get '/mangas/new' do
        @user = current_user
        if logged_in?
            erb :'mangas/new'
        else
            redirect to "/login"
        end
    end
    
    post '/mangas' do
        if params[:title] !=""
            @manga = Manga.create(
                title: params[:title],
                issue: params[:issue],
                publisher: params[:publisher],
                arc: params[:arc],
                writer: params[:writer],
                artist: params[:artist],
                rating: params[:rating],
                review: params[:review]    
            )
            @manga.user_id = current_user.id
            @manga.save
            redirect to "/mangas/#{@manga.id}"
        else
            flash[:message] = "A manga title is required to add it to your library." 
            redirect to "/mangas/new"
        end
    end

    get '/mangas/:id' do
        @user = current_user
        if logged_in?
            @manga = Manga.find_by_id(params[:id])
            erb :'/mangas/show'
        else
            redirect to "/login"
        end
    end

    get '/mangas/:id/edit' do
        @manga = Manga.find_by_id(params[:id])
        if logged_in? && current_user.id == @manga.user_id
            erb :'mangas/edit'
        else 
            redirect to "/mangas"
        end
    end

    patch '/mangas/:id' do
        @manga = Manga.find_by_id(params[:id])

        if params[:manga][:title] != ""
            @manga.title = params[:manga][:title]
            @manga.issue = params[:manga][:issue]
            @manga.publisher = params[:manga][:publisher]
            @manga.arc = params[:manga][:arc]
            @manga.writer = params[:manga][:writer]
            @manga.artist = params[:manga][:artist]
            @manga.rating = params[:manga][:rating]
            @manga.review = params[:manga][:review]
            @manga.save

            redirect to "/mangas/#{@manga.id}"
        else
            flash[:message] = "Your manga must have a title."
            redirect to "/mangas/#{@manga.id}/edit"
        end
    end

    delete '/mangas/:id' do
        @manga = Manga.find_by_id(params[:id])
        @user = current_user
        if logged_in? && current_user.id == @manga.user_id
            @manga.delete
            redirect to "/users/#{@user.id}"
        else
            redirect to "/mangas"
        end
    end 
end