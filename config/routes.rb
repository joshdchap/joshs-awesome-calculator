Rails.application.routes.draw do
  get 'calculator/index'
  post 'calculator/calculate'
  get 'calculator/calculate' => 'calculator#index'

  root 'calculator#index'

end
