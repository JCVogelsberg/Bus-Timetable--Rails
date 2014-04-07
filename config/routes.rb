BusTimetable::Application.routes.draw do
  resources :stations

  resources :lines
end
