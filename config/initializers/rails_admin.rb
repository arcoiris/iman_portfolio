RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  config.model 'Event' do |config|
    edit do  
      field :title
      field :date
      field :time
      field :description, :wysihtml5
    end
  end

  config.model 'Photo' do |config|
    field :photo  
    field :caption
    field :photographer
    field :photo_type
    field :created_at
    field :updated_at
    field :id 
  end
  
  config.model 'User' do |config|
    field :email
    field :password
    field :password_confirmation
  end
  
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
    
    config.authorize_with do
      if current_user.nil?
        redirect_to main_app.admin_url
      end
    end
  end
end
