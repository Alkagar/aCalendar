ACalendar::Application.routes.draw do

    # You can have the root of your site routed with "root"
    # just remember to delete public/index.html.

    scope "(/:locale)", :locale => /pl|en/ do  
        match 'help' => 'application#help'
        resources :users do
            collection do
                match 'login'
                match 'logout'
            end
        end
    end

    root :to => 'application#index'
    match '/:locale' => 'application#index'

    # This is a legacy wild controller route that's not recommended for RESTful applications.
    # Note: This route will make all actions in every controller accessible via GET requests.
    #match ':controller(/:action(/*args))(.:format)', :args => /[a-zA-Z0-9\/-]{0,}/
end
