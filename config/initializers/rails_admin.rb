RailsAdmin.config do |config|

  ### Popular gems integration
  config.model 'Category' do
    edit do
      field :category_name
    end
  end

  config.model 'Video' do
    create do
      def before_save(resource)
        video = Yt::Video.new url: resource.link
        resource.uid = video.id
        resource.title = video.title
        resource.published_at = video.published_at
      rescue Yt::Errors::NoItems
        resource.title = ''
      end
    end
  end

##   == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin
  end


  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
