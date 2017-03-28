class FriendrequestsController < ApplicationController
  def index
    @friendrequests = Friendrequest.page(params[:page]).per(10)

    render("friendrequests/index.html.erb")
  end

  def show
    @friendrequest = Friendrequest.find(params[:id])

    render("friendrequests/show.html.erb")
  end

  def new
    @friendrequest = Friendrequest.new

    render("friendrequests/new.html.erb")
  end

  def create
    @friendrequest = Friendrequest.new

    @friendrequest.sender_id = params[:sender_id]
    @friendrequest.recipient_id = params[:recipient_id]

    save_status = @friendrequest.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/friendrequests/new", "/create_friendrequest"
        redirect_to("/friendrequests")
      else
        redirect_back(:fallback_location => "/", :notice => "Friendrequest created successfully.")
      end
    else
      render("friendrequests/new.html.erb")
    end
  end

  def edit
    @friendrequest = Friendrequest.find(params[:id])

    render("friendrequests/edit.html.erb")
  end

  def update
    @friendrequest = Friendrequest.find(params[:id])

    @friendrequest.sender_id = params[:sender_id]
    @friendrequest.recipient_id = params[:recipient_id]

    save_status = @friendrequest.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/friendrequests/#{@friendrequest.id}/edit", "/update_friendrequest"
        redirect_to("/friendrequests/#{@friendrequest.id}", :notice => "Friendrequest updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Friendrequest updated successfully.")
      end
    else
      render("friendrequests/edit.html.erb")
    end
  end

  def destroy
    @friendrequest = Friendrequest.find(params[:id])

    @friendrequest.destroy

    if URI(request.referer).path == "/friendrequests/#{@friendrequest.id}"
      redirect_to("/", :notice => "Friendrequest deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Friendrequest deleted.")
    end
  end
end
