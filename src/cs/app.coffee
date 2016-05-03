angular.module 'phone-book', ['ui.router']

angular.module('phone-book').config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state 'home',
      url: '/'
      templateUrl: './home.html'
      controller: 'mainCtrl'
  $urlRouterProvider.otherwise('/');
]
